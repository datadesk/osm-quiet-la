.places {
  text-name: "";
  text-face-name: @sans;
  text-fill: @place_text;
  text-wrap-width: 30;
  text-line-spacing: 1;
  text-placement: interior;
  text-align: center;
  text-halo-radius: 0;
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
  }
  [zoom=9] {
    text-size:13;
  }
  [zoom=10] {
    text-size:14;
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
  [Name='Angeles Forest'] {text-name:"'Angeles National Forest'";}
  [zoom=9] {
    text-size:12;
  }
  [zoom=10] {
    text-size:13;
    text-wrap-width: 60;
  }
  [zoom=11] {
    text-size:16;
    text-wrap-width: 60;
  }
}

#census-places[zoom>10] {
  text-face-name: @sans;
  text-fill: @place_text;
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
    text-size:14;
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
  [zoom=16] {text-size:17;}
} 

#neighborhoods[zoom>=11] [zoom<17]{
      text-name:"[Name]";
  text-face-name: @sans_bold;
  text-size:11;
  text-halo-radius:0;
  text-opacity:0.4;
  [zoom>=13][population>500] { 
    text-allow-overlap:true;
    text-size:14;
    text-opacity:0.2;
  }
  [zoom=14]{text-size:24; text-opacity:0.16;}    
  [zoom=15] {text-size:32; text-opacity:0.12;}
  [zoom=16] {text-size:38; text-opacity:0.1; }
}


#landuse-labels {
  // Bring in labels gradually as one zooms in, bases on polygon area
  [zoom=10][area>102400000],
  [zoom=11][area>25600000],
  [zoom=12][area>5000000],
  [zoom=13][area>1600000],
  [zoom=14][area>320000],
  [zoom=15][area>30000],
  [zoom=16][area>8000], {
    text-name: "[name]";
    text-size: 12;
    [zoom=16] {
      text-size: 12;
    }
    
    //text-min-distance:2;
    text-placement: point;
    text-face-name: @sans_italic;
    text-fill: lighten(@place_text, 15);
    text-size: 12;
    [type='park'][zoom>=10],
    [type='golf_course'][zoom>=10],
    [type='cemetery'][zoom>=10] {
      text-fill: @park * 0.6;
      // Skip these since they are also neighborhood names
      [name='Griffith Park'] {text-name:"''";}
      [name='Elysian Park'] {text-name:"''";}
    }
    [type='hospital'][zoom>=10] {
      text-fill: @hospital * 0.6;
    }
    [type='arena'][zoom>=10],
    [type='sports_center'][zoom>=10],
    [type='stadium'][zoom>=10]{
      text-fill: @stadium * 0.6;
    }
    [type='water'][zoom>=10] {
      text-fill: @water * 0.6;
      text-face-name:@serif_italic;
    }
    [type='reservoir'][zoom>=10][zoom<=14] {
      text-fill: @water * 0.6;
      text-face-name:@serif_italic;
    }
    [type='college'][zoom>=10],
    [type='school'][zoom>=10],
    [type='university'][zoom>=10] {
      text-fill: @school * 0.6;
    }
    
    [type='aerodrome'][zoom>=10] {
      text-fill: @aerodrome * 0.6;
    }
    [type='place_of_worship'][zoom>=10] {
      text-fill: @place_of_worship * 0.6;
    }
  }
  [zoom=15][area>=1600000] {
    text-name: "[name]";
    text-size: 13;
    text-wrap-width: 60;
    text-character-spacing: 1;
  }  
  [zoom=16][area>=1200000] {
    text-name: "[name]";
    text-size: 14;
    text-wrap-width: 60;
    text-character-spacing: 1;
  }  
}


