.places {
  text-name: "";
  text-face-name: @sans;
  text-fill: @place_text;
  text-wrap-width: 30;
  text-line-spacing: 3;
  text-placement: interior;
  text-align: center;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-size: 11;
  text-min-distance:10;
}

#counties[zoom>=8][zoom<14] {
  text-name:"[NAMELSAD10]";
  text-face-name: @sans;
  text-transform: uppercase;
  text-character-spacing: 2;
  text-size:14;
  [zoom=8] {
    text-size:12.5;
    text-halo-radius:1.2;
  }
  [zoom=9] {
    text-size:13;
    text-halo-radius:1.3;
  }
  [zoom=10] {
    text-size:14;
    text-halo-radius:1.2;
  }
  [zoom=11] {
    text-size:15;
  }
  [zoom=12] {
    text-size:14;
  }
  [zoom>=13] {
    text-size:16;
  }
  // Skip LA county since we will use regions there instead.
  [zoom>8] {
    [NAMELSAD10='Los Angeles County'] {text-name:"''";}
  }
}

#regions[zoom>=9][zoom<12] {
  text-name:"[Name]";
  text-face-name: @sans;
  text-wrap-width: 45;
  [zoom=9] {
    text-size:12;
    text-halo-radius:1.2;
  }
  [zoom=10] {
    text-size:13;
    text-wrap-width: 60;
    text-halo-radius:1.2;
  }
  [zoom=11] {
    text-size:13;
    text-wrap-width: 60;
  }
}

#census-places[zoom>9] {
  [name10='Los Angeles'] {text-name:"''";}
  [zoom=10][pop100>80000]{
    text-name:"[name10]";
    [name10='Los Angeles'] {text-name:"''";}
    text-size:12;
  }
  [zoom=11][pop100>30000] {
    text-name:"[name10]";
    [name10='Los Angeles'] {text-name:"''";}
    text-size:12;
  }
  [zoom=12][pop100>10000] {
    text-name:"[name10]";
    [name10='Los Angeles'] {text-name:"''";}
    text-size:13;
  }
  [zoom=13][pop100>500] {
    text-name:"[name10]";
    [name10='Los Angeles'] {text-name:"''";}
    text-size:15;
  }
  [zoom>13]{
    text-name:"[name10]";
    [name10='Los Angeles'] {text-name:"''";}
  }
  [zoom=14] {text-size:16;}
  [zoom=15] {text-size:16;}
} 

#neighborhoods[zoom>=11] {
  text-face-name: @sans_light;
  [zoom=11][population>50000] {
    text-name:"[Name]";
    text-size:11;
  }
  [zoom=12][population>20000] {
    text-name:"[Name]";
    text-size:12;
  }
  [zoom=13][population>500] { 
    text-name:"[Name]";
    text-size:14;
  }
  [zoom>13]{text-name:"[Name]";}
  [zoom=14] {text-size:15;}    
  [zoom=15] {text-size:15;}
}


#landuse-labels {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom=10][area>102400000],
  [zoom=11][area>25600000],
  [zoom=13][area>1600000],
  [zoom=14][area>320000],
  [zoom=15][area>30000] {
    text-name: "[name]";
    text-size: 12;
    text-min-distance:2;
    text-placement: point;
    text-face-name: @sans_light;
    [type='park'][zoom>=10],
    [type='golf_course'][zoom>=10],
    [type='cemetery'][zoom>=10] {
      text-fill: @park * 0.6;
      text-halo-fill: lighten(@park, 10);
      // Skip these since they are also neighborhood names
      [name='Griffith Park'] {text-name:"''";}
      [name='Elysian Park'] {text-name:"''";}
    }
    [type='hospital'][zoom>=10] {
      text-fill: @hospital * 0.6;
      text-halo-fill: lighten(@hospital, 10);
    }
    [type='arena'][zoom>=10],
    [type='sports_center'][zoom>=10],
    [type='stadium'][zoom>=10]{
      text-fill: @stadium * 0.6;
      text-halo-fill: lighten(@stadium, 10);
    }
    [type='college'][zoom>=10],
    [type='school'][zoom>=10],
    [type='university'][zoom>=10] {
      text-fill: @school * 0.6;
      text-halo-fill: lighten(@school, 10);
    }
    [type='water'][zoom>=10] {
      text-fill: @water * 0.6;
      text-halo-fill: lighten(@water, 10);
    }
    [type='aerodrome'][zoom>=10] {
      text-fill: @aerodrome * 0.6;
      text-halo-fill: lighten(@aerodrome, 10);
    }
    [type='place_of_worship'][zoom>=10] {
      text-fill: @place_of_worship * 0.6;
      text-halo-fill: lighten(@place_of_worship, 10);
    }
  }
  [zoom=15][area>=1600000] {
    text-name: "[name]";
    text-size: 13;
    text-wrap-width: 60;
    text-character-spacing: 1;
  }  
}


