/* Good vs. Bad Scales */
@good4: #4D9221;
@good3: #7FBC41;
@good2: #B8E186;
@good1: #E6F5D0;
@neutral: #F7F7F7;
@bad1: #fad3e7;
@bad2: #F1B6DA;
@bad3: #DE77AE;
@bad4: #C51B7D;

/* Sequential scale for volume */
@scale1: #F3EDF6;  
@scale2: #E5DDED;  
@scale3: #D0C5DE;
@scale4: #BCADD0;
@scale5: #A18DBA;
@scale6: #8D76AE;  
@scale7: #544987; 

/*
.hexagon {
  line-width:1;   
  polygon-opacity:0.7;  
  line-opacity: 0.3;  
  [zoom>13]{ polygon-opacity:0.6; }
}


#speedgrid {      
  [ems_average_arrival = 0]{polygon-opacity:0.0;line-opacity:0;}  
  [ems_average_arrival > 0][ems_average_arrival <= 120]{polygon-fill:@good4;line-color:darken(@good4, 10);}
  [ems_average_arrival > 120][ems_average_arrival <= 180]{polygon-fill:@good4;line-color:darken(@good3, 10);}
  [ems_average_arrival > 180][ems_average_arrival <= 240]{polygon-fill:@good3;line-color:darken(@good2, 10);}
  [ems_average_arrival > 240][ems_average_arrival <= 300]{polygon-fill:@good2;line-color:darken(@good1, 10);}
  [ems_average_arrival > 300][ems_average_arrival <= 360]{polygon-fill:@bad1;line-color:darken(@bad1, 10);}
  [ems_average_arrival > 360][ems_average_arrival <= 420]{polygon-fill:@bad2;line-color:darken(@bad2, 10);}
  [ems_average_arrival > 420][ems_average_arrival <= 540]{polygon-fill:@bad3;line-color:darken(@bad3, 10);}
  [ems_average_arrival > 540]{polygon-fill:@bad4;line-color:darken(@bad4,10);} 
}

#volumegrid {
  polygon-opacity:0.0;  
  line-opacity: 0.0;
  [arrival_count < 5]{polygon-opacity:0.0;line-opacity:0;} 
  [arrival_count >= 5][arrival_count <= 38{polygon-fill:@scale1;line-color:darken(@scale1, 10);}
  [arrival_count > 38][arrival_count <= 84]{polygon-fill:@scale2;line-color:darken(@scale2, 10);}
  [arrival_count > 84][arrival_count <= 147]{polygon-fill:@scale3;line-color:darken(@scale3, 10);}
  [arrival_count > 147][arrival_count <= 235]{polygon-fill:@scale4;line-color:darken(@scale4, 10);}
  [arrival_count > 235][arrival_count <= 391]{polygon-fill:@scale5;line-color:darken(@scale5, 10);}
  [arrival_count > 391][arrival_count <= 719]{polygon-fill:@scale6;line-color:darken(@scale6, 10);}
  [arrival_count > 719][arrival_count <= 15736]{polygon-fill:@scale7;line-color:darken(@scale7, 10);}
} 
*/