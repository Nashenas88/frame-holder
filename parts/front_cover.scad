use <../pills/dimensions.scad>
use <../pills/negative_insert.scad>
use <../pills/power_connector.scad>

thickness = 4;

module front_cover() {
    // difference() {
    //     cube([
    //         plate_width(),
    //         plate_height(),
    //         3.5
    //         ], center=true);
    //     cube([
    //         plate_width() - hole_offset()*4 + 2,
    //         plate_height() - hole_offset()*4 + 2,
    //         3*2
    //         ], center=true);

    // }
    
    difference() {
        translate([0, 0, thickness])
        cube([
            plate_width() + led_height() * 2 + thickness*4,
            plate_height() + led_height() * 2 + thickness*4,
            thickness*2
            ], center=true);
        translate([0, 0, thickness])
        cube([
            plate_width() - hole_offset()*4 + 6,
            plate_height() - hole_offset()*4 + 6,
            thickness*3
            ], center=true);
        translate([-plate_width()/2 + hole_offset(), -plate_height()/2 + hole_offset(), -0.001])
            negative_insert();
        translate([plate_width()/2 - hole_offset(), -plate_height()/2 + hole_offset(), -0.001])
            negative_insert();
        translate([plate_width()/2 - hole_offset(), plate_height()/2 - hole_offset(), -0.001])
            negative_insert();
        translate([-plate_width()/2 + hole_offset(), plate_height()/2 - hole_offset(), -0.001])
            negative_insert();
    }

    translate([0, 0, -thickness*6])
    difference() {
        cube([
            plate_width() + led_height() * 2 + thickness*6,
            plate_height() + led_height() * 2 + thickness*6,
            thickness*16
            ], center=true);
        cube([
            plate_width() + led_height() * 2 + thickness*4,
            plate_height() + led_height() * 2 + thickness*4,
            thickness*30
            ], center=true);
    }
    // translate([-(plate_width() + led_height() * 2 + thickness*2)/2, 0, -thickness*7])
    // power_connector();

}

front_cover();