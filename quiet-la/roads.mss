/* Medium-zoom roads */
#roads-medium[zoom>=8][zoom<=10]{
  line-color: @road;
  [zoom=8]{
    [type='motorway'],[type='trunk']{ line-width: 0.7; }
    [type='motorway_link'],[type='trunk_link']{ line-width: 0.3; }
    [type='primary'],[type='secondary']{ line-width: 0.3; }
  } 
  [zoom=9]{
    [type='motorway'],[type='trunk']{ line-width: 0.7; }
    [type='motorway_link'],[type='trunk_link']{ line-width: 0.4; }
    [type='primary'],[type='secondary']{ line-width: 0.3; }
  } 
  [zoom=10]{
    [type='motorway'],[type='trunk']{ line-width: 0.8; }
    [type='motorway_link'],[type='trunk_link']{ line-width: 0.4; }
    [type='primary'],[type='secondary']{ line-width: 0.4; }
  }
}

/* High-zoom roads */
@rdz11_maj: 1.5; 
@rdz12_maj: 2; 
@rdz13_maj: 3.3; 
@rdz14_maj: 3.4; 
@rdz15_maj: 5; 
@rdz16_maj: 8; 

@rdz11_med: 0.4; 
@rdz12_med: 0.5; 
@rdz13_med: 1; 
@rdz14_med: 1.3;
@rdz15_med: 2; 
@rdz16_med: 3; 

@rdz13_min: 0.15;
@rdz14_min: 0.3;
@rdz15_min: 0.9;
@rdz16_min: 1.2;

#roads-high[zoom>=11],
#tunnel[render='3_inline'][zoom>=11],
#bridge[render='3_inline'][zoom>=11]{
  line-color: @road;
  [tunnel=1]{ line-color: lighten(@road, 10%); }
  [stylegroup='railway']{
    line-color: @rail_line;
    line-dasharray: 1,1;
    [type='subway']{ line-opacity: 0.67; }
    [zoom>15]{ line-dasharray: 1,2; } 
  }
  [stylegroup='noauto'],
  [stylegroup='service'],
  [stylegroup='minorroad']{
    line-width: 0;
  }
  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway']{
    line-cap: round;
    line-join: round;
  }
  [stylegroup='noauto']{ line-join: round; }
  [zoom=11]{
    [stylegroup='motorway']{ line-width: @rdz11_maj; }
    [stylegroup='mainroad']{ line-width: @rdz11_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']{ line-width: 0; }
    [stylegroup='other']{ line-width: 0; }
  }
  [zoom=12]{
    [stylegroup='motorway']{ line-width: @rdz12_maj; }
    [stylegroup='mainroad']{ line-width: @rdz12_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']{ line-width: 0; }
    [stylegroup='other']{ line-width: 0; }
  }
  [zoom=13]{
    [stylegroup='motorway']{ line-width: @rdz13_maj; }
    [stylegroup='mainroad']{ line-width: @rdz13_med; }
    [stylegroup='minorroad']{ line-width: @rdz13_min; }
    [stylegroup='service']{ line-width: @rdz13_min / 3; }
    [stylegroup='noauto']{ line-width: @rdz13_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']{ line-width: 0; }
    [stylegroup='other']{ line-width: 0; }
  }
  [zoom=14]{
    [stylegroup='motorway']{ line-width: @rdz14_maj; }
    [stylegroup='mainroad']{ line-width: @rdz14_med; }
    [stylegroup='minorroad']{ line-width: @rdz14_min; }
    [stylegroup='service']{ line-width: @rdz14_min / 3; }
    [stylegroup='noauto']{ line-width: @rdz14_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']{ line-width: 0.6; }
    [stylegroup='other']{ line-width: 0; }
  }
  [zoom=15]{
    [stylegroup='motorway']{ line-width: @rdz15_maj; }
    [stylegroup='mainroad']{ line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='service']{ line-width: @rdz15_min / 3; }
    [stylegroup='noauto']{ line-width: @rdz15_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']{ line-width: 0.8; }
    [stylegroup='other']{ line-width: 0.6; }
  }
  [zoom=16]{
    [stylegroup='motorway']{ line-width: @rdz16_maj; }
    [stylegroup='mainroad']{ line-width: @rdz16_med; }
    [stylegroup='minorroad']{ line-width: @rdz16_min; }
    [stylegroup='service']{ line-width: @rdz16_min / 3; }
    [stylegroup='noauto']{ line-width: @rdz16_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']{ line-width: 1.5; }
     [stylegroup='other']{ line-width: 1; }
  }
}

/* Turning Circles */
#turning-circle[zoom>=15]{
  marker-fill: @road;
  marker-line-color: @road;
  marker-line-width: 2;
  marker-allow-overlap: true;
  [zoom=15]{ marker-width: @rdz15_min * 1.1; }
  [zoom=16]{ marker-width: @rdz16_min * 1.1; }
}

/* Aeroways */
#aeroway[zoom>9]{
  line-color: @aeroway;
  line-cap:butt;
  line-join:miter;
  [type='runway'] {
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:13; }
  }
  [type='taxiway']{
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:3; }
    [zoom=16]{ line-width:5; }
  }
}