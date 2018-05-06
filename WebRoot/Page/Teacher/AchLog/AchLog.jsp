<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <title>Achievement Login</title>

    <%--<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">--%>


    <!--<link rel="stylesheet" href="./CSS/Login_alert/2.css" type="text/css">
    <script type="text/javascript" src="./JS/login_alert_1.js"></script>
    <script type="text/javascript" src="./JS/login_alert_2.js"></script>-->
    <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">-->



    <style>
        body#AchLog {
            font-size: 62.5%;
        }
        body#AchLog label, input {
            display:block;
        }
        body#AchLog fieldset#achievement_info {
            padding:0;
            border:0;
            margin-top:25px;
        }

        body#AchLog h1 {
            font-size: 1.2em;
            margin: .6em 0;
        }
        body#AchLog div#users-contain {
            width: 350px;
            margin: 20px 0;
        }
        body#AchLog div#users-contain table {
            margin: 1em 0;
            border-collapse: collapse;
            width: 100%;
        }
        body#AchLog div#users-contain table td, div#users-contain table th {
            border: 2px solid #eee;
            padding: .6em 10px;
            text-align: center;
        }
        body#AchLog .ui-dialog .ui-state-error {
            padding: .3em;
        }
        body#AchLog .validateTips {
            border: 1px solid transparent;
            padding: 0.3em;
        }
    </style>
    <script>
        var i=1;
        var flag1=1;
        function option(i){
            var s;
            if(i==1){
                s="<td style='color:red'>" + "<input type='button' value='修改' onclick='fe(this)'>" + "</td>" + "<td style='color:red'>" + "<input type='button' value='删除' onclick='deleteRow(this)'>" + "</td>";
                return s;
            }
            else if(i==2){
                s="<td colspan='2' style='color:red;text-align:center;'>" + "<input type='button' value='申诉' onclick=''>" + "</td>";
                return s ;
            }
            else {
                s="<td colspan='2' style='color:red'>" + " " + "</td>";
                return s;
            }
        }
        $(function() {
            var name = $( "#name" ),
                situation = $( "#situation" ),
                get = $( "#get" ),
                id = $("#id"),
                date = $("#date"),
                input = $("#input"),
                allFields = $( [] ).add( name ).add( situation ).add( get ).add( id ).add( date ).add( input ),
                tips = $( ".validateTips" );

            function updateTips( t ) {
                tips.text( t ).addClass( "ui-state-highlight" );
                setTimeout(function() {
                    tips.removeClass( "ui-state-highlight", 1500 );
                }, 500 );
            }

            function checkLength( o, n, min, max ) {
                if ( o.val().length > max || o.val().length < min ) {
                    o.addClass( "ui-state-error" );
                    updateTips( "" + n + "的长度必须在 " +
                        min + "到 " + max + "字之间。" );
                    return false;
                } else {
                    return true;
                }
            }

            function checkRegexp( o, regexp, n ) {
                if ( !( regexp.test( o.val() ) ) ) {
                    o.addClass( "ui-state-error" );
                    updateTips( n );
                    return false;
                } else {
                    return true;
                }
            }

            function checkval(o){
                if(o.val()=="ESI") return 5;
                if(o.val()=="ESI1") return 1;
                if(o.val()=="ESI2") return 2;
                if(o.val()=="ESI3") return 3;
                if(o.val()=="ESI4") return 4;
                if(o.val()=="ESI5") return 5;
                if(o.val()=="ESI6") return 6;

            }

            function checkstate(i){
                if(i==1) return "未审核";
                else if(i==2) return "未通过";
                else return "已通过";
            }

            function inputstate(o){
                if(!o.val()) return "未上传";
                else return "已上传";
            }


            function deleteRow(r){
                var b=r.parentNode.parentNode.rowIndex;
                document.getElementById('users').deleteRow(b);
            }



            $( "#dialog-form" ).dialog({
                autoOpen: false,
                height: 300,
                width: 350,
                modal: true,
                buttons: {
                    "确定": function() {
                        //if (flag1==2){deleteRow(this);flag1=1;}
                        var bValid = true;
                        allFields.removeClass( "ui-state-error" );

                        bValid = bValid && checkLength( name, "成果名称", 0, 50 );
                        bValid = bValid && checkLength( situation, "获奖情况", 1, 100 );
                        bValid = bValid && checkLength( id, "收录编号", 1, 100 );


                        //bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "用户名必须由 a-z、0-9、下划线组成，且必须以字母开头。" );
                        // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
                        //bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
                        //bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "密码字段只允许： a-z 0-9" );

                        if ( bValid ) {
                            /* $( "#users tbody" ).append( "<tr>" +
                               "<td>" + name.val() + "</td>" +
                               "<td>" + get.val() + "</td>" +
                               "<td>" + checkval(get) + "</td>" +
                               "<td>" + checkstate(i) + "</td>" +
                               "<td>" + inputstate(input) + "</td>" +
                               option(i) +
                             "</tr>" );*/
                            $("#formget").submit();
                            $( this ).dialog( "close" );

                        }
                    },
                    "取消": function() {
                        $( this ).dialog( "close" );
                    }
                },
                close: function() {
                    allFields.val( "" ).removeClass( "ui-state-error" );
                }
            });

            $( "#create-user" )
                .button()
                .click(function() {
                    $( "#dialog-form" ).dialog( "open" );
                });
        });

        function show(p_name,level,point,material,id){
            $( "#users tbody" ).append( "<tr>" +
                "<td>" + p_name + "</td>" +
                "<td>" + level + "</td>" +
                "<td>" + point + "</td>" +
                "<td>" + " " + "</td>" +
                "<td>" + material + "</td>" +
                option(i) +
                "<td style='display:none;'>"+id+"</td>"+
                "</tr>" );
        }

        <%--$(function showtable(){

            <%
            String s="";
            DB pa3=new DB();
           ResultSet rs1=pa3.pa_select("123@qq.com");
           while(rs1.next()){
           s=s+rs1.getString("p_name")+","+rs1.getString("level")+","+rs1.getString("point")+","+rs1.getString("material")+","+rs1.getString("id")+";";
           }
           %>
            var jas='<%=s%>';
            var arr=jas.split(";");
            for(var jsq=0;jsq<arr.length-1;jsq++){
                var arr1=arr[jsq].split(",");

                show(arr1[0],arr1[1],arr1[2],arr1[3],arr1[4]);
            }
        });--%>




        function me(){
            flag1=2;
            $( "#dialog-form" ).dialog( "open" );
        }
        <%--function deleteRow(r){


            var b=r.parentNode.parentNode.rowIndex;
            var muna=document.getElementById("users").rows[b].cells;
            document.getElementById('users').deleteRow(b);
            var sid=muna[7].innerHTML;
            document.getElementById("delete").value=sid;
            $("#formget2").submit();
            <%
            String delete=request.getParameter("delete");
                if(delete!=null){
                int delete1=Integer.parseInt(delete);
                DB pa4=new DB();
                String as=pa4.pa_delete(delete1);
                }
            %>


        }--%>

        function fe(r){deleteRow(r);me();}
    </script>
