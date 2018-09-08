import { Component, OnInit, OnChanges } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'baeck';
  page = 'about';
  animateMenu = false;

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

  ngOnInit() {
    setTimeout(() => { window.scroll(0,0); }, 400);
  	setTimeout(() => { this.animateMenu = true; }, 500);
  	
  	console.log('hej');
  }

  getUrl(name: string) {
  	return 'url(../assets/photos/' + name + ')';
  }
}
