use <primitives.scad>

locating_hole_dia = str(locating_hole_d) == "undef" ? 3 : locating_hole_d;

// stratocaster style neck
// origin is at 20th fret
// 20th fret is chosen kind of arbitrarily mostly because it's rare for a neck to have
// fewer than 20 frets and makes a convenient origin point.
module neck_strat() {
    w1 = 55;
    w2 = 57.25;
    h = 3.5 * 25.4;
    d = 5; // pocket corner diameter 
    // offset of 20th fret from end of pocket
    fret_offset = 27.5;
    translate([0, h/2-fret_offset]) { 
        rnd_trap(w1, w2, h, d);
    }
}

// neck mounting plate has a hole pattern and an outline. Outline mode
// makes sense when overlaying on the body to see if the plate will overhang
// Mark mode makes the locating hole sized for a transfer punch
module neck_strat_plate(outline = false, mark = true) {
    w = 51;
    hw = 38.25;
    h = 64;
    hh = 51;
    d = mark ? locating_hole_dia : 6; 
    
    if (outline == true) {
        difference() {
            square([w, h], center = true);
            translate([-hw/2, hh/2]) circle(d=d);
            translate([hw/2, hh/2]) circle(d=d);
            translate([hw/2, -hh/2]) circle(d=d);
            translate([-hw/2, -hh/2]) circle(d=d);
        }
    }
    else {
        translate([-hw/2, hh/2]) circle(d=d);
        translate([hw/2, hh/2]) circle(d=d);
        translate([hw/2, -hh/2]) circle(d=d);
        translate([-hw/2, -hh/2]) circle(d=d);
    }
}
  
// pickup-ring style humbucker
module pickup_humbucker(mark = true) {
    w = 70;
    h = 38;
    wing_w = 86;
    wing_h = 20;
    router_d = 6; // routing tool size
    screw_d = mark ? locating_hole_dia : 2;
    screw_w = 83;
    screw_h = 38;
    
    // pickup cavity
    rnd_rect_ctr(wing_w, wing_h, router_d);
    rnd_rect_ctr(w, h, router_d);
    
    // pickup ring screw holes
    translate([-screw_w/2, screw_h/2]) circle(d=screw_d);
    translate([screw_w/2, screw_h/2]) circle(d=screw_d);
    translate([screw_w/2, -screw_h/2]) circle(d=screw_d);
    translate([-screw_w/2, -screw_h/2]) circle(d=screw_d);
}

// TODO: measure correct width
module bridge_tuneomatic_jazzmaster(ctr, d) {
    translate([-ctr/2, 0]) circle(d=d);
    translate([ctr/2, 0]) circle(d=d);
}

module bridge_jazzmaster() {
    w = 2.75 * 25.4;
    w2 = 0.625 * 25.4;
    h = 2.5 * 25.4;
    h2 = 3.125 * 25.4;
    rtr_bit_d = 3;
    rnd_rect_ctr(w, h, rtr_bit_d);
    translate([0, 10]) rnd_rect_ctr(w2, h, rtr_bit_d);
    // todo: locate screw holes
    
}
    
// basic all-in one saddle tailpiece
module fixed_tailpiece(outline = false, mark = true) {
    h = 43;
    w = 78;
    
    // true size is 4mm, use 1mm for marking
    d = mark ? locating_hole_dia : 4;
    hole_w = 67;
    hole_h = 28.5;
    saddle_offset = 8.5;
    
    
    translate([-w/2, -h/2-saddle_offset]) {
        if (outline == true) {
            difference() {
                square([w, h]);
            
                translate([(w - hole_w) / 2, (h - hole_h) / 2]) circle(d = d);
                translate([(w - hole_w) / 2 + hole_w, (h - hole_h) / 2]) circle(d = d);
                translate([(w - hole_w) / 2 + hole_w, (h - hole_h) / 2 + hole_h]) circle(d = d);
                translate([(w - hole_w) / 2, (h - hole_h) / 2 + hole_h]) circle(d = d);

                translate([(w - hole_w) / 2 + hole_w / 2, (h - hole_h) / 2]) circle(d = d);
            }
        }
        else {
            translate([(w - hole_w) / 2, (h - hole_h) / 2]) circle(d = d);
            translate([(w - hole_w) / 2 + hole_w, (h - hole_h) / 2]) circle(d = d);
            translate([(w - hole_w) / 2 + hole_w, (h - hole_h) / 2 + hole_h]) circle(d = d);
            translate([(w - hole_w) / 2, (h - hole_h) / 2 + hole_h]) circle(d = d);

            translate([(w - hole_w) / 2 + hole_w / 2, (h - hole_h) / 2]) circle(d = d);
        }
    }
}
