import org.openkinect.processing.*;

Kinect kinect;
Kinect2 kinect2;

void setup() {
  size(1536, 848);

  //v2
  kinect2 = new Kinect2(this);
  kinect2.start();

  //v1
  kinect = new Kinect(this);
  kinect.startDepth();
  kinect.startVideo();
  kinect.setColorDepth(false);
}


void draw() {
  background(0);

  //v2
  PImage depth = kinect2.getDepthImage();
  image(depth, 0, 0);

  PImage ir = kinect2.getIrImage();
  image(ir, 512, 0);

  PImage rgb = kinect2.getVideoImage();
  image(rgb, 512*2, 0, 512, 424);

  //v1 getDepthImage
  image(kinect.getDepthImage(), 0, 424, 512, 424);
  image(kinect.getVideoImage(), 512*2, 424, 512, 424);
}