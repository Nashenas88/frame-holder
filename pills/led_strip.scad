use <dimensions.scad>

module led_strip() {
    translate([0, 0, led_width()/2])
    difference() {
        cube([plate_width() + led_height() * 2, plate_height() + led_height() * 2, led_width()], center=true);
        cube([plate_width(), plate_height(), led_width() * 2], center=true);
    }
}

led_strip();