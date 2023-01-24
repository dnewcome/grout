include <parts.scad>

module neck_pocket() {
    // TODO: locate screw holes
    rnd_trap(50, 55, 60, 5);
}

module neck_pickup() {
    pickup_humbucker();
}

module bridge_pickup() {
    pickup_humbucker();
}
    
// when creating a standalone template without a body shape
// this rectangular outline is used
module template_outline() {
    translate([-100, -400]) square([200, 400]);
}

// sample layout for a tune-o-matic style bridge
module tuneomatic_layout() {
    translate([0, -25]) neck_pocket();
    translate([0, -140]) neck_pickup();
    translate([0, -240]) bridge_pickup();
    translate([0, -320]) bridge(20, 5);
    translate([0, -350]) tailpiece();
}

// sample layout for a jazzmaster style bridge
module jazz_layout() {
    translate([0, -25]) neck_pocket();
    translate([0, -140]) neck_pickup();
    translate([0, -240]) bridge_pickup();
    translate([0, -320]) jazzmaster_bridge();
}

// standalone routing template using jazzmaster layout
module jazz_template() {
    difference() {
        template_outline();
        jazz_layout();
    }
}
