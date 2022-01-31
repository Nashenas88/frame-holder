use <../pills/dimensions.scad>
use <../pills/negative_screw.scad>
use <../pills/negative_insert.scad>
use <../pills/electronics.scad>
use <../pills/power_connector.scad>
use <../pills/switch_pot.scad>

$fs=1;
$fa=0.4;

thickness=4;
support_length=electronics_thickness()+2;
elec_offset_x = -45;
elec_offset_y = 19;
elec_offset_z = 0;

back_plate_width = plate_width() + 12;
back_plate_height = plate_height() + 12;

mounting_length = electronics_width() * 1.25-4;
mounting_width = 20;
mounting_inset = 15;

module back_plate() {
    translate([0, 0, -thickness/2])
    difference() {
        union() {
            translate([-electronics_width()/2+elec_offset_x+3.5, 19, -thickness/2-1.5+0.001])
                cube([10, 10, 3], center=true);
            difference() {
                cube([back_plate_width, back_plate_height, thickness], center=true);
                scale([1, 1, 3])
                    negative_screw();
                translate([
                        (plate_width() + led_height() * 2)/2, (plate_height() + led_height() * 2)/2 + 1.5, 0])
                    cube([
                        thickness*3, thickness*3, thickness*3
                    ], center=true);
                translate([
                        -(plate_width() + led_height() * 2)/2, -(plate_height() + led_height() * 2)/2 - 1.5, 0])
                    cube([
                        thickness*3, thickness*3, thickness*3
                    ], center=true);
            }
        }
        translate([-electronics_width()/2+elec_offset_x+3.5, 19, -thickness])
            translate([0, 0, -1])
            negative_insert();
    }
    difference() {
        translate([-back_plate_width/2+mounting_length/2+mounting_inset, back_plate_height/2-mounting_width/2, -thickness-support_length/2])
            cube([mounting_length, mounting_width, support_length], center=true);
        translate([0, 55, -support_length-1.501])
            rotate([0, 270, 270])
            power_connector();
        translate([-20, 55, -support_length -4.001])// -29.001])
            rotate([180, 0, 180])
            switch_pot();
        translate([-52, 55, -support_length])
            cube([40, 30, 50], center=true);
        translate([-back_plate_width/2+10+mounting_inset, back_plate_height/2 - mounting_width/2, -support_length-thickness-0.001])
            negative_insert();
    }
    difference() {
        translate([back_plate_width/2-10-mounting_inset, -back_plate_height/2 + mounting_width/2, -thickness-support_length/2])
            cube([10, 10, support_length], center=true);
        translate([back_plate_width/2-10-mounting_inset,-back_plate_height/2 + mounting_width/2, -support_length-thickness-0.001])
            negative_insert();
    }
}

scale([-1, 1, 1])
back_plate();

// color([1, 0, 0, 0.3])
// translate([elec_offset_x, elec_offset_y, elec_offset_z])
// electronics();