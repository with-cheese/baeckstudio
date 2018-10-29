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
    //private baseUrl: string = 'http://' + window.location.hostname + ':4200/api/';

    constructor(private http: HttpClient) { }

    fetch(resource: string): Observable <any[]> {
      const params = new HttpParams();
      let url: string = this.baseUrl + resource;
      return this.http.get(url).pipe(map(this.getData));
    }

    private getData(res: any) {
      if(res.data === null) {
          return [];
      }
      const result: object  = {
          data: res.data,
      };
      return [result] || [];
    }

}