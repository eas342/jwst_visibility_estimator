# jwst_visibility_estimator

## **Note**: This is only an gross very approximate tool made before the official version was available.
## Please use the Space Telescope jwst visibility tool: <a href="">https://jwst-docs.stsci.edu/display/JPP/JWST+General+Target+Visibility+Tool+Help</a>

Calculates an estimate for JWST visibility for a list of objects.

The only needed files are rough_jwst_vis.pro and vis_window.pro. Make sure they are in the same directory.

To make a plot of the visibility for an object, simply plug in its RA in decimal hours and DEC in decimal degrees.

Example:
rough_jwst_vis,ten(22,03,10.772),ten(18,53,03.54),'HD 209458b'

Or, make a list of objects
rough_jwst_vis,RAlist,DEClist,Namelist
