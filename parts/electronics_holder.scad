use <../pills/dimensions.scad>
use <../pills/electronics.scad>

$fs=1;
$fa=0.1;
thickness=4;
module electronics_holder() {
    difference() {
        translate([0, 0, -electronics_thickness()/2 - thickness])
        cube([electronics_width() + thickness*2, electronics_height() + thickness*2, electronics_thickness()+thickness], center=true);
        translate([0, 0, -thickness])
        electronics();
        translate([(64-16)/2, -12, 0])
        cylinder(h=thickness*3, r=1.5, center=true);
        translate([-(64-16)/2, -12, 0])
        cylinder(h=thickness*3, r=1.5, center=true);
    }
}

electronics_holder();