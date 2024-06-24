## Command to generate templates with openscad

# neck heel pocket removable template insert slug
openscad -D slug=true -o test-slug.dxf grout-test.scad

# main template
openscad -D slug=false -o test-template.dxf grout-test.scad

