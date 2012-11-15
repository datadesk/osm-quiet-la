/* ---- ROADS ---- */


/* Motorway */
.route.line[highway='motorway'][tunnel='no'],
.route.tunnel[highway='motorway'] {
  [zoom>=9] { line-color:@motorway_line; line-cap:round; line-join:round; }
  .tunnel[zoom>=9] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  [zoom=9] { line-width:0.8; }
  [zoom=10]{ line-width:1.0; }
  [zoom=11]{ line-width:1.0 + 1.8; }
  [zoom=12]{ line-width:1.2 + 2; }
  [zoom=13]{ line-width:2 + 2; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:6 + 2; }
}
.route.bridge::b[highway='motorway'] {
  [zoom>=9] { line-color:spin(darken(@motorway_line,15),-10); line-cap:butt; line-join:round; }
  [zoom=9] { line-width:0.8 ; }
  [zoom=10]{ line-width:1.0; }
  [zoom=11]{ line-width:1.0; }
  [zoom=12]{ line-width:1.2 ; }
  [zoom=13]{ line-width:2; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:6; }
}
.route.fill[highway='motorway'] {
  [zoom>=9]{ line-color:@motorway_fill; line-cap:round; line-join:round; }
  [zoom>10][tunnel='yes'] { line-color:lighten(@motorway_fill,10); }
  [zoom=11]{ line-width:1.0; }
  [zoom=12]{ line-width:1.2; }
  [zoom=13]{ line-width:2; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:6; }
}

/* Trunk */
.route.line[highway='trunk'][tunnel='no'],
.route.tunnel[highway='trunk'] {
  [zoom>6] { line-color:@trunk_line; line-cap:round; line-join:round; }
  .tunnel[zoom>6] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  [zoom=7] { line-width:0.3; line-opacity:0.6; }
  [zoom=8] { line-width:0.5; line-opacity:0.8; }
  [zoom=9] { line-width:0.7; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:0.8 + 1.8; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.4; }
  [zoom=14]{ line-width:3 + 2; }
  [zoom=15]{ line-width:5 + 2; }
}

.route.bridge::b[highway='trunk'] {
  [zoom>6] { line-color:spin(darken(@trunk_line,15),-10); line-cap:butt; line-join:round; }
  [zoom=7] { line-width:0.3; }
  [zoom=8] { line-width:0.5; }
  [zoom=9] { line-width:0.7 + 1; }
  [zoom=10]{ line-width:0.8 + 1; }
  [zoom=11]{ line-width:0.8 + 1.8; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.4 ; }
  [zoom=14]{ line-width:3 + 2; }
  [zoom=15]{ line-width:5 + 2; }
}
.route.fill[highway='trunk'] {
  [zoom>10]{ line-color:@trunk_fill; line-cap:round; line-join:round; }
  [zoom>10][tunnel='yes'] { line-color:lighten(@trunk_fill,10); }
  [zoom=11]{ line-width:0.8; }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.4; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:5; }
}

/* Primary */
.route.line[highway='primary'][tunnel='no'],
.route.tunnel[highway='primary'] {
  [zoom>6] { line-color:@primary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>6] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  [zoom=7] { line-width:0.2; line-opacity:0.6; }
  [zoom=8] { line-width:0.4; line-opacity:0.8; }
  [zoom=9] { line-width:0.6; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:0.8 + 1.8; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.5; }
  [zoom=14]{ line-width:2.5; }
  [zoom=15]{ line-width:5 + 2; }
}
.route.bridge::b[highway='primary'] {
  [zoom>6] { line-color:spin(darken(@primary_line,15),-10); line-cap:butt; line-join:round; }
  [zoom=7] { line-width:0.2 + 1; }
  [zoom=8] { line-width:0.4 + 1; }
  [zoom=9] { line-width:0.6 + 1; }
  [zoom=10]{ line-width:0.8 + 1; }
  [zoom=11]{ line-width:0.8 + 1.8; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.5; }
  [zoom=14]{ line-width:2.5; }
  [zoom=15]{ line-width:5 + 2; }
}
.route.fill[highway='primary'] {
  [zoom>10]{ line-color:@primary_fill; line-cap:round; line-join:round; }
  [zoom>10][tunnel='yes'] { line-color:lighten(@primary_fill,10); }
  [zoom=11]{ line-width:0.8; }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.5; }
  [zoom=14]{ line-width:2.5; }
  [zoom=15]{ line-width:5; }
}

