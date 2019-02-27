function varargout = CRC_HAM(varargin)
% CRC_HAM MATLAB code for CRC_HAM.fig
%      CRC_HAM, by itself, creates a new CRC_HAM or raises the existing
%      singleton*.
%
%      H = CRC_HAM returns the handle to a new CRC_HAM or the handle to
%      the existing singleton*.
%
%      CRC_HAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CRC_HAM.M with the given input arguments.
%
%      CRC_HAM('Property','Value',...) creates a new CRC_HAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CRC_HAM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CRC_HAM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CRC_HAM

% Last Modified by GUIDE v2.5 05-May-2018 21:31:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CRC_HAM_OpeningFcn, ...
                   'gui_OutputFcn',  @CRC_HAM_OutputFcn, ...
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


% --- Executes just before CRC_HAM is made visible.
function CRC_HAM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CRC_HAM (see VARARGIN)

% Choose default command line output for CRC_HAM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
initialize_gui(hObject, handles, false);
% UIWAIT makes CRC_HAM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CRC_HAM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function generate_gx_Callback(hObject, eventdata, handles)
% hObject    handle to generate_gx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of generate_gx as text
%        str2double(get(hObject,'String')) returns contents of generate_gx as a double
gx = str2double(get(hObject, 'String'));
if isnan(gx)
    set(hObject, 'String',0);
    errordlg('必须输入数字','Error');%报错只能输入数字
end
if gx <=0
    set(hObject, 'String',0);
    errordlg('输入要为正整数','Error');
end
if rem(gx,1)>0
    set(hObject, 'String',0);
    errordlg('输入要为整数','Error');
end
%gx = str2double(get(hObject, 'String'));%写两遍，保证存进去的是数不是字符串
%handles.metricdata.gx = gx;
handles.metricdata.gx =get(hObject, 'String');
%如果没有进行初始化，则直接点击仿真后handles.metricdata.timein并没有赋值会报错，故可在第二个函数里初始化
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function generate_gx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generate_gx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pre_check_Callback(hObject, eventdata, handles)
% hObject    handle to pre_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pre_check as text
%        str2double(get(hObject,'String')) returns contents of pre_check as a double
pre_check = str2double(get(hObject, 'String'));
if isnan(pre_check)
    set(hObject, 'String',0);
    errordlg('必须输入数字','Error');%报错只能输入数字
end
if pre_check <=0
    set(hObject, 'String',0);
    errordlg('输入要为正整数','Error');
end
if rem(pre_check,1)>0
    set(hObject, 'String',0);
    errordlg('输入要为整数','Error');
end
%pre_check = str2double(get(hObject, 'String'));%写两遍，保证存进去的是数不是字符串
%handles.metricdata.pre_check = pre_check;
handles.metricdata.pre_check =get(hObject, 'String');
%如果没有进行初始化，则直接点击仿真后handles.metricdata.gx并没有赋值会报错，故可在第二个函数里初始化
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function pre_check_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pre_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_result.
function show_result_Callback(hObject, eventdata, handles)
% hObject    handle to show_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.tishi, 'String', '');
gen = str2num(handles.metricdata.gx(:))'; % 校验多项式,字符串转数组“'”很重要
data = str2num(handles.metricdata.pre_check(:))'; % 原始信号 
glen = length(gen); 
while gen(1) == 0 %校验多项式第一项为零时，就从下一项开始
    gen = gen(2:glen);    
    glen = length(gen); 
    set(handles.tishi, 'String', '生成多项式首位为0，已经自动忽略高位0');
end 

for i = 1:1:glen
    if(gen(i) == 0||gen(i) == 1)        
       % a = 0;
    else
        %set(hObject, 'String',0);
        errordlg('数据中出现了非0、1的数值','Error');
%         set(handles.tishi, 'String', '生成多项式有非0、1的数值');
    end        
end

for i = 1:1:length(data)
    if(data(i) == 0||data(i) == 1)        
       % a = 0;
    else
        %set(hObject, 'String',0);
        errordlg('数据中出现了非0、1的数值','Error');
        %set(handles.tishi, 'String', '数据中有非0、1的数值');
    end        
end

data_back = data;
for m = 1:glen-1     
    data = [data 0]; %加上余数位零的情况，加上0的数量是生成多项式的长度减一
end


%data

dlen = length(data);  
cr = data(1:glen-1); 


