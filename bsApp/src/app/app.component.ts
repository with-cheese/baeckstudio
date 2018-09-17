import { Component, OnInit, OnChanges } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'baeck';
  page = 'about';
  aIndex = 0;
  selectedProject = null;
  animateMenu = false;
  debug = false;
  animateThis: string[] = [];

  images: any[] = [
  	{name: 'startsida_bakgrund.png', title: '', subtitle: ''},
    {name: 'bildspel_01.png', title: 'The Eye', subtitle: 'Book Design'},
    {name: 'bildspel_02.png', title: 'Näfveqvarn', subtitle: 'Identity Redesign'},
    {name: 'bildspel_03.png', title: 'Om Döden', subtitle: 'Book Design'},
    {name: 'bildspel_04.png', title: '+Rolf', subtitle: 'Identity' },
    {name: 'bildspel_05.png', title: 'The Eye', subtitle: 'Book Design'},
    {name: 'bildspel_06.png', title: 'Vi hade fel', subtitle: 'Book Design'},
    {name: 'bildspel_07.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: 'bildspel_08.png', title: 'Swedish Grace', subtitle: 'Book Design'},
    {name: 'bildspel_09.png', title: 'Vi hade fel', subtitle: 'Book Design'},
    {name: 'bildspel_10.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
  	{name: 'bildspel_11.png', title: 'Swedish Grace', subtitle: 'Book Design'}
  ];

  imagesOversikt: any[] = [
    {name: '1.png', title: 'The Eye', subtitle: 'Book Design'},
    {name: '2.png', title: 'Näfveqvarn', subtitle: 'Identity Redesign'},
    {name: '3.png', title: 'Om Döden', subtitle: 'Book Design'},
    {name: '4.png', title: '+Rolf', subtitle: 'Identity' },
    {name: '5.png', title: 'The Eye', subtitle: 'Book Design'},
    {name: '6.png', title: 'Vi hade fel', subtitle: 'Book Design'},
    {name: '7.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '8.png', title: 'Swedish Grace', subtitle: 'Book Design'},
    {name: '9.png', title: 'Vi hade fel', subtitle: 'Book Design'},
    {name: '10.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '11.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '12.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '13.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '14.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '15.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '16.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '17.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '18.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '19.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '20.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '21.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
    {name: '22.png', title: 'Emma Fällman', subtitle: 'Art Direction'},
  ];

  theEye: any = {
    images: [
      {id: 1, url: 'the_eye/The_Eye_02.png', width: 29, alignment: 'left', distance: 10, top: 0},
      {id: 2, url: 'the_eye/The_Eye_01.png', width: 53, alignment: 'right', distance: 0, top: -10},
      {id: 3, url: 'the_eye/The_Eye_03.png', width: 50, alignment: 'right', distance: 41, top: 7},
      {id: 5, url: 'the_eye/The_Eye_05.png', width: 31, alignment: 'right', distance: 0, top: -22},
      {id: 6, url: 'the_eye/The_Eye_06.png', width: 50, alignment: 'left', distance: 0, top: -12},
      {id: 7, url: 'the_eye/The_Eye_07.png', width: 66, alignment: 'right', distance: 13, top: 7},
      {id: 4, url: 'the_eye/The_Eye_04.png', width: 50, alignment: 'right', distance: 0, top: 9}
      ],
    name: 'The eye by fotografiska',
    type: 'Book Design',
    info: 'The Eye is a provocative, absurd, beautiful and revolutionary book celebrating the spirit of Fotografiska – the museum of contemporary photography in Stockholm. The book features work from iconic photographers including Ellen von Unwerth, Anton Corbijn, Sarah Moon and Guy Bourdin as well as interviews, anecdotes and behind-the-scenes stories of past Fotografiska exhibitions. Curator and Creative Director: Johan Lindskog. Published by teNeues 2018.'
  }


  ngOnInit() {
    setTimeout(() => { window.scroll(0,0); }, 400);
  	setTimeout(() => { this.animateMenu = true; }, 500);
  }

  getUrl(name: string) {
  	return 'url(../assets/photos/' + name + ')';
  }

  isStanding(name: string) {
    let img = new Image();
    img.src = '../assets/photos/oversikt/' + name;
    if (img.width < img.height) {
      return true;
    }
    return false;
  }

  getProject() {
    this.page = 'project';
    this.selectedProject = this.theEye;
  }


  animateWork() {
    window.scrollTo(0, 0);
    this.animateThis = [];

    let order = Array.apply(null, {length: this.imagesOversikt.length}).map(function(value, index){
      return index + 1;
    });

    order = this.shuffle(order);

    let index = 0;
    setTimeout(()=> {
      for (var x = 0, ln = this.imagesOversikt.length; x < ln; x++) {
        setTimeout(() => {
          let name = order[index] + '.png';
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
    const index = this.theEye.images.findIndex(obj => obj.id == id);
    console.log(index);
    this.theEye.images[index][type] = value;
  }

  changeAlignment(image: any) {
    if (image.alignment == 'left') {
      image.alignment = 'right';
    } else {
      image.alignment = 'left';
    }
  }

  devmode() {
    this.debug = !this.debug;
    console.log(this);
  }

}
