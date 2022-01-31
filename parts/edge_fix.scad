use <../pills/dimensions.scad>

thickness = 4;
fix_thickness = 1;
fix_height = 5;
inset = 10;
width = plate_width() + led_height() * 2 + thickness*6 + fix_thickness;
height = plate_height() + led_height() * 2 + thickness*6 + fix_thickness;
module edge_fix() {
    translate([0, 0, 0])
    difference() {
        cube([width, height, fix_thickness], center=true);
        cube([width - inset*2, height - inset*2, thickness*3], center=true);
    }
    translate([0, 0, (fix_height - fix_thickness)/2])
    difference() {
        cube([width + fix_thickness, height + fix_thickness, fix_height], center=true);
        cube([width, height, fix_height*2], center=true);
    }
}

edge_fix();