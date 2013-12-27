/* ==================================================================
   ROAD & RAIL LINES
/* ================================================================== */



#roads-medium[zoom>=8][zoom<=10] {
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line;
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line;
  }
  [type='primary'] { line-color: @primary_line; }
  [type='secondary'] { line-color: @secondary_line; }
  [type='tertiary'] { line-color: @standard_line; }
  [zoom=8] {
    [type='motorway'],[type='trunk'] { line-width: .7; }
    [type='motorway_link'],[type='trunk_link'] { line-width: .3; }
    [type='primary'],[type='secondary'] { line-width: .3; }
  } 
  [zoom=9] {
    [type='motorway'],[type='trunk'] { line-width: .7; }
    [type='motorway_link'],[type='trunk_link'] { line-width: .4; }
    [type='primary'],[type='secondary'] { line-width: .3; }
  } 
  [zoom=10] {
    [type='motorway'],[type='trunk'] { line-width: .8; }
    [type='motorway_link'],[type='trunk_link'] { line-width: .4; }
    [type='primary'],[type='secondary'] { line-width: .4; }
  }
}

/* At higher levels the roads become more complex. We're now showing 
more than just automobile routes - railways, footways, and cycleways
come in as well.

/* Road width variables that are used in road & bridge styles */
@rdz11_maj: 1.5; @rdz11_med: 0.4; @rdz11_min: 0.2;
@rdz12_maj: 2; @rdz12_med: .5; @rdz12_min: 0.3;
@rdz13_maj: 3.3;   @rdz13_med: 1; @rdz13_min: .15;
@rdz14_maj: 3.4;   @rdz14_med: 1.3; @rdz14_min: .3;
@rdz15_maj: 5;   @rdz15_med: 2;   @rdz15_min: .9;
@rdz16_maj: 8;   @rdz16_med: 3;   @rdz16_min: 1.2;



#roads-high[zoom>=11][zoom<=20],
#tunnel[render='3_inline'][zoom>=11][zoom<=20],
#bridge[render='3_inline'][zoom>=11][zoom<=20]{
  /* -- colors & styles -- */
  line-color: @standard_line;
  [type='motorway'],
  [type='motorway_link'] {
    line-color: @motorway_line;
    [tunnel=1] { line-color: lighten(@motorway_line, 10%); }
  }
  [type='trunk'],
  [type='trunk_link'] {
    line-color: @trunk_line;
    [tunnel=1] { line-color: lighten(@trunk_line, 10%); }
  }
  [type='primary'],
  [type='primary_link'] {
    line-color: @primary_line;
    [tunnel=1] { line-color: lighten(@primary_line, 10%); }
  }
  [type='secondary'],
  [type='secondary_link'] {
    line-color: @secondary_line;
    [tunnel=1] { line-color: lighten(@secondary_line, 20%); }
  }
  [stylegroup='railway'] {
    line-color: @rail_line;
    line-dasharray: 1,1;
    [type='subway'] { line-opacity: 0.67; }
    [zoom>15] { line-dasharray: 1,2; } 
  }
  [stylegroup='noauto'],
  [stylegroup='service'],
  [stylegroup='minorroad'] {
    line-width: 0;
  }
  [stylegroup='service'],
  [stylegroup='minorroad'],
  [stylegroup='mainroad'],
  [stylegroup='motorway'] {
    line-cap: round;
    line-join: round;
  }
  [stylegroup='noauto'] {
    line-join: round;
  }
  [tunnel=1] {
   // line-cap: butt;
  }
  /* -- widths -- */
  [zoom=11] {
    [stylegroup='motorway'] { line-width: @rdz11_maj; }
    [stylegroup='mainroad'] { line-width: @rdz11_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']  { line-width: 0.2; }
  }
  [zoom=12] {
    [stylegroup='motorway'] { line-width: @rdz12_maj; }
    [stylegroup='mainroad'] { line-width: @rdz12_med; }
    [stylegroup='minorroad']{ line-width: 0; }
    [stylegroup='railway']  { line-width: .2; }
  }
  [zoom=13] {
    [stylegroup='motorway'] { line-width: @rdz13_maj; }
    [stylegroup='mainroad'] { line-width: @rdz13_med; }
    [stylegroup='minorroad']{ line-width: @rdz13_min; }
    [stylegroup='service']  { line-width: @rdz13_min / 3; }
    [stylegroup='noauto']   { line-width: @rdz13_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']  { line-width: 0.3; }
  }
  [zoom=14] {
    [stylegroup='motorway'] { line-width: @rdz14_maj; }
    [stylegroup='mainroad'] { line-width: @rdz14_med; }
    [stylegroup='minorroad']{ line-width: @rdz14_min; }
    [stylegroup='service']  { line-width: @rdz14_min / 3; }
    [stylegroup='noauto']   { line-width: @rdz14_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']  { line-width: .6; }
  }
  [zoom=15] {
    [stylegroup='motorway'] { line-width: @rdz15_maj; }
    [stylegroup='mainroad'] { line-width: @rdz15_med; }
    [stylegroup='minorroad']{ line-width: @rdz15_min; }
    [stylegroup='service']  { line-width: @rdz15_min / 3; }
    [stylegroup='noauto']   { line-width: @rdz15_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']  { line-width: .8; }
  }
  [zoom=16] {
    [stylegroup='motorway'] { line-width: @rdz16_maj; }
    [stylegroup='mainroad'] { line-width: @rdz16_med; }
    [stylegroup='minorroad']{ line-width: @rdz16_min; }
    [stylegroup='service']  { line-width: @rdz16_min / 3; }
    [stylegroup='noauto']   { line-width: @rdz16_min / 4; line-dasharray: 1,1; }
    [stylegroup='railway']  { line-width: 1.5; }
  }
}

/* ---- Bridge fill for dashed lines -------------------------------- */
#tunnel[render='2_line'][zoom>=14][zoom<=20],
#bridge[render='2_line'][zoom>=14][zoom<=20]{
  
  /* -- colors & styles -- */
  [stylegroup='noauto'] {
    line-color: @standard_fill;
    line-width: 0;
    line-join: round;
  }
  [stylegroup='railway'] {
    line-color: @rail_line;
    line-join: round;
    line-width: 0;
    line-dasharray: 1,3;
  }
  /* -- widths -- */
  [zoom=14] {
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 1 + 1; }
  }
  [zoom=15] {
    [stylegroup='noauto']   { line-width: 0; }
    [stylegroup='railway']  { line-width: 1.5 + 1; }
  }
  [zoom=16] {
    [stylegroup='noauto']   { line-width: @rdz16_min / 4 + 1; }
    [stylegroup='railway']  { line-width: 1.5 + 1; }
  }
}

/* ---- Turning Circles --------------------------------------------- */
#turning-circle-case[zoom>=15] {
  marker-fill:@standard_fill;
  marker-line-color:@standard_case;
  marker-line-width:2;
  marker-allow-overlap:true;
}
#turning-circle-fill[zoom>=15] {
  marker-fill:@standard_fill;
  marker-line-width:0;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
#turning-circle-case,
#turning-circle-fill {
  [zoom=15] { marker-width:@rdz15_min * 1.1; }
  [zoom=16] { marker-width:@rdz16_min * 1.1; }
}

/* ================================================================== */
/* AEROWAYS
/* ================================================================== */

#aeroway[zoom>9] {
  line-color:@aeroway;
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
  [type='taxiway'] {
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:3; }
    [zoom=16]{ line-width:5; }
  }
}

/******************************************************************* */