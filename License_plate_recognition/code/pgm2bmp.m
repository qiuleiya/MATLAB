function [  ] = pgm2bmp()


 pgms = dir('.\data\A\*.png');
 num_pgms = length( pgms );
 for i = 1 : num_pgms
   p_file = fullfile( '.\data\A\' , pgms(i).name );
   p      = imread( p_file );

   [ path , name , ext ] = fileparts( p_file ) ;
   p=imresize(p,[40 32]);

   filename = strcat( name , '.bmp' );

  b_file = fullfile( '.\data\A\' , filename ) ;


 imwrite( p , b_file , 'bmp' );

end
end
pgm = imread('.\data\A\7.png');
  p=imresize(pgm,[40 32]);
 
   imwrite(p,'.\data\A\7.bmp');
  