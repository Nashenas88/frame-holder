use <dimensions.scad>
use <negative_screw.scad>

image_offset = 10;
$fs = 1;
$fa = 0.4;

module image_plate() {
    translate([0, 0, plate_thickness()/2])
    difference() {
        cube([plate_width(), plate_height(), plate_thickness()], center=true);
        negative_screw();
        cube([plate_width()-image_offset*2, plate_height()-image_offset*2, plate_thickness()*2], center=true);
    }
}

image_plate();