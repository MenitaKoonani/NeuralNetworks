function varargout = gui_final(varargin)
tic;
% GUI_FINAL M-file for gui_final.fig
%      GUI_FINAL, by itself, creates a new GUI_FINAL or raises the existing
%      singleton*.
%
%      H = GUI_FINAL returns the handle to a new GUI_FINAL or the handle to
%      the existing singleton*.
%
%      GUI_FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FINAL.M with the given input arguments.
%
%      GUI_FINAL('Property','Value',...) creates a new GUI_FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_final

% Last Modified by GUIDE v2.5 26-Mar-2016 18:01:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_final_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_final_OutputFcn, ...
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


% --- Executes just before gui_final is made visible.
function gui_final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_final (see VARARGIN)

% Choose default command line output for gui_final
handles.output = hObject;


a=ones([240 520]);
axes(handles.axes1);
imshow(a);
axes(handles.axes4);
imshow(a);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in inp_signal.
function inp_signal_Callback(hObject, eventdata, handles)
% hObject    handle to inp_signal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cd Input
file=uigetfile('*.xlsx');
inp = xlsread(file,1); 
cd ..

axes(handles.axes1);
plot(inp);title('Input Signal')
xlabel('time');
ylabel('Conc. of Co2(KPa)');
handles.inp=inp;
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in features.
function features_Callback(hObject, eventdata, handles)
% hObject    handle to features (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inp=handles.inp;

feat1=mean(mean(inp));
feat2=max(max(inp));
feat3=min(min(inp));
qfeat=(feat1+feat2+feat3)/3;
disp(feat1);
disp(feat2);
disp(feat3);

%%%% Angle features

[m n]=size(inp);
feat4=mean(inp)+(sum(tan(inp))/(m));
disp(feat4);

set(handles.edit1,'string',feat1);
set(handles.edit2,'string',feat2);
set(handles.edit3,'string',feat3);

handles.feat2=feat2;
handles.qfeat=qfeat;
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in data_base.
function data_base_Callback(hObject, eventdata, handles)
% hObject    handle to data_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

for di=1:1:18
    file = strcat(int2str(di),'.xlsx');
    cd DS_train    
       inp = xlsread(file,1); 
    cd .. 
f1=mean(mean(inp));
f2=max(max(inp));
f3=min(min(inp));
db(:,di)=[f1 f2 f3];
dfeatures(:,di) = (f1+f2+f3)/3;
end
disp(dfeatures);

save X dfeatures
save Xdb db


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in classifier.
function classifier_Callback(hObject, eventdata, handles)
% hObject    handle to classifier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load netp
qfeat=handles.qfeat;
feat2=handles.feat2;
%%%%%%classification
cout = sim(netp,qfeat); 
cout = vec2ind(cout);

if isequal(cout,1)
    
   set(handles.text5,'String','Stage :'); 
   set(handles.text6,'String','HYPERVENTILATION');
   
elseif isequal(cout,2)
    
    
    if (feat2>=5.69)&(feat2<=5.71)

  set(handles.text5,'String','Stage :'); 
  set(handles.text6,'String','BRONCHOSPASM');
    
    else
            
  set(handles.text5,'String','Stage :'); 
  set(handles.text6,'String','NORMAL VENTILATION');
    end

  


elseif isequal(cout,3)
    
  set(handles.text5,'String','Stage :'); 
  set(handles.text6,'String','HYPOVENTILATION');
  
  	if (feat2>=5.7)&(feat2<=6.2)
	msgbox('Stage1');
        
    elseif (feat2>=6.2)&(feat2<=7.1)
	 msgbox('Stage2');
        
    elseif (feat2>=7.1)&(feat2<=8)
	 msgbox('Stage3'); 
    end
  
  
else
end

toc;
disp(toc);

% --- Executes on button press in nn_train.
function nn_train_Callback(hObject, eventdata, handles)
% hObject    handle to nn_train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%Assigning target to each class features


Nc = 6; 
T=1;

load X dfeatures

for dfi=1:size(dfeatures,2)
   
    if Nc<1
      T = T+1;
      Nc =5;
      acti(:,dfi) = T; 
    else
      acti(:,dfi) = T;  
      Nc = Nc-1;  
    end
end
       
actv = ind2vec(acti)   %%%%%Indices to vector creation

netp = newpnn(dfeatures,actv)   %%%%network training

save netp netp;

helpdlg('NNtraining completed');

return;  


% --- Executes on button press in pre_process.
function pre_process_Callback(hObject, eventdata, handles)
% hObject    handle to pre_process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inp=handles.inp;
Input=reshape(inp,[],1);
[r c]=size(Input)
if r == 36001
    Input = medfilt2(inp',[1 360]);
else
    Input = medfilt2(inp',[1 36]);
end
    
axes(handles.axes4);
plot(Input);title('Preprocess Signal')

xlabel('time');
ylabel('Conc. of Co2(KPa)');