function varargout = email(varargin)
% EMAIL MATLAB code for email.fig
%      EMAIL, by itself, creates a new EMAIL or raises the existing
%      singleton*.
%
%      H = EMAIL returns the handle to a new EMAIL or the handle to
%      the existing singleton*.
%
%      EMAIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMAIL.M with the given input arguments.
%
%      EMAIL('Property','Value',...) creates a new EMAIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before email_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to email_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help email

% Last Modified by GUIDE v2.5 21-Jan-2019 19:31:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @email_OpeningFcn, ...
                   'gui_OutputFcn',  @email_OutputFcn, ...
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


% --- Executes just before email is made visible.
function email_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to email (see VARARGIN)

% Choose default command line output for email
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes email wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = email_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

%my_default_email_address = 'ratneshjain29y@gmail.com';
my_default_email_address = 'somendas912@gmail.com';
%my_username = 'ratneshjain29y@gmail.com';
my_username = 'somendas912@gmail.com';
%my_password = '9301404959';
my_password = 'ramu das';

setpref('Internet', 'E_mail',my_default_email_address);
setpref('Internet', 'SMTP_Server','smtp.gmail.com'); 
setpref ('Internet', 'SMTP_Username',my_username); 
setpref('Internet', 'SMTP_Password', my_password);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth', 'true'); 
props.setProperty('mail.smtp.starttls.enable','true');
props.setProperty('mail.smtp.socketFactory.class','javax.net.ssl.SSLSocketFactory'); 
props.setProperty('mail.smtp.socketFactory.port','465');
global email1
global subject1
global message1 attach1
sendmail(email1,subject1,message1,attach1);
%sendmail({'eknowledgec@gmail.com','somendas912@gmail.com'}, 'This is a subject', ['Vivek k liye Line1' 10 'Line2 I am a message from MATLAB']);
%sendmail('rohitchouhankgn11@gmail.com', 'This is a subject', ['I am a message from MATLAB' 10 'rohit kirti ka lala pyaar mey' 10 'Ebiz me aapka sasuraal hai' 10 'another msg']);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
global email1 
email1 = get(hObject,'String');
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
global subject1
subject1 =get(hObject,'string');
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



function edit4_Callback(hObject, eventdata, handles)
global message1
message1 =get(hObject,'String');

% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
global attach1
attach1 = get(hObject,'String');
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
