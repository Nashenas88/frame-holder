$fs=1;
$fa=0.4;

width = 9.2;
height = 11;
depth = 14.5;

barrel_radius = 4.1;
barrel_top_offset = 0.5;

plate_thickness = 3.5;

bottom_depth = 14.5;

module power_connector() {
    difference() {
        translate([-plate_thickness/2, 0, -height/2])
            cube([plate_thickness, width, height], center=true);
        translate([-plate_thickness/2, -width/2+1.5/2-0.001, -1.5/2+0.001])
            cube([1.4, 1.5, 1.5], center=true);
        translate([-plate_thickness/2, +width/2-1.5/2+0.001, -1.5/2+0.002])
            cube([1.4, 1.5, 1.5], center=true);
    }
    translate([(depth-plate_thickness)/2-0.001, 0, -barrel_radius-barrel_top_offset])
        rotate([0, 90, 0])
        cylinder(h=depth-plate_thickness, r=barrel_radius, center=true);
    translate([bottom_depth/2-plate_thickness, 0, -height/2-(height-6.5)/2])
        cube([bottom_depth, width, 6.5], center=true);
    translate([bottom_depth/2-0.25, 0, -height/2-(height-6.5)/2-5])
        cube([8, width, 6], center=true);
}

power_connector();
