/* Fonts */
Map { font-directory: url(./fonts); }
@sans: "BentonGothic-Medium Medium", "DejaVu Sans Condensed";
@sans_bold: "BentonGothic-BoldCond Medium", "DejaVu Sans Condensed Bold";
@sans_light: "BentonGothicCondTab Medium", "DejaVu Sans ExtraLight";
@sans_italic: "BentonGothic-RegularItalic Medium", "DejaVu Sans Condensed Oblique";


/* Land user and land cover */
@background: #efebe7;
@land:#efebe7;
@forest: #cfd6c8;
@grass: lighten(@forest,5%);
@park:lighten(@forest,5%);
@hospital:#EBCDDE;
@school: #D9D5E3;
@stadium: #D9CDC1;
@beach: #ebe2cd;
@runway: #BFBEBD;
@aerodrome: #D6D6D6;
@building: darken(#e8e4e4,8);
@water: #b8dee6;
@residential:  @land * 0.98;
@commercial: @land * 0.97;
@industrial: @land * 0.96;
@military: @land * 0.95;
@parking: #EEE;
@place_of_worship: #E3C5C9;
@admin: #000000;

/* Places */
@place_halo: #fff;
@place_text: #757575;

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

@road: gray;
@road_halo: #fff;
@road_text: #757575;

@motorway_line:     spin(darken(#e6e6d9,15),-10);
@motorway_fill:     spin(darken(#e6e6d9,15),-10);
@motorway_case:     lighten(#000, 5);

@trunk_line:        lighten(@road, 25);
@trunk_fill:        lighten(@trunk_line,10%);
@trunk_case:        @trunk_line * 0.9;

@primary_line:      lighten(@road,20);
@primary_fill:      #fff;
@primary_case:      @primary_line * 0.9;

@secondary_line:    lighten(@road,30);
@secondary_fill:    #fff;
@secondary_case:    @secondary_line * 0.9;

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