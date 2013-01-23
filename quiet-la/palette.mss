/* Fonts */
Map { font-directory: url(./fonts); }
@sans: "BentonGothic-Medium Medium", "DejaVu Sans Condensed";
@sans_bold: "BentonGothic-BoldCond Medium", "DejaVu Sans Condensed Bold";
@sans_light: "BentonGothicCondTab Regular", "DejaVu Sans ExtraLight";
@sans_italic: "BentonGothic-RegularItalic Medium", "DejaVu Sans Condensed Oblique";


/* Land user and land cover */
@background: #FDFDFD;
@land:#FDFDFD;
@forest: #c7e6a8;
@grass: lighten(@forest,5%);
@park:lighten(@forest,5%);
@hospital:#EBCDDE;
@school: #D9D5E3;
@stadium: #D9CDC1;
@beach: #ffeec7;
@runway: #BFBEBD;
@aerodrome: #D6D6D6;
@building: darken(#e8e4e4,8);
@water: #b8dee6;
@residential:  @land * 0.98;
@commercial: @land * 0.97;
@industrial: @land * 0.96;
@military: @land * 0.95;
@firestation: red;
@parking: #EEE;
@place_of_worship: #E3C5C9;
@admin: #000000;

/* Places */
@place_halo: #fff;
@place_text: #4a4a4a;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@road: #fcf7bd;
@road_halo: #fff;
@road_text: #4a4a4a;

@motorway_fill:     #f7c457;
@motorway_line:     spin(darken(@motorway_fill,15),-10);
@motorway_case:     lighten(#000, 5);

@trunk_line:        lighten(@road, 25);
@trunk_fill:        lighten(@trunk_line,10%);
@trunk_case:        @trunk_line * 0.9;

@primary_fill:      #fcf7bd;
@primary_line:      spin(darken(@primary_fill,20),-10);
@primary_case:      @primary_line * 0.9;

@secondary_line:    @primary_line;
@secondary_fill:    @primary_fill;
@secondary_case:    @primary_case;

@standard_line:     lighten(@road,40);
@standard_fill:     #fff;
@standard_case:     @standard_line * 0.9;

@pedestrian_line:   @standard_line;
@pedestrian_fill:   #FAFAF5;
@pedestrian_case:   @land;

@cycle_line:        @standard_line;
@cycle_fill:        #FAFAF5;
@cycle_case:        @land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ddd;