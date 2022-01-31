base_radius = 17.4/2;
base_width = 15.3;
thickness = 11.2;
pin_sides = 2.5;
pin_thickness = 1;
shaft_radius= 7/2;
shaft_height=15;
thread_height=6.5;

$fs=1;
$fa=0.4;
module switch_pot() {
    translate([0, 0, -thickness/2])
        cylinder(h=thickness, r=base_radius, center=true);
    translate([-base_radius+pin_thickness/2, 0, pin_thickness/2])
        cube([pin_thickness, pin_sides, pin_sides], center=true);
    translate([0, -base_width/2, -thickness/2])
        cube([base_width, base_width/2, thickness], center=true);
    translate([0, 0, shaft_height/2])
        cylinder(h=shaft_height, r=shaft_radius, center=true);
}

switch_pot();