</head>
<body id="AchLog">

<div id="dialog-form" title="科研论文">
    <p class="validateTips">所有的表单内容都是必填的。</p>

    <form class="form-inline" action="" method="post" id="formget">
        <fieldset id="achievement_info">
            <label for="name" class="form-label" >成果名称:
                <input type="text" name="name" id="name" class="form-control"></label>
            <label for="situation" class="form-label">获奖情况:
                <input type="text" name="situation" id="situation" value="" class="form-control"></label>
            <label for="get" class="form-label">收录情况:
                <select class="pulldown" name="get" id="get" class="form-control">
                    <option value="ESI">ESI</option>
                    <option value="ESI1">ESI1</option>
                    <option value="ESI2">ESI2</option>
                    <option value="ESI3">ESI3</option>
                    <option value="ESI4">ESI4</option>
                    <option value="ESI5">ESI5</option>
                    <option value="ESI6">ESI6</option>
                </select> </label>
            <!-- <input type="text" name="get" id="get" value="" class="text ui-widget-content ui-corner-all">-->
            <label for="id" class="form-label">收录编号:
                <input type="text" name="id" id="id" value="" class="form-control"></label>
            <label for="date" class="form-label">发表时间:
                <input type="date" name="date" id="date" value="" class="form-control"></label>
            <label for="input" class="form-label">佐证材料:
                <input type="file" name="input" id="input" value="" class="form-control" style="width:205px;"></label>
        </fieldset>
    </form>
</div>

<div><form action="" method="post" id="formget2"><input type="hidden" name="delete" id="delete" value=""></form></div>

<button id="create-user">添加</button>
<div id="users-contain" class="ui-widget">
    <table id="users" class="ui-widget ui-widget-content" style="width:500px">
        <thead>
        <tr class="ui-widget-header ">
            <th style="text-align:center" colspan="7">成果列表</th>
        </tr>
        <tr >
            <th>名称</th>
            <th>类型</th>
            <th>贡献值</th>
            <th>审核状态</th>
            <th>证明材料</th>
            <th colspan="2" >操作</th>
        </tr>
        </thead>
        <tbody>

        </tbody>

    </table>
</div>

<%--<%

    if(request.getParameter("situation")!=null)
    {
        String u_name="123@qq.com";
        String p_name=request.getParameter("name");
        String level=request.getParameter("situation");
        //int level=Integer.parseInt(l);
        String incl=request.getParameter("get");
        String incl_no=request.getParameter("id");
        //int incl_no=Integer.parseInt(i);
        String incl_date=request.getParameter("date");
        //DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        //Date incl_date = dateFormat1.parse(date);
        //String material=request.getParameter("file");
        String material="y";
        DB pa=new DB();
        String a=pa.pa_insert(u_name,p_name,level,incl,incl_no,incl_date,material);
        if(a.equals("1"))System.out.println("ok");
    }
%>--%>

</body>

</html>