/* Roads */
.shield[zoom>10][ref_len<=3] {
  [highway='motorway'] {
    shield-face-name: @sans;
    shield-fill: #666;
    shield-name: "[ref]";
    shield-placement: line;
    shield-opacity: 1;
    shield-text-dy: 1;
    shield-text-dx: 0.1;
    shield-halo-radius: 0;
    shield-min-padding: 50;
    shield-avoid-edges: true;
    shield-spacing:250;
    shield-min-distance: 90;
    shield-allow-overlap: false;
    [type="US"]{
      shield-text-dx: 1;
      shield-text-dy: 0;
    }
    [type="SR"] {shield-fill: #333;}
    [zoom>10][zoom<16]{
      shield-file: url("resources/interstate_shield_small.png");
      [type="CA"],[type="SR"]{shield-file: url("resources/ca_shield_small.png");}
      [type="US"]{shield-file: url("resources/us_shield_small.png");}
    }
    [zoom>=16]{
      shield-file: url("resources/interstate_shield_large.png");
      [type="CA"],[type="SR"]{shield-file: url("resources/ca_shield_large.png");}
      [type="US"]{shield-file: url("resources/us_shield_large.png");}
    }
    [ref_len>=3]{
      shield-text-dx:0;
      [zoom>10][zoom<16]{
        shield-file: url("resources/interstate_shield_small_wide.png");
        [type="CA"],[type="SR"]{shield-file: url("resources/ca_shield_small_wide.png");}
        [type="US"]{shield-file: url("resources/us_shield_small_wide.png");}
      }
      [zoom>=16]{
        shield-file: url("resources/interstate_shield_large_wide.png");
        [type="CA"],[type="SR"]{shield-file: url("resources/ca_shield_large_wide.png");}
        [type="US"]{shield-file: url("resources/us_shield_large_wide.png");} 
      }
    }

    [zoom=12] { 
      shield-min-distance: 100;
    }
    [zoom=13] { 
      shield-min-distance: 170;
    }
    [zoom=14] {
      shield-min-padding: 50;
      shield-min-distance: 200;
    }
    [zoom=15] {
      shield-min-padding: 10;
      shield-min-distance: 40;
    }
    [zoom=16] { 
      //shield-size:14;
      //shield-opacity: 0.98;
      shield-min-padding: 10;
      shield-min-distance: 150;
    }
  }
}

#waterway-labels
[zoom>=15] {
  text-face-name:@serif_italic;
  text-name:"[name]";
  text-size: 11px;
  text-fill: lighten(@place_text, 10);
  text-halo-radius: 0;
  text-halo-fill: @place_halo;
  text-min-distance:0;
  text-wrap-width: 30;
  text-line-spacing: 1;
  [source='line'] {
    text-placement:line;
    text-dy:9;
  }
  [source='polygon'] {
    text-placement:interior; 
  }

  [zoom=14] {
    text-fill: @place_text;
  }
  [zoom=15] {
    text-fill: @place_text;
  }
  [zoom=16] {
    text-size:13;
    text-fill: @place_text;
  }
}

#motorway-labels[type='motorway'][zoom>12] {
  text-face-name:@sans;
  text-name:"[name]";
  text-fill:@road_text;
  //text-min-padding: 45;
}

#motorway-labels[type='trunk'][zoom>12] {
  text-face-name:@sans;
  text-name:"[name]";
  text-fill:@road_text;
  //text-min-padding: 45;
}

#motorway-labels[type='motorway'][zoom>12],
#motorway-labels[type='trunk'][zoom>12] {
  text-placement:line;
  text-halo-radius:0;
  text-character-spacing:.5;
  text-min-distance:60;
  text-size:12;
  text-avoid-edges: false;
  text-dy:12;
  [zoom=11] {
    text-min-distance:70;
    text-size:12;
    text-dy:12;
  }
  [zoom=12] {
    text-min-distance:80;
    text-size:12;
    text-dy:12;
  }
  [zoom=13] {
    text-min-distance:100;
    text-size:13;
    text-dy:14;
  }
  [zoom=14] {
    text-min-distance:120;
    text-size:14;
    text-dy:14;
  }
  [zoom=15] {
    text-face-name:@sans_bold;
    text-fill: #fff;
	text-halo-fill: #bfbebd;
    text-halo-radius:2;
    text-character-spacing:1.5;
    text-min-distance:400;
    text-size:15;
    text-dy:0;
  }
  [zoom=16] {
    text-face-name:@sans_bold;
    text-fill: #fff;
	text-halo-fill: #bfbebd;
    text-halo-radius:1.5;
    text-character-spacing:2;
    text-min-distance:400;
    text-size:18;
    text-dy:0;
  }
}

#mainroad-labels[type='primary'][zoom>12]{
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:lighten(@road_text,15%);
  text-halo-fill:@land;
  text-halo-radius:1.3;
  text-size:11;
  text-character-spacing:.5;
  text-dy:9;
  [zoom=13] {
    text-min-padding:10;
    text-min-distance:120;
  }
  [zoom=14] {
    text-min-padding:45;
    text-min-distance:20;
  }
  [zoom=15] {
      text-min-padding:10;
  }
  [zoom=16] {
      text-min-padding:10;
  }
}
#mainroad-labels[type='secondary'][zoom>12]{
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:lighten(@road_text,15%);
  text-halo-fill:@land;
  text-halo-radius:1.3;
  text-size:11;
  //text-min-padding:5;
  text-character-spacing:.5;
  text-dy:9;
  [zoom=13] {
    text-min-padding:60;
    text-min-distance:20;
  }
  [zoom=14] {
    text-min-padding:58;
    text-min-distance:20;
  }
  [zoom=15] {
      text-min-padding:10;
    text-size:12;
  }
  [zoom=16] {
      text-min-padding:10;
    text-size:13;
  }
 }
#mainroad-labels[type='tertiary'][zoom>12] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:lighten(@road_text,15%);
  text-halo-fill:@land;
  text-halo-radius:1.3;
  //text-min-distance:120;
  text-size:12;
  text-character-spacing:.5;
  text-dy:9;
  [zoom=13] {
    text-min-padding:60;
    text-min-distance:20;
  }
  [zoom=14] {
    text-min-padding:60;
    text-min-distance:20;
  }
  [zoom=15] {
      text-min-padding:120;
  }
  [zoom=16] {
    text-fill: lighten(@road_text,15%);
    text-min-distance:200;
  }
}

#minorroad-labels[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-character-spacing:.5;
  text-size:10;
  text-fill:lighten(@road_text,15%);
  text-halo-fill:@land;
  text-halo-radius:1.2;
  text-dy:7;
  text-min-padding:5;
  [zoom=16] {
    text-min-distance:100;
    //text-min-padding:15;
    text-dy:9;
    text-halo-fill:@land;
  	text-halo-radius:1.3;
  }
}