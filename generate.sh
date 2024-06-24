## Command to generate templates with openscad

mkdir ./out

# neck heel pocket removable template insert slug
openscad -D slug=true -o out/test-slug.dxf example.scad

# main template
openscad -D slug=false -o out/test-template.dxf example.scad

