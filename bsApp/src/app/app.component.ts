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
  animateMenu = false;
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


}
