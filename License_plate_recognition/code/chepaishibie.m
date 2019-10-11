function varargout = chepaishibie(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chepaishibie_OpeningFcn, ...
                   'gui_OutputFcn',  @chepaishibie_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function chepaishibie_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = chepaishibie_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function pushbutton1_Callback(hObject, eventdata, handles)
global net1
net1=shuzinet();

function pushbutton2_Callback(hObject, eventdata, handles)

global net2
net2=zimunet();

function pushbutton3_Callback(hObject, eventdata, handles)

global net3
net3=hanzinet();

function pushbutton4_Callback(hObject, eventdata, handles)
global net4
net4=shuzizimunet();

function pushbutton5_Callback(hObject, eventdata, handles)
axis off;
global M;
  [filename, pathname] = uigetfile('*.jpg', '读取图片文件'); %选择图片文件
  if isequal(filename,0)   %判断是否选择
       msgbox('没有选择任何图片');
    else
       pathfile=fullfile(pathname, filename);  %获得图片路径
       
       M=imread(pathfile);     %将图片读入矩阵
       imshow(M);
  end
 
function pushbutton6_Callback(hObject, eventdata, handles)
global M;
imgx=chuli(M);
stringsplit(imgx);

function pushbutton7_Callback(hObject, eventdata, handles)
figure('name','切割后的图像：');
for i=1:7
subplot(1,7,i);
im0=imread(strcat('./chepai/',num2str(i),'.bmp'))
imshow(im0);
title(num2str(i));
end

function pushbutton8_Callback(hObject, eventdata, handles)
shibie();

function pushbutton13_Callback(hObject, eventdata, handles)
shuzishibie();

function pushbutton14_Callback(hObject, eventdata, handles)
zimushibie();

function pushbutton15_Callback(hObject, eventdata, handles)
hanzishibie();

function pushbutton16_Callback(hObject, eventdata, handles)
shuzizimushibie();
