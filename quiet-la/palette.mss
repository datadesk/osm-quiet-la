/* Fonts */
Map { font-directory: url(./fonts); buffer-size: 512; }
@sans: "BentonGothic-Medium Medium", "DejaVu Sans Condensed";
@sans_bold: "BentonGothic-BoldCond Medium", "DejaVu Sans Condensed Bold";
@sans_light: "BentonGothicCondTab Medium", "DejaVu Sans ExtraLight";
@sans_italic: "BentonGothic-RegularItalic Medium", "DejaVu Sans Condensed Oblique";
@serif_italic: "Georgia Italic";

/* Land user and land cover */
@background: #efebe7;
@land:#f4f2ed;
@forest: #dee0d5;
@grass: lighten(@forest, 5%);
@park:lighten(@forest, 3%);
@hospital:lighten(#EBCDDE, 7%);
@school: lighten(#D9D5E3, 5%);
@stadium: #D9CDC1;
@beach: #ebe2cd;
@runway: #BFBEBD;
@aerodrome: #D6D6D6;
@building: darken(#e8e4e4,8);
@water: #C3D5DD;
@residential:  @land * 0.98;
@commercial: @land * 0.97;
@industrial: @land * 0.96;
@military: @land * 0.95;
@parking: #EEE;
@place_of_worship: #E3C5C9;
@admin: #000000;

/* Borders */
@county_border: #8a7c7c;
@california_border: #827676;
@mexico_border: #6E6666;

/* Places */
@place_halo: @land;
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

@road: gray;/*#c8c8c1*/
@road_halo: #fff;
@road_text: #757575;

//@motorway_line:     spin(darken(#e6e6d9,15),-10);
@motorway_line:     lighten(#c8c8c1, 0);
@motorway_fill:     lighten(#c8c8c1, 0);
@motorway_case:     lighten(#c8c8c1, 0);

@trunk_line:        lighten(#c8c8c1, 0);
@trunk_fill:        lighten(#c8c8c1, 0);
@trunk_case:        lighten(#c8c8c1, 0);

@primary_line:      lighten(#c8c8c1, 0);
@primary_fill:      #fff;
@primary_case:      @primary_line * 0.9;

@secondary_line:    lighten(#c8c8c1, 0);
@secondary_fill:    #fff;
@secondary_case:    @secondary_line * 0.9;

@standard_line:     lighten(#c8c8c1,0);
@standard_fill:     #c8c8c1;
@standard_case:     @standard_line * 0.9;

@pedestrian_line:   @standard_line;
@pedestrian_fill:   #FAFAF5;
@pedestrian_case:   @land;

@cycle_line:        @standard_line;
@cycle_fill:        #FAFAF5;
@cycle_case:        @land;

@rail_line:         #c8c8c1;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ddd;