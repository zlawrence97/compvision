%gaussian pyramid

g0=imread('blackpanther.jpg');
whos
figure,imshow(g0);
g00=imresize(double(g0),0.25);
figure,imshow(g00);
g=[1/32 4/32 1/32;4/32 12/32 4/32;1/32 4/32 1/32];

 g01=round(conv2(g00,g,'same'));
 g1=imresize(g01,0.5);
 figure,imshow(g1);
 
 g02=round(conv2(g1,g,'same'));
 g2=imresize(g02,0.5);

g03=round(conv2(g2,g,'same'));
g3=imresize(g03,0.5);

g04=round(conv2(g3,g,'same'));
g4=imresize(g04,0.5);
figure,imshow(g4);

%constructing laplacian pyramid  
l01=imresize(g1,2);
l0=g00-l01;
figure,imshow(l0);