%cr

for p = glen:dlen 
    cr(glen) = data(p);  
    if cr(1) 
        cr = xor(cr(2:glen), gen(2:glen));   %异或运算，相当于除法     
    else 
        cr = cr(2:glen);    
    end
end
cr = [data_back cr];%余数与带测数
aft_check=num2str(cr); %数组转字符串
%cr=strcat(data_back,cr);%字符串拼接函数
set(handles.show,'String',aft_check);

% --- Executes on button press in show_process.
function show_process_Callback(hObject, eventdata, handles)
% hObject    handle to show_process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gen = str2num(handles.metricdata.gx(:))'; % 校验多项式,字符串转数组“'”很重要
data = str2num(handles.metricdata.pre_check(:))'; % 原始信号 
glen = length(gen); 
while gen(1) == 0 %校验多项式第一项为零时，就从下一项开始
    gen = gen(2:glen);    
    glen = length(gen); 
end 

for i = 1:1:length(data)
    if(data(i) == 0||data(i) == 1)        
       % a = 0;
    else
        %set(hObject, 'String',0);
        errordlg('数据中出现了非0、1的数值','Error');
        %set(handles.tishi, 'String', '数据中有非0、1的数值');
    end        
end

data_back = data; 
for m = 1:glen-1     
    data = [data 0]; %加上余数位零的情况
end 
dlen = length(data);  
cr = data(1:glen-1); 
for p = glen:dlen 
    cr(glen) = data(p);  
    if cr(1) 
        cr = xor(cr(2:glen), gen(2:glen));   %异或运算，相当于除法     
    else 
        cr = cr(2:glen);    
    end
end

lencr=length(cr);
sum=0;
for m=1:lencr
    sum=sum+cr(m);
end
if sum==0
    set(handles.show2,'String','编码正确');    
else
    set(handles.show2,'String','编码错误');
end
    

function initialize_gui(fig_handle, handles, isreset)%初始化
if isfield(handles, 'metricdata') && ~isreset
    return;
end
handles.metricdata.gx='1011';
%handles.metricdata.generate_gxx='101';
handles.metricdata.pre_check= '1101011';
%handles.metricdata.gx=num2str(handles.metricdata.gx);%将数字转化为字符串
%handles.metricdata.pre_check=num2str(handles.metricdata.pre_check);

