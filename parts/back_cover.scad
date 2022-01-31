use <../pills/dimensions.scad>
use <../pills/switch_pot.scad>
use <../pills/negative_power_connector.scad>
use <back_plate.scad>

back_cover_width = plate_width() + 20;
back_cover_height = plate_height() + 20;
back_plate_width = plate_width() + 12;
back_plate_height = plate_height() + 12;
thickness = 4;
mounting_width = 20;
mounting_inset = 15;

$fs=1;
$fa=0.4;

cover_length=6;

module back_cover() {
    difference() {
        cube([back_cover_width, back_cover_height, thickness], center=true);
        translate([0, 49, 0])
            scale([1, 1, 2])
            negative_power_connector();
        translate([-20, 55, 2.001])// -29.001])
            rotate([180, 0, 180])
            switch_pot();
        translate([-20, 55, -2])
            cylinder(r=6.3, h=2, center=true);
        translate([-back_plate_width/2+10+mounting_inset, back_plate_height/2 - mounting_width/2, 0])
            cylinder(h=thickness*2, r=1.5, center=true);
        translate([back_plate_width/2-10-mounting_inset,-back_plate_height/2 + mounting_width/2, 0])
            cylinder(h=thickness*2, r=1.5, center=true);
    }
        translate([0, 43, cover_length/2+thickness/2])
            cube([10, 1, cover_length], center=true);
}

scale([-1, 1, 1])
back_cover();
