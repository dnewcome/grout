// trapezoidal rounded pocket shape
module rnd_trap(w1, w2, h, r) {
    hull() {
        translate([-w1/2+r/2,h/2-r/2]) circle(r = r);
        translate([w1/2-r/2, h/2-r/2]) circle(r = r);
        translate([-w2/2+r/2, -h/2+r/2]) circle(r = r);
        translate([w2/2-r/2, -h/2+r/2]) circle(r = r);
    }
}

// special case of trapezoid with parallel sides
module rnd_rect_ctr(w, h, r) {
    rnd_trap(w, w, h, r);
}
 