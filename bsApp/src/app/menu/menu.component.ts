import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-menu',
    templateUrl: './menu.component.html',
    styleUrls: ['./menu.component.css']
})
export class MenuComponent implements OnInit {

    animate =  false;
    page = null;
    constructor() { }

    ngOnInit() {
        setTimeout(() => { this.animate = true }, 500);
    }

}
