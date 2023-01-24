include <parts.scad>
    
// when creating a standalone template without a body shape
// this rectangular outline is used
module template_outline() {
    translate([-100, -400]) square([200, 400]);
}

// sample layout for a tune-o-matic style bridge
module tuneomatic_layout() {
    translate([0, -25]) neck_strat();
    translate([0, -140]) pickup_humbucker();
    translate([0, -240]) pickup_humbucker();
    translate([0, -320]) bridge(20, 5);
    translate([0, -350]) tailpiece();
}

// sample layout for a jazzmaster style bridge
module jazz_layout() {
    translate([0, -25]) neck_pocket();
    translate([0, -140]) pickup_humbucker();
    translate([0, -240]) pickup_humbucker();
    translate([0, -320]) jazzmaster_bridge();
}

// standalone routing template using jazzmaster layout
module jazz_template() {
    difference() {
        template_outline();
        jazz_layout();
    }
}
