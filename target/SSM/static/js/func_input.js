/**
 * Created by 17922 on 2017/3/25.
 */

/*
 * input参数收集
 * 传递的参数为time，state
 */
function GetRequest() {

    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
        }
    }
    return theRequest;
}


var Request = new Object();
Request = GetRequest();
var time, state, hour;


time = Request["time"];

state = Request["state"];

hour = "上午";

switch (state) {
    case "1":
        hour = "上午";
        break;
    case "2":
        hour = "下午";
        break;
    case "3":
        hour = "晚上";
        break;
    default:
        alert('非法的访问请求');
        location = '/index';
}

function formatDate(now) {
    var year = now.getYear() + 1900;
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var week = now.getDay();
    switch (week) {
        case 1:
            week = "一";
            break;
        case 2:
            week = "二";
            break;
        case 3:
            week = "三";
            break;
        case 4:
            week = "四";
            break;
        case 5:
            week = "五";
            break;
        case 6:
            week = "六";
            break;
        case 7:
        case 0:
            week = "日";
            break;
    }
    return year + "年" + month + "月" + date + "日，星期" + week;
}

document.getElementsByClassName("mt-panel-header-text")[0].innerHTML = "当前选择的时间为：" + formatDate(new Date(time * 1000)) + " " + hour;

/*
    判断是否输入正确信息
 */
function getinfo() {

    var name = $(".mt-form-body>.mt:nth-child(1)>div+div>input").val();
    var tel = $(".mt-form-body>.mt:nth-child(2)>div+div>input").val();
    var email = $(".mt-form-body>.mt:nth-child(3)>div+div>input").val();
    var sponsor = $(".mt-form-body>.mt:nth-child(4)>div+div>input").val();
    var theme = $(".mt-form-body>.mt:nth-child(5)>div+div>input").val();
    var content = $(".mt-form-body>.mt:nth-child(6)>div+div>textarea").val();
    if (name == "" || tel == "" || email == "" || sponsor == "" || theme == "" || content == "") {
        alert("请填写完整信息帮助您核实");
    }
    else if (!(/^1[1|3|4|5|7|8][0-9]\d{4,8}$/.test(tel))) {
        alert("不是完整的11位手机号或者正确的手机号前七位");
        $(".mt-form-body>.mt:nth-child(2)>div+div>input").focus();
        return false;
    }
    else if (!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(email))) {
        alert("请输入正确的邮箱");
        $(".mt-form-body>.mt:nth-child(3)>div+div>input").focus();
        return false;
    }
    else {
        var now = new Date();
        now.setHours(0);
        now.setMinutes(0);
        now.setSeconds(0);
        var begin = Date.parse(now) / 1000;
        var end = begin + 7 * 24 * 60 * 60;
        if (time > end || time < begin) {
            alert("只能预约最近一周的使用");
            return false;
        }
        var nowDt = new Date(time * 1000);
        nowDt.setHours(0);
        nowDt.setMinutes(0);
        nowDt.setSeconds(0);
        var nowtimestamp = Date.parse(nowDt);
        nowtimestamp = nowtimestamp / 1000;
        var postdata = {
            "apptime": nowtimestamp,
            "state": state,
            "stuname": name,
            "email": email,
            "title": theme,
            "body": content,
            "mobile": tel
        }
        $.post(contextPath+"/save", postdata, function (data) {
            if (data.state == 1) {
                alert("预约成功，请耐心等待管理员审核");
                location = 'index';
            } else {
                alert("预约失败，请重新预约");
                location = 'index';
            }
        });
    }

}
