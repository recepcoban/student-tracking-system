function varargout = optikf(varargin)
% OPTIKF MATLAB code for optikf.fig
%      OPTIKF, by itself, creates a new OPTIKF or raises the existing
%      singleton*.
%
%      H = OPTIKF returns the handle to a new OPTIKF or the handle to
%      the existing singleton*.
%
%      OPTIKF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTIKF.M with the given input arguments.
%
%      OPTIKF('Property','Value',...) creates a new OPTIKF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before optikf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to optikf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help optikf

% Last Modified by GUIDE v2.5 22-May-2015 22:08:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @optikf_OpeningFcn, ...
                   'gui_OutputFcn',  @optikf_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before optikf is made visible.
function optikf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to optikf (see VARARGIN)

% Choose default command line output for optikf
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes optikf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = optikf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in gozAt.
function gozAt_Callback(hObject, eventdata, handles)
% hObject    handle to gozAt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename pathname]=uigetfile({'.jpg'},'Formu Alýnýz');
path=strcat(pathname,filename);
set(handles.edit1,'String', path);

% --- Executes on button press in oku.
function oku_Callback(hObject, eventdata, handles)
% hObject    handle to oku (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
u=get(handles.edit1,'String');
a=imread(u);
b=rgb2gray(a); 

harf=['A' 'B' 'C' 'Ç' 'D' 'E' 'F' 'G' 'Ð' 'H' 'I' 'Ý' 'J' 'K' 'L' 'M' 'N' 'O' 'Ö' 'P' 'R' 'S' 'Þ' 'T' 'U' 'Ü' 'V' 'Y' 'Z'];
cevap=['A' 'B' 'C' 'D' 'E'];

%%Öðrenci No x=35 y=56 

ogrenci_no='';
for j=0:4
    for i=0:9
        test=daire_analizi(b, 35 + j*15, 56 + i*15);
        if test == 1
            ogrenci_no=strcat(ogrenci_no,int2str(i));
            break;
        end
    end
end
disp(ogrenci_no);

%%Sýnýf x=125 y=56

sinif='';
for j=0:3
    for i=0:9
        test=daire_analizi(b, 125 + j*15, 56 + i*15);
        if test == 1
            sinif=strcat(sinif,int2str(i));
            break;
        end
    end
end
disp(sinif);

%%TC Kimlik No x=35 y=266

tc_no='';
for j=0:10
    for i=0:9
        test=daire_analizi(b, 35 + j*15, 266 + i*15);
        if test == 1
            tc_no=strcat(tc_no,int2str(i));
            break;
        end
    end
end
disp(tc_no);

%%Adý x=35 y=461

adi='';
for j=0:9
    test=0;
    for i=0:28
        test=daire_analizi(b, 35 + j*15, 461 + i*15);
        if test == 1
            adi=strcat(adi,harf(i+1));
            break;
        end
    end
    if test == 0
        g='.';
        adi=strcat(adi,g);
        
    end
end
disp(adi);

%%Soyadý x=200 y=461

soyadi='';
for j=0:9
    for i=0:28
        test=daire_analizi(b, 200 + j*15, 461 + i*15);
        if test == 1
            soyadi=strcat(soyadi,harf(i+1));
            break;
        end
    end
end
disp(soyadi);

%%Türkçe x=379 y=221

turkce='';
for j=0:39
    test=0;
    knt=0;
    for i=0:4
        test=test+1;
        if daire_analizi(b, 379 + i*15, 221 + j*15);
            knt=knt + 1;
                if knt >=2
                    turkce(j+1)='Y';
                    break;
                end
            turkce(j+1)=cevap(i+1);
        end
    end
    if test == 0
        %soru bos
        turkce(j+1)='N';
    end

end
disp(turkce);

%%Sosyal Bilimleri x=469 y=221

sosyal='';
for j=0:39
    test=0;
    for i=0:4
        test=daire_analizi(b, 469 + i*15, 221 + j*15);
        if test == 1
            sosyal=strcat(sosyal,cevap(i+1));
            break;
        end
    end
    if test == 0
        sosyal=strcat(sosyal,'N');
    end
end
disp(sosyal);

%%Matematik x=559 y=221

matematik='';
for j=0:39
    test=0;
    for i=0:4
        test=daire_analizi(b, 559 + i*15, 221 + j*15);
        if test == 1
            matematik=strcat(matematik,cevap(i+1));
            break;
        end
    end
    if test ==0
        matematik=strcat(matematik,'N');
    end
end
disp(matematik);

%%Fen Bilimleri x=649 y=221

fen='';
for j=0:39
    test=0;
    for i=0:4
        test=daire_analizi(b, 649 + i*15, 221 + j*15);
        if test == 1
            fen=strcat(fen,cevap(i+1));
            break;
        end
    end
    if test == 0
        fen=strcat(fen,'N');
    end
end
disp(fen);

set(handles.text6,'String', ogrenci_no);
set(handles.text7,'String', sinif);
set(handles.text8,'String', tc_no);
set(handles.text9,'String', adi);
set(handles.text10,'String', soyadi);

onceki=str2num(get(handles.edit6, 'String'));
disp(onceki);
if  onceki~= ogrenci_no
    dosya=fopen('sonuc.bitirme','a');
    fprintf(dosya,'%s\n',ogrenci_no);
    fprintf(dosya,'%s\n',sinif);
    fprintf(dosya,'%s\n',tc_no);
    fprintf(dosya,'%s\n',adi);
    fprintf(dosya,'%s\n',soyadi);
    fprintf(dosya,'%s\n',turkce);
    fprintf(dosya,'%s\n',sosyal);
    fprintf(dosya,'%s\n',matematik);
    fprintf(dosya,'%s\n',fen);
    fclose(dosya);
    set(handles.edit6,'String', int2str(ogrenci_no))
    disp(onceki);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
