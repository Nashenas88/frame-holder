use <../pills/dimensions.scad>
use <../pills/negative_screw.scad>

thickness = 4;
$fs = 1;
$fa = 0.4;

module led_holder() {
    translate([0, 0, -(led_width()/2)])
    union() {
        difference() {
            cube([
                plate_width() + led_height() * 2 + thickness,
                plate_height() + led_height() * 2 + thickness,
                led_width()
                ], center=true);
            cube([
                plate_width() + led_height() * 2,
                plate_height() + led_height() * 2,
                led_width()*2
                ], center=true);
            cube([
                thickness, thickness, thickness
            ], center=true);
        translate([
                -(plate_width() + led_height() * 2)/2+thickness/2, (plate_height() + led_height() * 2)/2 + 0.001, 0])
            cube([
                thickness, thickness, thickness*3
            ], center=true);
        }

        translate([0, 0, led_width() / 2 + 1.5])
        difference() {
            cube([
                plate_width() + led_height() * 2 + thickness,
                plate_height() + led_height() * 2 + thickness,
                3
                ], center=true);
            cube([
                plate_width() - hole_offset()*4 + 2,
                plate_height() - hole_offset()*4 + 2,
                3*2
                ], center=true);
            negative_screw();
        }
    }
}

led_holder();