/* Secondary */
.route.line[highway='secondary'][tunnel='no'],
.route.tunnel[highway='secondary'] {
  [zoom>7] { line-color:@road_line; line-cap:round; line-join:round; }
  .tunnel[zoom>7] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  [zoom=8] { line-width:0.3; line-opacity:0.8; }
  [zoom=9] { line-width:0.5; }
  [zoom=10]{ line-width:0.7; }
  [zoom=11]{ line-width:0.9; }
  [zoom>11]{ line-color:@secondary_line; }
  [zoom=12]{ line-width:0.9 + 2; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:4 + 2; }
}
.route.bridge::b[highway='secondary'] {
  [zoom>7] { line-color:spin(darken(@road_line,15),-10); line-cap:butt; line-join:round; }
  [zoom=8] { line-width:0.3; }
  [zoom=9] { line-width:0.5; }
  [zoom=10]{ line-width:0.7; }
  [zoom=11]{ line-width:0.9; }
  [zoom>11]{ line-color:spin(darken(@secondary_line,15),-10); }
  [zoom=12]{ line-width:0.9 + 2; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:4 + 2; }
}
.route.fill[highway='secondary'] {
  [zoom>11]{ line-color:@secondary_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@secondary_fill,10); }
  [zoom=12]{ line-width:0.9; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:4; }
}

/* Service/Access */
.route.line[highway='service'] {
  [zoom>12]{ line-color:@access_line; line-cap:square; line-join:round; }
  [zoom=13]{ line-width:0.2; line-opacity:0.4; }
  [zoom=14]{ line-width:0.4; line-opacity:0.6; }
  [zoom=15]{ line-width:1; line-opacity:0.8; }
}
.route.fill[highway='service'] {
  [zoom>15]{ line-color:@access_fill; line-cap:square; line-join:round; }
}

/* Motorway Links */
.route.line[highway='motorway_link'][tunnel='no'],
.route.tunnel[highway='motorway_link'] {
  [zoom>9] { line-color:lighten(@motorway_line,10); line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 1; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5 + 1; }
}
.route.bridge::b[highway='motorway_link'] {
  [zoom>9] { line-color:darken(@motorway_line,15); line-cap:butt; line-join:round; }
  [zoom=10]{ line-width:0.8 + 1; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5 + 2; }
}
.route.fill[highway='motorway_link'] {
  [zoom>11]{ line-color:@motorway_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@motorway_fill,10); }
  /*[zoom=11]{ line-width:0.8; }*/
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}