/* Roads */
.shield[zoom>10][ref_len<=3] {
  [highway='motorway'] {
    shield-face-name: @sans;
    shield-fill: #333;
    shield-name: "[ref]";
    shield-placement: line;
    shield-opacity: 0.9;
    shield-text-dy: 1;
    shield-text-dx: 0.2;
    shield-halo-radius: 0;
    shield-min-padding: 165;
    shield-avoid-edges: true;
    shield-spacing:150;
    shield-min-distance: 50;
    shield-file: url("resources/interstate_shield_small.png");
    [type="CA"]{
      shield-file: url("resources/ca_shield_small1.png");
    }
    [type="SR"]{
      shield-file: url("resources/ca_shield_small1.png");
      shield-fill: #333;
    }
    [type="US"]{
      shield-file: url("resources/us_shield_small1.png");
      shield-text-dx: 1;
      shield-text-dy: 0;
    }
    [ref_len>=3]{
      shield-text-dx:0;
      shield-file: url("resources/interstate_shield_wide.png");
      [type="CA"]{
        shield-file: url("resources/ca_shield_wide1.png");
      }
      [type="SR"]{
        shield-file: url("resources/ca_shield_wide1.png");
      }
      [type="US"]{
        shield-file: url("resources/us_shield_wide1.png");
      }
    }
    [zoom<=12] {
      shield-min-distance: 50;
    }
    [zoom>12] {
      shield-min-distance: 40;
    }
    [zoom>=14] {
      shield-min-padding: 150;
      shield-min-distance: 60;
    }
  }
}

#waterway-labels[zoom>=13] {
  text-face-name:@sans_italic;
  text-name:"[name]";
  text-size: 13px;
  text-fill: darken(@place_text, 10);
  text-halo-radius: 0.25;
  text-halo-fill: @place_halo;
  text-min-distance:0;
  text-wrap-width: 30;
  text-line-spacing: 3;
  [source='line'] {
    text-placement:line; 
  }
  [source='polygon'] {
    text-placement:interior; 
  }
  [zoom=13] {
    text-size:12;
  } 
  [zoom=14] {
    text-size:13;
  }
  [zoom=15] {
    text-size:13;
  }
}

#motorway-labels[type='motorway'][zoom>9] {
  text-face-name:@sans;
  text-name:"[name]";
  text-fill: darken(@road_text, 20);
  text-halo-fill:@motorway_fill;
}

#motorway-labels[type='trunk'][zoom>9] {
  text-face-name:@sans;
  text-name:"[name]";
  text-fill:@road_text;
  text-halo-fill:@road_halo;
}

#motorway-labels[type='motorway'][zoom>9],
#motorway-labels[type='trunk'][zoom>9] {
  text-placement:line;
  text-halo-radius:1.5;
  text-min-distance:60;
  text-min-padding: 45;
  text-size:12;
  text-avoid-edges: true;
  [zoom=11] {
    text-min-distance:70;
    text-size:12;
  }
  [zoom=12] {
    text-min-distance:80;
    text-size:12;
  }
  [zoom=13] {
    text-min-distance:100;
    text-size:13;
  }
  [zoom=14] {
    text-min-distance:120;
    text-size:14;
  }
  [zoom=15] {
    text-min-distance:120;
    text-size:15;
  }
}

#mainroad-labels[type='primary'][zoom>12],
#mainroad-labels[type='secondary'][zoom>13],
#mainroad-labels[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:12;
  [zoom=14] {
    text-size:11;
    text-min-distance:120;
  }
  [zoom=15] {
    text-size:11;
    text-min-distance:150;
  }
}

#minorroad-labels[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:9;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
}