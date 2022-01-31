use <../pills/dimensions.scad>
use <../pills/negative_screw.scad>

$fs = 1;
$fa = 0.4;

module plate_spacer() {
    translate([0, 0, separator_thickness()/2])
    difference() {
        cube([
            plate_width(),
            plate_height(),
            separator_thickness()
            ], center=true);
        cube([
            plate_width() - hole_offset()*4 + 2,
            plate_height() - hole_offset()*4 + 2,
            3*2
            ], center=true);
        negative_screw();
    }
}

plate_spacer();