/* Trunk Links */
.route.line[highway='trunk_link'][tunnel='no'],
.route.tunnel[highway='trunk_link'] {
  [zoom>9] { line-color:@trunk_line; line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5 + 2; }
}
.route.bridge::b[highway='trunk_link'] {
  [zoom>9] { line-color:darken(@trunk_line,15); line-cap:butt; line-join:round; }
  [zoom=10]{ line-width:0.8 + 1; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5 + 2; }
}
.route.fill[highway='trunk_link'] {
  [zoom>11]{ line-color:@trunk_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@trunk_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}

/* Primary Links */
.route.line[highway='primary_link'][tunnel='no'],
.route.tunnel[highway='primary_link'] {
  [zoom>9] { line-color:@primary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}
.route.bridge::b[highway='primary_link'] {
  [zoom>9] { line-color:darken(@primary_line,15); line-cap:butt; line-join:round; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}
.route.fill[highway='primary_link'] {
  [zoom>11]{ line-color:@primary_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@primary_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}

/* Secondary Links */
.route.line[highway='secondary_link'][tunnel='no'],
.route.tunnel[highway='secondary_link'] {
  [zoom>9] { line-color:@secondary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>9] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.6; }
  [zoom=11]{ line-width:0.8; }
  [zoom=12]{ line-width:0.9; }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}
.route.bridge::b[highway='secondary_link'] {
  [zoom>9] { line-color:darken(@secondary_line,15); line-cap:butt; line-join:round; }
  [zoom=10]{ line-width:0.6; }
  [zoom=11]{ line-width:0.8; }
  [zoom=12]{ line-width:0.9; }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}
.route.fill[highway='secondary_link'] {
  [zoom>11]{ line-color:@secondary_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@secondary_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:1.2; }
  [zoom=15]{ line-width:3.5; }
}

/* Standard/Unknown */
.route.line[highway='living_street'],
.route.line[highway='residential'],
.route.line[highway='road'],
.route.line[highway='tertiary'],
.route.line[highway='tertiary_link'],
.route.line[highway='unclassified'] {
  [zoom>9] { line-color:@road_line; line-cap:round; line-join:round; }
  [zoom=10]{ line-width:0.2; line-opacity:0.4; }
  [zoom=11]{ line-width:0.4; line-opacity:0.6; }
  [zoom=12]{ line-width:0.6; line-opacity:0.8; }
  [zoom=13]{ line-width:0.8; }
  [zoom=14]{ line-width:1.0; }
  [zoom=15]{ line-width:3.5; }
}
.route.bridge::b[highway='living_street'],
.route.bridge::b[highway='residential'],
.route.bridge::b[highway='road'],
.route.bridge::b[highway='tertiary'],
.route.bridge::b[highway='tertiary_link'],
.route.bridge::b[highway='unclassified'] {
  [zoom>9] { line-color:spin(darken(@road_line,15),-10); line-cap:butt; line-join:round; }
  [zoom=10]{ line-width:0.2 + 1; }
  [zoom=11]{ line-width:0.4 + 1; }
  [zoom=12]{ line-width:0.6 + 1; }
  [zoom=13]{ line-width:0.8 + 1; }
  [zoom=14]{ line-width:1.0; }
  [zoom=15]{ line-width:3.5 + 2; }
}
.route.fill[highway='living_street'],
.route.fill[highway='residential'],
.route.fill[highway='road'],
.route.fill[highway='tertiary'],
.route.fill[highway='tertiary_link'],
.route.fill[highway='unclassified'] {
  [zoom>13]{ line-color:@road_fill; line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1.0; }
  [zoom=15]{ line-width:3.5; }
}



/* ---- TURNING CIRCLES ---- */

.turning-circle[zoom>=14] {
  marker-fill:@road_fill;
  marker-line-color:@road_line;
  marker-line-width:1;
  [zoom=14] { marker-width: 2; }
  [zoom=15] { marker-width: 4; }
  [zoom=16] { marker-width: 7; }
  [zoom=17] { marker-width: 9; }
  [zoom>17] { marker-width: 12; marker-line-width: 1.5; }
}

/* ---- ONE WAY ARROWS ---- */
/* TODO: oneway='-1' */
.highway-label::arrow[oneway='yes'][zoom>15] {
  marker-type:arrow;
  marker-line-width:1;
  marker-line-opacity:0.5;
  marker-line-color:#fff;
  marker-spacing: 300;
  marker-fill:darken(@motorway_line,10);
  marker-opacity:0.8;
}

/* ---- AERO ---- */
#aerodrome[zoom>9] {
  polygon-fill: @aerodrome;
  [zoom>13] { line-color: darken(@aerodrome, 10); }
  [zoom=14] { line-width:0.6; }
  [zoom=15] { line-width:0.8; }
} 

.route.line[aeroway='runway'][zoom>=11],
.route.line[aeroway='taxiway'][zoom>=11] {
  line-cap: square;
  line-color:@runway;
}

.route.line[aeroway='runway'] {
  line-color:@runway;
  [zoom=11] { line-width: 2; }
  [zoom=12] { line-width: 1 + 2; }
  [zoom=13] { line-width: 3 + 2; }
  [zoom=14] { line-width: 9 + 2; }
  [zoom=15] { line-width: 16 + 2; }
}

.route.fill[aeroway='runway'] {
  line-color:@runway;
  polygon-fill: @runway;
  [zoom=12] { line-width: 1; }
  [zoom=13] { line-width: 3; }
  [zoom=14] { line-width: 9; }
  [zoom=15] { line-width: 16; }
}

.route.line[aeroway='taxiway'] {
  line-color:@runway;
  [zoom=11] { line-width: 1; }
  [zoom=12] { line-width: 0.8 + 1.8; }
  [zoom=13] { line-width: 1 + 2; }
  [zoom=14] { line-width: 2 + 2; }
  [zoom=15] { line-width: 6 + 2; }
}

.route.fill[aeroway='taxiway'] {
  line-color:@runway;
  polygon-fill: @runway;
  [zoom=12] { line-width: 0.8; }
  [zoom=13] { line-width: 1; }
  [zoom=14] { line-width: 2; }
  [zoom=15] { line-width: 6; }
}

/* ---- PARKING ---- */
.parking[zoom>13] {
  polygon-fill:lighten(@land,3);
  line-color:darken(@land,6);
  [zoom=14] { line-width:0.4; }
  [zoom=15] { line-width:0.6; }
  [zoom>15] { line-width:0.8; }
}

/* ---- RAILWAYS ---- */
/* TODO: Railway bridges */
.route.fill[railway='rail'][zoom>10] {
  line-color:@rail;
  line-width:0.3;
  line-dasharray:4,3;
  ::x {
    line-color:lighten(@rail,10);
    line-dasharray:0,4,3,0;
    line-width:0.3;
  }
  [zoom=13], ::x[zoom<14] { line-width:0.4; }
  [zoom=14], ::x[zoom=14] { line-width:0.5; }
  [zoom=15], ::x[zoom=15] { line-width:0.6; }
  [zoom=16], ::x[zoom=16] { line-width:0.8; }
  [zoom=17], ::x[zoom=17] { line-width:1.5; }
  [zoom=18], ::x[zoom=18] { line-width:2.0; }
}