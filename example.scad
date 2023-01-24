use <grout.scad>

// adjust items according to scale
scale_len = 25 * 25.4;

// distance of 21st fret from center of neck pocket
// TODO: not used yet but we need to implement a way
// to index the neck position to the template since necks
// vary in their heel geometry
fret_21_offset = 0 * 25.4;

// inside curves have a min dia of the tool used
router_dia = 3;

// full routing template including body shape
difference() {   
    import("strat-body-outline.svg");
    jazz_layout();
}