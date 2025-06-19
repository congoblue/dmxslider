// Definition size of housing
// **************************

       // Those settings have to be identical to the cover !!!
width_x      = 120;          // Width of the housing (outer dimension) 
depth_y      = 80;           // depth of the housing (outer dimension)
wall         = 1.8;          // Wall thickness of the box
cornerradius = 4.0;          // Radius of the corners
                             //   This value also defines the posts for stability and
                             //   for the press-in nuts!

       // Those settings are more or less independent from the cover
height_z     = 34;           // Heigth of the lower part. Total height is this value plus
                             //   the height of the cover
plate        = 1.8;          // Thickness of the bottom plain

       //Definition size of press-in nuts
nutdiameter  = 4.2;          // Hole diameter for thermal press-in nut
nutlength    = 5.8;          // Depth of the nut hole


//Definition of circle angular resolution
resol        = 36;

ard_x = 47;
ard_y = 20;
pillarheight=4;
pillardia=5;
holedia=2;


difference () {

// Construction of housing
   union () {
   // Definition of main body
      difference () {
         union () {
            cube ( [width_x, depth_y - (2* cornerradius), height_z], center = true );
            cube ( [width_x - (2* cornerradius), depth_y, height_z], center = true );
         };
         translate ( [0,0, 0.5+plate / 2] ){
            cube ( [width_x - (2* wall), depth_y- (2* wall), height_z - plate +1], center = true ); 
         };
      };
      
      translate ( [width_x/2-wall-2,20,-2] )
            cube ( [5.2, 18, height_z - 6], center = true ); 

      // Construction of four corner cylinders including nut holes
      // 1st quadrant
      translate ( [(width_x / 2) - cornerradius, (depth_y / 2) - cornerradius, 0 ] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      };

      // 2nd quadrant
      translate ( [-(width_x / 2) + cornerradius, (depth_y / 2) - cornerradius, 0] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      };

      // 4th quadrant
      translate ( [(width_x / 2) - cornerradius, -(depth_y / 2) + cornerradius, 0] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      };

      // 3rd quadrant
      translate ( [-(width_x / 2) + cornerradius, -(depth_y / 2) + cornerradius, 0] ) {
         difference () {
            cylinder (h=height_z, r=cornerradius, center = true, $fn = resol);
            translate ( [ 0,0,(height_z / 2)-(nutlength / 2) ] ) {
               cylinder (h = nutlength, r = nutdiameter / 2, center = true, $fn = resol);
            };
         };
      }; 
      
    //arduino pillars  
      /*
      translate ( [ard_x,ard_y,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x-15.2,ard_y-50.8,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x-(15.2+27.9),ard_y-50.8,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     };      

      translate ( [ard_x-(15.2+27.9+4.7),ard_y+1.25,-height_z/2+pillarheight/2+plate] ) {
         difference () {
             cylinder ( h = pillarheight, r = pillardia/2, center = true, $fn = resol );
             cylinder ( h = pillarheight, r = holedia/2, center = true, $fn = resol );
         };
     }; */     

    //temp arduino outline to test
    /*  translate ( [ard_x+2.75-53/2,ard_y+15.2-68/2,-height_z/2+pillarheight+plate+1.6/2] ) {
       cube ( [53, 68, 1.6], center = true);
      };*/
   };

// Space for the construction of holes, breakouts, ... 
   //DC jack
   translate ( [width_x/2, 20, 0] ) {
            rotate ([0,90,0]) cylinder ( h = 15, r = 13/2, center = true, $fn = resol );
         };

   //LED
   translate ( [width_x/2, 5, 0] ) {
            rotate ([0,90,0]) cylinder ( h = 15, r = 3/2, center = true, $fn = resol );
         };


   //XLR
   translate ( [width_x/2, -15, 0] ) {
            rotate ([0,90,0]) cylinder ( h = 15, r = 22/2, center = true, $fn = resol );
         };

   translate ( [width_x/2, -15+10, 10] ) {
            rotate ([0,90,0]) cylinder ( h = 15, r = 3.2/2, center = true, $fn = resol );
         };
   
   translate ( [width_x/2, -15-10, -10] ) {
            rotate ([0,90,0]) cylinder ( h = 15, r = 3.2/2, center = true, $fn = resol );
         };


};