%显示的初始化
set(handles.generate_gx, 'String', handles.metricdata.gx);
set(handles.pre_check,  'String', handles.metricdata.pre_check);
set(handles.show, 'String', '暂无编码');
set(handles.show2, 'String', '暂无校验');
%set(handles.show,  'String', handles.metricdata.pre_check);
guidata(handles.figure1, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
global num;
global haiming_code;
global hai;
%data=str2num(handles.metricdata.generate_gxx(:))';
data= num2str(get( handles.generate_gxx, 'String')) - '0';
%data = str2num( get( handles.generate_gxx, 'String')); 
%data = str2num(handles.metricdata.generate_gxx(:))'; 
num = length(data)+1;  %记得加一，血的教训


for i = 1:1:num-1
    if(data(i) == 0||data(i) == 1)        
       % a = 0;
    else
        %set(hObject, 'String',0);
        errordlg('数据中出现了非0、1的数值','Error');
        %set(handles.tishi, 'String', '数据中有非0、1的数值');
    end        
end

haiming_code=0;
hai=0;
calcu_num=0;

for i=1:1:50
    if((2^i-i)>=num)
        r=i;
        break;
    end
end
   %r为要校验的校验数字的数量
data(2^r-r)=0;
offset = 2^r - r - num;

num=1;
for i =0:1:(r-1)
    haiming_code(2^i)=1;  %待生成的校验码都设置为1
end


haiming_code((2^r)-1)=0;
%此时的haiming码已经完整了，接下来需要往里面加入具体数值
for i =1:1:((2^r)-1)
       if(haiming_code(i)~=1)
           haiming_code(i)=data(num);
           num=num+1;
       end
end
%此时的haiming码已经完整了，数值部分已经填入，校验码还都为1

%%%%%%%%%%%%%%%%%%%%%%%%
%对于非最低位的haiming码进行校验
for j=1:1:r-1 
    flag_0=0;
    flag_num=1;
    calcu_num=0;
    for i=1:1:((2^r)-1)
        if(flag_num<2^(r-j))
            flag_num=flag_num+1;
        else
            flag_num=1; 
            flag_0=~flag_0;
        end  
        if(flag_0==1)
            calcu_num=calcu_num+haiming_code(i);
            if(calcu_num==2)
                calcu_num=0;
            end
        end
    end
    hai(r-j+1)=~calcu_num; %hai为校验位
end
%%%%%%%%%%%%%%%%%%%%%%%%
%接下来的for循环只对于haiming校验码的第一位进行判断
flag_0=1;
calcu_num=0;
for i=1:1:((2^r)-1)
    if(flag_0==1)
        calcu_num=calcu_num+haiming_code(i);
        if(calcu_num==2)
            calcu_num=0;
        end
    end
    flag_0=~flag_0;
end
hai(1)=~calcu_num;

for i =0:1:(r-1)
    haiming_code(2^i)= hai(i+1);
end

for i =1:1:(2^r-offset-1)
    data_out(i)=haiming_code(i);
end

data=0;
num=1;
dis_data=num2str(data_out);
set(handles.HM,'String',dis_data);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global data;
global num;
global haiming_code;
global hai;

data= num2str(get( handles.generate_gxx, 'String')) - '0';
%data = str2num( get( handles.generate_gxx, 'String')); 
%data = str2num(handles.metricdata.generate_gxx(:))'; 
num = length(data)+1;


for i = 1:1:num-1
    if(data(i) == 0||data(i) == 1)        
       % a = 0;
    else
        %set(hObject, 'String',0);
        errordlg('数据中出现了非0、1的数值','Error');
        %set(handles.tishi, 'String', '数据中有非0、1的数值');
    end        
end
haiming_code=0;
calcu_num=0;

for i=1:1:50   
    if((2^i)>=num)
        r=i;
        break;
    end
end
data(2^r)=0;
offset = 2^r - num;

for j=1:1:r-1
    flag_0=0;
    flag_num=1;
    calcu_num=0;
    for i=1:1:((2^r)-1)
        if(flag_num<2^(r-j))
            flag_num=flag_num+1;
        else
            flag_num=1; 
            flag_0=~flag_0;
        end  
        if(flag_0==1)
            calcu_num=calcu_num+data(i);
            if(calcu_num==2)
                calcu_num=0;
            end
        end
    end
    p_hai_(r-j+1)=calcu_num;
end

flag_0=1;
calcu_num=0;
for i=1:1:((2^r)-1)
    if(flag_0==1)
        calcu_num=calcu_num+data(i);
        if(calcu_num==2)
            calcu_num=0;
        end
    end
        flag_0=~flag_0;
end
p_hai_(1)=calcu_num;

for i=1:1:r
    calcu_num=calcu_num+p_hai_(i)*2^(r-i);
end
if(calcu_num~=0)
    msgbox('接收的码字有错','警告','modal');
    data(calcu_num-1)=~data(calcu_num-1);
end

%提取出p
for i =0:1:(r-1)
    data(2^i)=3;
end
num=1;
for i =1:1:((2^r)-1-offset)
       if(data(i)~=3)
           haiming_code(num)=data(i);
           num=num+1;
       end
end

%data=0;%清零与显示
%num=1;
dis_data=num2str(haiming_code);
set(handles.HM,'String',dis_data);
set(handles.text26,'String','校验正确！');

% --- Executes during object creation, after setting all properties.
function generate_gxx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generate_gxx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function generate_gxx_Callback(hObject, eventdata, handles)
% hObject    handle to generate_gxx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of generate_gxx as text
%        str2double(get(hObject,'String')) returns contents of generate_gxx as a double
gxt = str2double(get(hObject, 'String'));
if isnan(gxt)
    set(hObject, 'String',0);
    errordlg('必须输入数字','Error');%报错只能输入数字
    set(handles.HM,'String','');
end
if gxt <=0
    set(hObject, 'String',0);
    errordlg('输入要为正整数','Error');
    set(handles.HM,'String','');
end
if rem(gxt,1)>0
    set(hObject, 'String',0);
    errordlg('输入要为整数','Error');
    set(handles.HM,'String','');
end


function generate_g_Callback(hObject, eventdata, handles)
% hObject    handle to generate_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of generate_g as text
%        str2double(get(hObject,'String')) returns contents of generate_g as a double


% --- Executes during object creation, after setting all properties.
function generate_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to generate_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
