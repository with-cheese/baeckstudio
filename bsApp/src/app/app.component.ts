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
  	{name: 'startsida_bakgrund.png'},
    {name: 'bildspel_01.png'},
    {name: 'bildspel_02.png'},
    {name: 'bildspel_03.png'},
    {name: 'bildspel_04.png'},
    {name: 'bildspel_05.png'},
    {name: 'bildspel_06.png'},
    {name: 'bildspel_07.png'},
    {name: 'bildspel_08.png'},
    {name: 'bildspel_09.png'},
    {name: 'bildspel_10.png'},
  	{name: 'bildspel_11.png'}
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
