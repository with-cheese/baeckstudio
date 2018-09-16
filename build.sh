#!/bin/bash
cd bsApp
npm install
ng build --prod --configuration production --base-href / --delete-output-path=false --output-path=../../build