$fn = 100;
thickness = 5;
diameter = 60;
length = 40;
width = 50;
height = 30;
holeSeparation=40;

module HeadSet(thickness,diameter,length,width){
    
    
   
   translate([diameter/3,0,0]) difference(){
    difference(){
difference(){    
cylinder(h=length,d=diameter,center=false);
cylinder(h=length,d=diameter-thickness*2,center=false);
}
translate([-diameter/4,-diameter/2 ,0])cube([diameter,diameter,length] );
}
translate([-diameter,0.7*(width/2),0])cube([diameter,diameter,length]);
translate([-diameter,-(diameter+0.7*(width/2)),0])cube([diameter,diameter,length]);
}
    
    
    
    }
    
    module Base(alto,ancho,fondo){
        difference(){
        cube([alto,ancho,fondo],center=true);
       translate([5,holeSeparation/4,-thickness/2]) cylinder(h=fondo,d1=4,d2=8);
       translate([5,-holeSeparation/4,-thickness/2]) cylinder(h=fondo,d1=4,d2=8);
            }
        }
        
module tapaSuperior(thickness,length,diameter,width){
   translate([diameter/3,0,0]) difference(){
    difference(){
difference(){    
cylinder(h=thickness,d=diameter+thickness*4,center=false);
cylinder(h=thickness,d=diameter-thickness,center=false);
}
translate([-diameter/4,-diameter/2 ,0])cube([diameter,diameter,length] );
}
translate([-diameter,0.7*(width/2),0])cube([diameter,diameter,length]);
translate([-diameter,-(diameter+0.7*(width/2)),0])cube([diameter,diameter,length]);
translate([0,-100,0])cube([diameter*5,diameter*5,10]);
}    


}   
module soporte(altura,thickness,height){
   translate([0,thickness/2,0])rotate([90,90,0]) {linear_extrude(thickness)polygon(points=[[0,0],[altura,height*0.6],[altura,0]]);}
    
    }
    
    union(){
    translate([-thickness,0,length]){soporte(length,thickness,height);}
    
    translate([0,0,thickness/2])    Base(height,width,thickness);
   translate([0,0,thickness])HeadSet(thickness,diameter,length,width);
   translate([0,0,length]) tapaSuperior(thickness,length,diameter,width);
    }