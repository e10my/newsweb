<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- InstanceBegin template="/Template/template.dwt" codeOutsideHTMLIsLocked="false" -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>����ѧԺ����ͳս��</title>
<style type="text/css">
* { margin:0; padding:0; }
body { background:#FFF; color:#333; font:12px/1.6em Helvetica, Arial, sans-serif; }
h1, h2, h3, h4, h5, h6 { font-size:1em; }
a { color:#0287CA; text-decoration:none; }
a:hover { text-decoration:underline; }
ul, li { list-style:none; }
fieldset, img { border:none; }
legend { display:none; }
em, strong, cite, th { font-style:normal; font-weight:normal; }
input, textarea, select, button { font:12px Helvetica, Arial, sans-serif; }
table { border-collapse:collapse; }
html { overflow:-moz-scrollbars-vertical; } 
#ibanner { position:relative; width:700px; height:205px; overflow:hidden; margin:0  }
#ibanner_pic {}
#ibanner_pic a { position:absolute; top:0; display:block; width:700px; height:205px; overflow:hidden; }
#ibanner_btn { position:absolute; z-index:9999; right:5px; bottom:5px; font-weight:700; font-family:Arial; }
#ibanner_btn span { display:block; float:left; margin-left:4px; padding:0 5px; background:#000; cursor:pointer; }
#ibanner_btn .normal { height:20px; margin-top:8px; border:1px solid #999; color:#999; font-size:16px; line-height:20px; }
#ibanner_btn .current { height:28px; border:1px solid #FF5300; color:#FF5300; font-size:28px; line-height:28px; }
</style>


<script type="text/javascript">
function $(id) { return document.getElementById(id); }
function addLoadEvent(func){
var oldonload = window.onload;
if (typeof window.onload != 'function') {
window.onload = func;
} else {
window.onload = function(){
oldonload();
func();
}
}
}
function addBtn() {
if(!$('ibanner')||!$('ibanner_pic')) return;
var picList = $('ibanner_pic').getElementsByTagName('a');
if(picList.length==0) return;
var btnBox = document.createElement('div');
btnBox.setAttribute('id','ibanner_btn');
var SpanBox ='';
for(var i=1; i<=picList.length; i++ ) {
var spanList = '<span class="normal">'+i+'</span>';
SpanBox += spanList;
}
btnBox.innerHTML = SpanBox;
$('ibanner').appendChild(btnBox);
$('ibanner_btn').getElementsByTagName('span')[0].className = 'current';
for (var m=0; m<picList.length; m++){
var attributeValue = 'picLi_'+m
picList[m].setAttribute('id',attributeValue);
}
}
function moveElement(elementID,final_x,final_y,interval) {
if (!document.getElementById) return false;
if (!document.getElementById(elementID)) return false;
var elem = document.getElementById(elementID);
if (elem.movement) {
clearTimeout(elem.movement);
}
if (!elem.style.left) {
elem.style.left = "0px";
}
if (!elem.style.top) {
elem.style.top = "0px";
}
var xpos = parseInt(elem.style.left);
var ypos = parseInt(elem.style.top);
if (xpos == final_x && ypos == final_y) {
moveing = false;
return true;
}
if (xpos < final_x) {
var dist = Math.ceil((final_x - xpos)/10);
xpos = xpos + dist;
}
if (xpos > final_x) {
var dist = Math.ceil((xpos - final_x)/10);
xpos = xpos - dist;
}
if (ypos < final_y) {
var dist = Math.ceil((final_y - ypos)/10);
ypos = ypos + dist;
}
if (ypos > final_y) {
var dist = Math.ceil((ypos - final_y)/10);
ypos = ypos - dist;
}
elem.style.left = xpos + "px";
elem.style.top = ypos + "px";
var repeat = "moveElement('"+elementID+"',"+final_x+","+final_y+","+interval+")";
elem.movement = setTimeout(repeat,interval);
}
function classNormal() {
var btnList = $('ibanner_btn').getElementsByTagName('span');
for (var i=0; i<btnList.length; i++){
btnList[i].className='normal';
}
}
function picZ() {
var picList = $('ibanner_pic').getElementsByTagName('a');
for (var i=0; i<picList.length; i++){
picList[i].style.zIndex='1';
}
}
var autoKey = false;
function iBanner() {
if(!$('ibanner')||!$('ibanner_pic')||!$('ibanner_btn')) return;
$('ibanner').onmouseover = function(){autoKey = true};
$('ibanner').onmouseout = function(){autoKey = false};

var btnList = $('ibanner_btn').getElementsByTagName('span');
var picList = $('ibanner_pic').getElementsByTagName('a');
if (picList.length==1) return;
picList[0].style.zIndex='2';
for (var m=0; m<btnList.length; m++){
btnList[m].onmouseover = function() {
for(var n=0; n<btnList.length; n++) {
if (btnList[n].className == 'current') {
var currentNum = n;
}
}
classNormal();
picZ();
this.className='current';
picList[currentNum].style.zIndex='2';
var z = this.childNodes[0].nodeValue-1;
picList[z].style.zIndex='3';
if (currentNum!=z){
picList[z].style.left='650px';
moveElement('picLi_'+z,0,0,10);
}
}
}
}
setInterval('autoBanner()', 5000);
function autoBanner() {
if(!$('ibanner')||!$('ibanner_pic')||!$('ibanner_btn')||autoKey) return;
var btnList = $('ibanner_btn').getElementsByTagName('span');
var picList = $('ibanner_pic').getElementsByTagName('a');
if (picList.length==1) return;
for(var i=0; i<btnList.length; i++) {
if (btnList[i].className == 'current') {
var currentNum = i;
}
}
if (currentNum==(picList.length-1) ){
classNormal();
picZ();
btnList[0].className='current';
picList[currentNum].style.zIndex='2';
picList[0].style.zIndex='3';
picList[0].style.left='650px';
moveElement('picLi_0',0,0,10);
} else {
classNormal();
picZ();
var nextNum = currentNum+1;
btnList[nextNum].className='current';
picList[currentNum].style.zIndex='2';
picList[nextNum].style.zIndex='3';
picList[nextNum].style.left='650px';
moveElement('picLi_'+nextNum,0,0,10);
}
}
addLoadEvent(addBtn);
addLoadEvent(iBanner);
</script>
<!-- InstanceEndEditable -->
<style type="text/css">
<!--
body {margin-left: 0px;margin-top: 0px; margin-right:0px; margin-bottom:0px;background-repeat:repeat-x;}
.list{ margin-top:0px; margin-bottom:5px; margin-left:8px; padding-left:0px; list-style-type:none; width:305px; display:block; text-align:left;}
.list_li{margin:0px; padding:0px; padding-left:0px; text-align:left;}
.text_list{ font-family:"����"; font-size:13px; color:#333; line-height:22px;}
.text_list a{ font-family:"����"; font-size:13px; color:#333; line-height:22px; text-decoration:none;}
.text_list a:hover{background:  #F7F7F7; color:#00F;}
.tzgg_text {font-family:"����"; font-size:13px; color:#666; line-height:15px;text-decoration:none;}
.tzgg_text a{font-family:"����"; font-size:13px; color:#666; line-height:15px;text-decoration:none;}
.tzgg_text a:hover{font-family:"����"; font-size:13px; color:#666; line-height:15px;text-decoration:none;}
.date{ font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#999; float:right; clear:both; text-align:right;}
.date2{ font-family:Verdana, Geneva, sans-serif; font-size:12px; color:#C00;}
.ylMarquee{height:155px; width:300px; clear:both; overflow:hidden; border:3px;}
.ylMarquee li{ float:left; padding:0px; margin:0px;};
.note{ font-family:"����"; font-size:13px; color:#039; line-height:22px;}
#content{
	height:750px;
	width:960px;
	margin:auto;
	background-color:#F1F1F1;
}
-->
</style>
<link href="css/index.css"  rel="stylesheet" type="text/css" />
<link href="css/nav.css"  rel="stylesheet" type="text/css" />
<link href="css/scroll_pic.css"  rel="stylesheet" type="text/css" />
<script src="js/sohuflash_1.js" type="text/javascript"></script>
<script src="js/scroll_pic.js" type="text/javascript"></script>

<style type="text/css">
<!--
.STYLE1 {color: #3300FF}
-->
</style>

</head>
<body>


    <form id="form1" runat="server">


<!-- Copyright ?2005. Spidersoft Ltd -->
<style>
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>
<!-- /Copyright ?2005. Spidersoft Ltd -->

<div id="banner"></div>
<!--�������ֿ�ʼ-->
<div id="nav">
<div id="menu">
  <ul>
    <li class="m_line"><img src="images/line1.gif" /></li>
    <li id="m_2" class='m_li' ><a href="Default.aspx" target="_blank">��վ��ҳ</a></li>
      <li class="m_line"><img src="images/line1.gif" /></li>
    <li id="m_2" class='m_li' ><a href="xcb_bmjs.html" target="_blank">���Ž���</a></li>
    <li class="m_line"><img src="images/line1.gif" /></li>
    <li id="m_3" class='m_li' ><a href="http://xbzd.bdu.edu.cn/catv/index.htm" target="_blank">ý������</a></li>
    <li class="m_line"><img src="images/line1.gif" /></li>
    <li id="m_4" class='m_li' ><a href="http://bdszb.cuepa.cn/" target="_blank">У������</a></li>
    <li class="m_line"><img src="images/line1.gif" /></li>
    <li id="m_5" class='m_li' ><a href="xcb_llyd.html">����԰��</a></li>
    <li class="m_line"><img src="images/line1.gif" /></li>
    <li id="m_6" class='m_li' ><a href="xcb_tzgz.html" target="_blank">ͳս����</a></li>
    </ul>
</div>
</div>
<!-- InstanceBeginEditable name="head" -->



<div style="height:22px; background-color:#FFFFFF;">
   <ul class="smenu">
     <li style="padding-left:29px;" id="s_1" class='s_li_a'><marquee><a style="font-size:18px; font-style:inherit ">��ӭ��������ѧԺ��������ҳ�� ��ǰ����:</a><font color="#CC0000" ;>
        <script language="JavaScript" type="text/javascript">var isnDay = new
Array("������","����һ","���ڶ�","������","������","������","������","������");
var today=new Date();
var month=today.getMonth()+1;
document.write(" "+today.getYear()+"��"+month+"��"+today.getDate()+"��"+"   "+isnDay
[today.getDay()]) 
</script></font></marquee>
</li>
   
     
    
   </ul>
</div>
</div>
<!--�������ֽ���-->
<div id="content">
	<div id="left">
    <div id="left1"><div id="title">&nbsp;ѧԺ����</div>
             <div id="title1"><a href="http://www.bdu.edu.cn/new/list.asp?id=84" style="color:#F1F1F1;">����>></a></div>
    
    <div id="flashcontent01" style=" margin-left:0px;"></div>
		<div class="portlet_content">
		<div id="left11"><table width="98%" height="23" border="0" cellpadding="0" cellspacing="0">
<!-- ���ʱ������ -->

<!--һ��ѧԺ����begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.bdu.edu.cn/new/show.asp?id=691' class="text"  target="_blank" title="�ӱ�ʡ������������־Ը�߽�У԰����������Ժ����"><font class="text"> �ӱ�ʡ������������־Ը�߽�У԰����������Ժ���� </font></a><font class="text-time" color="#999999">2013-10-22</font></td>
</tr>
<!--һ��ѧԺ����end-->

<!--һ��ѧԺ����begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.bdu.edu.cn/new/show.asp?id=692' class="text"  target="_blank" title="��Ժ����������Ϊ2012���ѧУ��ȫ�����Ƚ�����"><font class="text"> ��Ժ����������Ϊ2012���ѧУ��ȫ�����Ƚ����� </font></a><font class="text-time" color="#999999">2013-10-24</font></td>
</tr>
<!--һ��ѧԺ����end-->

<!--һ��ѧԺ����begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.bdu.edu.cn/new/show.asp?id=693' class="text"  target="_blank" title="���������߽�У԰ ���Ҿ���Ժ����Ժ�����ݳ�"><font class="text"> ���������߽�У԰ ���Ҿ���Ժ����Ժ�����ݳ� </font></a><font class="text-time" color="#999999">2013-10-24</font></td>
</tr>
<!--һ��ѧԺ����end-->

<!--һ��ѧԺ����begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.bdu.edu.cn/new/show.asp?id=689' class="text"  target="_blank" title="��Ժ��ί��촦����Ϊ�����мͼ���ϵͳʵ��ͻ����λ"><font class="text"> ��Ժ��ί��촦����Ϊ�����мͼ���ϵͳʵ��ͻ����λ </font></a><font class="text-time" color="#999999">2013-10-18</font></td>
</tr>
<!--һ��ѧԺ����end-->

<!--һ��ѧԺ����begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.bdu.edu.cn/new/show.asp?id=688' class="text"  target="_blank" title="��Ժ�����Ͻ���������Э������ߵ�һ���Ա������"><font class="text"> ��Ժ�����Ͻ���������Э������ߵ�һ���Ա������ </font></a><font class="text-time" color="#999999">2013-10-14</font></td>
</tr>
<!--һ��ѧԺ����end-->





</table>
			</div>      </div>
    </div>
    <div id="left1"><div id="title">&nbsp;ʱ��Ҫ��</div>
             <div id="title1"><a href="xcb_more.html" style="color:#F1F1F1;">����>></a></div>
      <div id="left11"><table width="98%" height="23" border="0" cellpadding="0" cellspacing="0">
      
      
      
      
<!-- ���ʱ������ -->
<!--ʱ������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
        Visible="False"></asp:LinkButton>
    <font class="text-time" color="#999999">
        <asp:Label ID="Label1" runat="server"></asp:Label></font></td>
</tr>
<!--ʱ������end-->
<!--ʱ������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" 
        Visible="False">LinkButton</asp:LinkButton>
    <font class="text-time" color="#999999">
        <asp:Label ID="Label2" runat="server"></asp:Label></font></td>
</tr>
<!--ʱ������end-->

<!--ʱ������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

    <font class="text-time" color="#999999">
        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" 
        Visible="False">LinkButton</asp:LinkButton>
        <asp:Label ID="Label3" runat="server"></asp:Label></font></td>
</tr>
<!--ʱ������end-->



<!--ʱ������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

    <font class="text-time" color="#999999">
        <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click" 
        Visible="False">LinkButton</asp:LinkButton>
        <asp:Label ID="Label4" runat="server"></asp:Label></font></td>
</tr>
<!--ʱ������end-->
<!--ʱ������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

    <font class="text-time" color="#999999">

    <asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click" 
        Visible="False">LinkButton</asp:LinkButton>
        <asp:Label ID="Label5" runat="server"></asp:Label></font></td>
</tr>
<!--ʱ������end-->


</table>
			</div>
	  </div>
    <div id="picbox"><div id="title">&nbsp;����԰��</div>
            <div id="title1"><a href="xcb_llyd.html" style="color:#F1F1F1;">����>></a></div>
  <div id="left11">
            <table width="98%" height="23" border="0" cellpadding="0" cellspacing="0">
<!-- ���ʱ������ -->



<!--����԰��һ��begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='news_ll_1.html' class="text"  target="_blank" title="���±��⣺�й���ɫ��Բ��֮·"><font class="text">�й���ɫ��Բ��֮· </font></a><font class="text-time" color="#999999">2013-10-24</font></td>
</tr>
<!--����԰��һ��end-->


<!--����԰��һ��begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='news_ll_2.html' class="text"  target="_blank" title="��ǿ���������ļ�ֵ��ϵ����ı�־������"><font class="text">��ǿ���������ļ�ֵ��ϵ����ı�־������ </font></a><font class="text-time" color="#999999">2013-10-24</font></td>
</tr>
<!--����԰��һ��end-->

<!--����԰��һ��begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='news_ll_3.html' class="text"  target="_blank" title="�������������Ұ����г�����ҥ��Ϊ�������޴�"><font class="text">�������������Ұ����г�����ҥ��Ϊ�������޴� </font></a><font class="text-time" color="#999999">2013-10-24</font></td>
</tr>
<!--����԰��һ��end-->

<!--����԰��һ��begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='news_ll_4.html' class="text"  target="_blank" title="˼���ݺ᣺��ͨ���쵼�ߵı��޿�"><font class="text">˼���ݺ᣺��ͨ���쵼�ߵı��޿� </font></a><font class="text-time" color="#999999">2013-10-24</font></td>
</tr>
<!--����԰��һ��end-->

<!--����԰��һ��begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='news_ll_5.html' class="text"  target="_blank" title="ѧϰʱ�����й���һ�ָĸ��Ļ�Ѿ�����"><font class="text">ѧϰʱ�����й���һ�ָĸ��Ļ�Ѿ�����</font></a><font class="text-time" color="#999999">2013-10-24</font></td>
</tr>
<!--����԰��һ��end-->
</table>
            </div>
      </div>
    <div id="left1">
    <div id="title">&nbsp;��������</div>
             <div id="title1"><a href="xcb_more.html" style="color:#999;"></a></div>
 <div id="left11">
             <table width="98%" height="23" border="0" cellpadding="0" cellspacing="0">
<!-- ���ʱ������ -->
<!--һ����������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://cpc.people.com.cn/GB/69112/70190/70197/70350/index.html' class="text"  target="_blank" title="ë����ѡ"><font class="text">ë����ѡ </font></a><font class="text-time" color="#999999">2013-10-22</font></td>
</tr>
<!--һ����������end-->

<!--һ����������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://cpc.people.com.cn/GB/69112/69113/index.html' class="text"  target="_blank" title="��Сƽ��ѡ"><font class="text">��Сƽ��ѡ </font></a><font class="text-time" color="#999999">2013-10-22</font></td>
</tr>
<!--һ����������end-->
<!--һ����������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.chinaspirit.net.cn/zel//zzxz/zzxz.htm' class="text"  target="_blank" title="�ܶ���ѡ��"><font class="text">�ܶ���ѡ�� </font></a><font class="text-time" color="#999999">2013-10-22</font></td></tr>
<!--һ����������end-->
<!--һ����������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.chinaspirit.net.cn/lsq//zzxz.htm' class="text"  target="_blank" title="������ѡ��"><font class="text">������ѡ�� </font></a><font class="text-time" color="#999999">2013-10-22</font></td>
</tr>
<!--һ����������end-->
<!--һ����������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://www.people.com.cn/GB/shizheng/252/2072/8050/index.html' class="text"  target="_blank" title="ѧϰ�᳹������������Ҫ˼��ר��"><font class="text">ѧϰ�᳹������������Ҫ˼��ר�� </font></a><font class="text-time" color="#999999">2013-10-22</font></td>
</tr>
<!--һ����������end-->
<!--һ����������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://cxzy.people.com.cn/GB/index.html' class="text"  target="_blank" title="���뿪չ�������Żר��"><font class="text">���뿪չ�������Żר�� </font></a><font class="text-time" color="#999999">2013-10-22</font></td>
</tr>
<!--һ����������end-->
<!--һ����������begin-->
<tr >
<td width="16" align="center" valign="middle" class="text">&middot;</td>
<td  height="23" align="left" valign="middle">

<a href='http://kxfz.people.com.cn/GB/135000/index.html' class="text"  target="_blank" title="ѧϰʵ����ѧ��չ��ר��"><font class="text">ѧϰʵ����ѧ��չ��ר�� </font></a><font class="text-time" color="#999999">2013-10-22</font></td>
</tr>
<!--һ����������end-->
</table>
             </div>
      </div>
   	 	
        <div id="gundong">
       
        
        <div id="ibanner">
<div id="ibanner_pic">
<a href="">  <img src="images/a1.jpg" />   </a>
<a href=""> <img src="images/a2.jpg" />    </a>
<a href="">  <img src="images/a3.jpg" />   </a>
<a href=""> <img src="images/a4.jpg" />    </a></div>
</div><!--ibanner end-->
        </div>
	</div>
    <div id="right">
    <div id="tzgg"><div id="tzgg_title">֪ͨ����</div><div id="right11">	
    <!--һ��֪ͨ����begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='http://www.bdu.edu.cn/new/show.asp?id=690'  target="_blank" title="����ѧԺУѵУ�裨���ʣ���������">����ѧԺУѵУ�裨���ʣ���������</a></span><span class="date2">2013-11-22</span></div>
	    <!--һ��֪ͨ����end-->
            <!--һ��֪ͨ����begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='http://www.bdu.edu.cn/new/show.asp?id=663'  target="_blank" title="����ѧԺ2013���걨��������רҵ��ʾ">����ѧԺ2013���걨��������רҵ��ʾ</a></span><span class="date2">2013-11-22</span></div>
	    <!--һ��֪ͨ����end-->
            <!--һ��֪ͨ����begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='http://www.bdu.edu.cn/new/show.asp?id=662'  target="_blank" title="���ڵ�ʮ����ӱ�ʡ���������˽�����ѡ������֪ͨ">���ڵ�ʮ����ӱ�ʡ���������˽�����ѡ������֪ͨ</a></span><span class="date2">2013-11-22</span></div>
	    <!--һ��֪ͨ����end-->
            <!--һ��֪ͨ����begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='http://www.bdu.edu.cn/new/show.asp?id=660'  target="_blank" title="�����������ۺ����ʴ���á��������Ļ��������֪ͨ">�����������ۺ����ʴ���á��������Ļ��������֪ͨ</a></span><span class="date2">2013-11-22</span></div>
	    <!--һ��֪ͨ����end-->

   </div></div>
    <div id="yqlj"><div id="tzgg_title">��������</div><div id="right11">	
    <!--��������begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='newsxp/data/123.doc'  target="_blank" title="">ѧԺ�ĵ�[1]�ļ�����</a></span><span class="date2">2013-10-24</span></div>
	    <!--��������begin-->
    <!--��������begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='newsxp/data/123.doc'  target="_blank" title="">ѧԺ�ĵ�[2]�ļ�����</a></span><span class="date2">2013-10-24</span></div>
	    <!--��������begin-->

    <!--��������begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='newsxp/data/123.doc'  target="_blank" title="">ѧԺ�ĵ�[3]�ļ�����</a></span><span class="date2">2013-10-24</span></div>
	    <!--��������begin-->

    <!--��������begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='newsxp/data/123.doc'  target="_blank" title="">ѧԺ�ĵ�[4]�ļ�����</a></span><span class="date2">2013-10-24</span></div>
	    <!--��������begin-->

    <!--��������begin-->
<div style="width:210px; border-bottom:1px #666 dashed; margin:auto;"><span class="note"><a href='newsxp/data/123.doc'  target="_blank" title="">ѧԺ�ĵ�[5]�ļ�����</a></span><span class="date2">2013-10-24</span></div>
	    <!--��������begin-->

            
   </div></div>
    <div id="right1"><div id="tzgg_title">��������</div><div><a href="http://xbzd.bdu.edu.cn/xwpg/index.asp" target="_blank"><img src="images/pgzt.gif" alt="����" height="67" width="245" border="0"/></a></div>
    <div><a href="http://www.chinaedunet.com/" target="_blank"><img src="images/zgjyw.jpg" alt="����" height="67" width="245" border="0"/></a></div>
    <div><a href="http://www.cyol.net/" target="_blank"><img src="images/zqzx.jpg" alt="����" height="58" width="245" border="0"/></a></div>
  </div>
    <div></div>
  </div>
    </div>
    
</div>
<!-- InstanceEndEditable -->


</body>
<div id="feet"><span style="font-family:'����'; font-size:12px;text-align:center; line-height:15px;"><br />
  ��ַ���ӱ�ʡ��������һ��·3027��   �ʱࣺ071000   E_mail:71east@sina.com.cn<br />
2013? CopyRight ��Ȩ���� ����ѧԺ��������<a href="Admin/login.aspx">��̨��½</a></span></div>
<!-- InstanceEnd -->
    </form>
</html>