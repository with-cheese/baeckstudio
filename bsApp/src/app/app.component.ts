import { Component, OnInit, OnChanges } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'baeck';
  page = 'portfolio';
  animateMenu = false;

  images: any[] = [
  	{name: '1.jpg'},
  	{name: '2.jpg'},
  	{name: '3.jpg'},
  	{name: '4.jpg'},
  	{name: '5.jpg'},
  	{name: '6.jpg'},
  	{name: '7.jpg'},
  	{name: '8.jpg'}
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
