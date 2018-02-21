function varargout = smooth(varargin)
% SMOOTH MATLAB code for smooth.fig
%      SMOOTH, by itself, creates a new SMOOTH or raises the existing
%      singleton*.
%
%      H = SMOOTH returns the handle to a new SMOOTH or the handle to
%      the existing singleton*.
%
%      SMOOTH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMOOTH.M with the given input arguments.
%
%      SMOOTH('Property','Value',...) creates a new SMOOTH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before smooth_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to smooth_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help smooth

% Last Modified by GUIDE v2.5 18-Feb-2018 00:04:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @smooth_OpeningFcn, ...
                   'gui_OutputFcn',  @smooth_OutputFcn, ...
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


% --- Executes just before smooth is made visible.
function smooth_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to smooth (see VARARGIN)

% Choose default command line output for smooth
handles.output = hObject;

% add our own data fields 
handles.minFreq = 1; 
handles.maxFreq = 10; 
handles.amp = 8; 
handles.freq = 2.5; 
handles.t = 0:0.001:1;
handles.x = handles.amp * sin(2*pi*handles.freq*handles.t); 
handles.noise = randn(1,length(handles.t)); 
handles.interference = sin(2*pi*60*handles.t); 
handles.window = NaN;
handles.windowIndex = 1; 
handles.addRandom = true; 
handles.addInterference = false; 
handles.plotOriginal = false; 
handles.plotNoisy = true; 
handles.plotSmoothed = true;

set(handles.amplEdit,'String',num2str(handles.amp)); 
fs = (handles.freq - handles.minFreq) / ...
(handles.maxFreq - handles.minFreq); 
set(handles.freqSlider,'Value',fs); 
set(handles.originalBox,'value',handles.plotOriginal); 
set(handles.noisyBox,'value',handles.plotNoisy); 
set(handles.smoothedBox,'value',handles.plotSmoothed); 
set(handles.windowMenu,'Value',handles.windowIndex);
str = get(handles.windowMenu, 'String');
handles.window = str2double(str{handles.windowIndex}); 
set(handles.radiobutton2,'Value',1);

plotit(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes smooth wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = smooth_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in refreshButton.
function refreshButton_Callback(hObject, eventdata, handles)
% hObject    handle to refreshButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('You have just pressed the REFRESH button!\n');
minFreq = 1; 
maxFreq = 10;
t = 0:0.001:1;
% Get parameters from GUI
fs = get(handles.freqSlider,'Value');
freq = minFreq + fs * (maxFreq - minFreq);
amp = str2double(get(handles.amplEdit,'String'));
% Calculate data
x = amp * sin(2*pi*freq*t);
% Create time plot in proper axes 
plot(handles.axes,t,x) 
set(handles.axes,'XMinorTick','on') 
grid on


% --- Executes on slider movement.
function freqSlider_Callback(hObject, eventdata, handles)
% hObject    handle to freqSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% Update handles structure 
fs = get(handles.freqSlider,'Value');
handles.freq = handles.minFreq + fs * (handles.maxFreq - handles.minFreq); 
handles.x = handles.amp * sin(2*pi*handles.freq*handles.t); 
plot(handles.axes,handles.t,handles.x); 
set(handles.axes,'XMinorTick','on');
grid on

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function freqSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function amplEdit_Callback(hObject, eventdata, handles)
% hObject    handle to amplEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amplEdit as text
%        str2double(get(hObject,'String')) returns contents of amplEdit as a double
amp = str2double(get(hObject,'String')); 
if isnan(amp) || ~isreal(amp) 
    % isdouble returns NaN for non-numbers and we need a real number
    % Disable the REFRESH button
    set(hObject,'String','Error: NaN')
    
else
    if abs(amp) > 100 
    amp = 100;
    set(hObject,'String',num2str(amp));
    end
    handles.amp = amp;
    handles.x = handles.amp * sin(2*pi*handles.freq*handles.t);
    plot(handles.axes,handles.t,handles.x);
    set(handles.axes,'XMinorTick','on');
    grid on
    guidata(hObject, handles); 
end



% --- Executes during object creation, after setting all properties.
function amplEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amplEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%NEW PLOTIT Function from Professor
function plotit(handles)
    noisy = handles.x;
    if handles.addRandom
noisy = noisy + handles.noise;
end
    if handles.addInterference
noisy = noisy + handles.interference;
    end
    smoothed = smoothit(noisy,handles.window);
if ~(handles.plotOriginal || handles.plotNoisy ||handles.plotSmoothed)
cla(handles.axes,'reset');
else
if handles.plotOriginal 
plot(handles.axes,handles.t,handles.x,'k'); 
hold(handles.axes,'on');
end
if handles.plotNoisy 
plot(handles.axes,handles.t, noisy,'r'); 
hold(handles.axes,'on');
end
if handles.plotSmoothed 
plot(handles.axes,handles.t,smoothed,'b');
end 
set(handles.axes,'XMinorTick','on'); 
grid on
hold(handles.axes,'off');
end

%smooth-it function

function b = smoothit(a,n) 
% a - input vector
% n - number of samples to average

    k = floor(n/2);
    for ii = 1:length(a)   
        b(ii) = mean(a(max(1,ii-k) :  ...
                       min(length(a),ii+k)));
    end


% --- Executes on button press in originalBox.
function originalBox_Callback(hObject, eventdata, handles)
% hObject    handle to originalBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of originalBox
handles.plotOriginal = get(hObject,'value');
plotit(handles);
guidata(hObject, handles);


% --- Executes on button press in noisyBox.
function noisyBox_Callback(hObject, eventdata, handles)
% hObject    handle to noisyBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of noisyBox


% --- Executes on button press in smoothedBox.
function smoothedBox_Callback(hObject, eventdata, handles)
% hObject    handle to smoothedBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of smoothedBox


% --- Executes on selection change in windowMenu.
function windowMenu_Callback(hObject, eventdata, handles)
% hObject    handle to windowMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns windowMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from windowMenu
sel = get(hObject,'String');
handles.window = str2double(sel{get(hObject, Value')});
plotit(handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function windowMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windowMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%-- controls the button group

function signalControl_SelectionChangeFcn(hObject,eventdata,handles) 
switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    case 'radiobutton1'
        handles.addRandom = false;
        handles.addInterference = false;
    case 'radiobutton2'
        handles.addRandom = true;
        handles.addInterference = false;
    case 'radiobutton3'
        handles.addRandom = false;
        handles.addInterference = true;  
    case 'radiobutton4'
        handles.addRandom = true;
        handles.addInterference = true; 
end
plotit(handles); 
guidata(hObject, handles);
