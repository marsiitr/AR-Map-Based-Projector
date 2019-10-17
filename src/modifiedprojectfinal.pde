import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;


import KinectPV2.*;

KinectPV2 kinect;
 int count=0;


//BUFFER ARRAY TO CLEAN DE PIXLES
PImage img;

void setup() {
  size(920, 720, P3D);
 

  img = createImage(512, 424, PImage.RGB);

  kinect = new KinectPV2(this);
  kinect.enableDepthImg(true);
  kinect.enableColorImg(true);
  kinect.enablePointCloud(true);
  kinect.enableInfraredImg(true);
  kinect.init();
}
void draw() {
  background(0);
int [] depth= kinect.getRawDepthData();

img.loadPixels();
for (int i = 0; i <KinectPV2.WIDTHDepth; i++) 
{
    for (int j = 0; j < KinectPV2.HEIGHTDepth; j++) 
    {
    count=i+j*KinectPV2.WIDTHDepth;
      int d= depth[count]-150;
if(d<=500){img.pixels[count]=color(255,0,0);}//red
  if(d>500 && d<=530){img.pixels[count]=color(255-((51*(d-500))/30),255-(((d-500)*153)/30),255-(((d-500)*255)/30));}    //white-brown
if(d>530 && d<=560){img.pixels[count]=color(204+((d-530)*51)/30,102-(102*(d-530))/30,0);}  //brown->red
  if(d>560 && d<=590){img.pixels[count]=color(255,((d-560)*128)/30,0);}  //red-orange
  if(d>590 && d<=620){img.pixels[count]=color(255,128+(127*(d-590)/30),0);}  //orange-yellow
if(d>620 && d<=650){img.pixels[count]=color(255-(255*(d-620)/30),255,0);}  //yellow-green
    if(d>650 && d<=680){img.pixels[count]=color(0,255,((d-650)*255)/30);}//green-aqua blue
  if(d>680&&d<720){img.pixels[count]=color((51*(d-680))/30,255-(102*(d-680))/30,255);}
  if(d>720&&d<750){img.pixels[count]=color(51+(102*(d-720))/30,102+(51*(d-720))/30,255);}
    if(d>750&&d<780){img.pixels[count]=color(153+(102*(d-750))/30,153+(51*(d-750)/30),255);}
    
}
    
}
img.updatePixels();
scale(-1.0,1.0);
//printArray(depth);
  image(img,-2*img.width,-0.15*img.height,1024,800);
 text("fps: "+frameRate, 50, 50);
}
