import { Component, OnInit, OnChanges } from '@angular/core';
import { ApiService } from './api.service';
declare var externalJS: any;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'baeck';
  page = 'back';
  aIndex = 0;
  selectedProject = {images: []};
  animateMenu = false;
  debug = false;
  works: any[];
  images: any[];
  imagesOverview: any[];
  animateThis: string[] = [];

  constructor(private apiService: ApiService) {}

  ngOnInit() {
    setTimeout(() => { window.scroll(0,0); }, 400);
    setTimeout(() => { this.animateMenu = true; }, 500);
    this.getWorks();
    this.getSlides();
    this.getOverview();
  }

  getWorks() {
    this.apiService.fetch('works')
        .subscribe(result      => this.works = result[0].data,
                   error       => { },
                   ()          => {
                   });
  }

  getSlides() {
    this.apiService.fetch('works/images/slides')
      .subscribe(result      => { this.images = result[0].data; },
                 error       => { },
                 ()          => { });
  }

  getOverview() {
    this.apiService.fetch('works/images/overview')
      .subscribe(result      => { this.imagesOverview = result[0].data; },
                 error       => { },
                 ()          => { });
  }

  getWorkImages(work_id) {
    this.apiService.fetch('works/' + work_id + '/images')
      .subscribe(result      => { this.selectedProject.images = result[0].data; },
                 error       => { },
                 ()          => { });
  }

  getUrl(name: string) {
    return 'url(../assets/photos/' + name + ')';
  }

  isStanding(name: string) {
    let img = new Image();
    img.src = '../assets/photos/overview/' + name;
    if (img.width < img.height) {
      return true;
    }
    return false;
  }

  getProject(work_id) {
    this.page = 'project';
    this.selectedProject.images = [];
    for(let i = 0; i < this.works.length; i++) {
      if(this.works[i].id === work_id) {
        this.getWorkImages(work_id);
        this.selectedProject = this.works[i];
        break;
      }
    }
  }

  initCarousel() {
    setTimeout(() => { externalJS.initCarousel(); }, 500);
  }

  animateWork() {
    window.scrollTo(0, 0);
    this.animateThis = [];

    let order = Array.apply(null, {length: this.imagesOverview.length}).map(function(value, index){
      return index + 1;
    });

    order = this.shuffle(order);

    let index = 0;
    setTimeout(()=> {
      for (var x = 0, ln = this.imagesOverview.length; x < ln; x++) {
        setTimeout(() => {
          let name = order[index];
          this.animateThis.push(name);
          index++;
        }, x * 100, x);
      }
    }, 200);
  }

  shuffle(array) {
    let currentIndex = array.length, temporaryValue, randomIndex;

    while (0 !== currentIndex) {
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex -= 1;
      temporaryValue = array[currentIndex];
      array[currentIndex] = array[randomIndex];
      array[randomIndex] = temporaryValue;
    }

    return array;
  }

  inAnimateThis(name: string) {
    if (this.animateThis.indexOf(name) != -1) {
      return true;
    }
  }

  adjustImage(value: number, id: number, type: string) {
    //const index = this.theEye.images.findIndex(obj => obj.id == id);
    //this.theEye.images[index][type] = value;
  }

  changeAlignment(image: any) {
    if (image.alignment == 'left') {
      image.alignment = 'right';
    } else {
      image.alignment = 'left';
    }
  }

  showOverlay(image: any) {
    setTimeout(() => {image.overlay = true}, 10);
  }

  imageIsNotInViewPort(id: any) {
      let elem = document.getElementById(id);
      if (elem) {
        let top = elem.scrollTop;
        if (top > window.innerHeight) {
          return true;
        }
      }
      return false;
  }

  devmode() {
    this.debug = !this.debug;
  }

}
