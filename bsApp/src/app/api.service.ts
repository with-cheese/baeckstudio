import { Injectable } from '@angular/core';
import { HttpResponse, HttpClient, HttpParams } from '@angular/common/http';
import { ActivatedRoute, Params, Router, UrlSegment } from '@angular/router';
import { FormGroup } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

import { environment } from '../environments/environment';

@Injectable()
export class ApiService  {

    private baseUrl: string = 'http://35.228.169.12/api/';
    // private baseUrl: string = 'http://' + window.location.hostname + '/api/';


    constructor(private http: HttpClient) { }

    fetch(resource: string): Observable <any[]> {
        // GET
        const params = new HttpParams();
        let url: string = this.baseUrl + resource;

        return this.http.get(url)
            .pipe(map(this.extractData));    
    }

    private extractData(res: any) {
        const body = res.json();
        if (body.data === null) {
            return [];
        }
        const result: object  = {
            data: body.data,
            meta: body.meta
        };
        return [result] || [];
    }

    private handleError (error: Response | any) {
        let errMsg: string;

        if (typeof error._body != 'undefined') {
            try {
                error._body = JSON.parse(error._body);
            } catch (e) {
                error._body = '';
            }
        }
    }
}