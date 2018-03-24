/**
 * Created by Zzzzzzzjk on 2016/10/7.
 */
/*
 * 是否预约检测
 */
var isclick = 0;
var jsonResult = {};
var jsonData = null;
setCheck();


document.onclick = function () {
    isclick = 0;
    $(".timepicker-cell").removeClass("checked");
};
$(".timepicker-small .timepicker-small-timeslot-list input[type=radio]").click(function (e) {
    isclick = 1;
    var ev = e || window.event;
    if (ev.stopPropagation) {
        ev.stopPropagation();
    }
    else if (window.event) {
        window.event.cancelBubble = true;//兼容IE
    }
})
$(".timepicker-cell").click(function (e) {
    $(".timepicker-cell").removeClass("checked");
    $(this).addClass("checked");
    isclick = 1;
    var a = this.parentNode.parentNode.parentNode.parentNode.parentNode;

    var b = this.parentNode.parentNode.parentNode.parentNode;

    var c = $(a).children();
    for (i = 0; i < c.length; i++) {
        if (c[i] == b) {
            d = i;//d是文字
        }
    }

    var f = $("#head").children().children()[d];
    var m = $("#head").children().children();
    g = d;
    a = this.parentNode.parentNode.parentNode;
    b = this.parentNode.parentNode;
    c = $(a).children();
    for (i = 0; i < c.length; i++) {
        if (c[i] == b) {
            d = i;//从0开始
        }
    }
    var ev = e || window.event;
    if (ev.stopPropagation) {
        ev.stopPropagation();
    }
    else if (window.event) {
        window.event.cancelBubble = true;//兼容IE
    }
})

function submitClick() {
    if (isclick == 1) {
        if (document.body.clientWidth > 735) {
            var counti = 0;
            var countj = 0;
            for (var i = 1; i <= 7; i++) {
                for (var j = 1; j <= 3; j++) {
                    var className = $(".timepicker-wrapper-row>.timepicker-date-column:nth-child(" + (i) + ")>ol>.timepicker-interval-row:nth-child(" + (j) + ")>div>button");
                    if (className.hasClass("checked")) {
                        counti = i;
                        countj = j;

                    }
                }
            }
            date = new Date(beginNow.getTime() + (counti - 1) * 24 * 3600 * 1000);
            var timestamp = Date.parse(date);
            timestamp = timestamp / 1000;
            window.location.href = "input?time=" + timestamp + "&state=" + countj ;
        }
        else {
            date = new Date(beginNow.getTime() + (countI - 1) * 24 * 3600 * 1000);
            var timestamp = Date.parse(date);
            timestamp = timestamp / 1000;
            window.location.href = "input?time=" + timestamp + "&state=" + countJ;
        }


    }
    else {
        alert("请选择要预约的时间！");
    }
}

/*
 * 动态时间显示
 */
function timeChange() {
    switch (time) {
        case 1:
            time = "一";
            break;
        case 2:
            time = "二";
            break;
        case 3:
            time = "三";
            break;
        case 4:
            time = "四";
            break;
        case 5:
            time = "五";
            break;
        case 6:
            time = "六";
            break;
        case 7:
        case 0:
            time = "日";
            break;
    }
}

function dayChange() {
    if (day < 10) {
        day = "0" + day;
    }
    if (daylate < 10) {
        daylate = "0" + daylate;
    }
}

var date, year, month, day, time, monthlate, daylate;

for (var i = 0; i < 7; i++) {
    var now = new Date();
    date = new Date(now.getTime() + i * 24 * 3600 * 1000);
    year = date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
    time = date.getDay();
    timeChange();
    dayChange();
    document.getElementsByTagName('th')[i].innerHTML = month + "月" + day + "日 " + "星期" + time;
    document.getElementsByClassName('date-text')[i].innerHTML = "星期" + time;
    document.getElementsByClassName('date-number')[i].innerHTML = day + "日";
}

var now = new Date();
month = now.getMonth() + 1;
day = now.getDate();
date = new Date(now.getTime() + 6 * 24 * 3600 * 1000);
monthlate = date.getMonth() + 1;
daylate = date.getDate();
dayChange()
document.getElementsByTagName('h4')[0].innerHTML = month + " 月 " + day + " 日 " + " - " + monthlate + " 月 " + daylate + " 日 ";

var beginNow = now;
beginNow.setHours(0);
beginNow.setMinutes(0);
beginNow.setSeconds(0);

/*
 * 页面且切换
 */
function theNext() {
    $(".paddlenav-arrow-left").css("display", "table-cell");
    $(".paddlenav-arrow-right").css("display", "none");
    $(".timepicker-current-medium").css("display", "none");
    $(".timepicker-next-medium").css("display", "table-cell");
    $(".timepicker-timeslots.timepicker-timeslots-medium").css("border-spacing", "4rem 1.33rem");
}

function theLast() {
    $(".paddlenav-arrow-left").css("display", "none");
    $(".paddlenav-arrow-right").css("display", "table-cell");
    $(".timepicker-current-medium").css("display", "table-cell");
    $(".timepicker-next-medium").css("display", "none");
    $(".timepicker-timeslots.timepicker-timeslots-medium").css("border-spacing", "2rem 1.33rem");
}

/*
 * 窗口大小改变强制刷新
 */
var width_one = 0;
var width_two = 0;
window.onresize = function () {
    var winWidth = document.body.clientWidth;
    width_one = winWidth;
    if (width_two < 1068 && width_one > 1068 && width_one != 0 && width_two != 0) {
        window.location.reload();
    }
    width_two = width_one;
};

/*
 * 接收json数据
 */

function setCheck() {

    $.get(contextPath+"getApplications", function (data) {
        // $.get("../createspace/json.json", function (data) {
        jsonData = data;
        var obj = jsonData.result;
        for (var i = 0; i < obj.length; i++) {
            jsonResult[i] = obj[i].status;
            var td = parseInt(i / 3) + 1;
            var li = i % 3;
            var setButton = $(".timepicker-wrapper-row>.timepicker-date-column:nth-child(" + (td) + ")>ol>.timepicker-interval-row:nth-child(" + (li + 1) + ")>div>button");
            var setSpan = $(".timepicker-wrapper-row>.timepicker-date-column:nth-child(" + (td) + ")>ol>.timepicker-interval-row:nth-child(" + (li + 1) + ")>div>button>.interval-name+span");
            if (jsonResult[i] == 0) {
                setButton.attr("disabled", "disabled");
                setSpan[0].innerHTML = "已被预约";
            }
            else if (obj[i].count > 0) {
                setButton.removeAttr("disabled", "disabled");
                setSpan[0].innerHTML = "有&nbsp;" + obj[i].count + "&nbsp;人正在预约";
            } else {
                setButton.removeAttr("disabled", "disabled");
                setSpan[0].innerHTML = "无预约";
            }
        }
    });
}

/*
 * 移动端json
 */
var countI = 4, countJ = 0;
getMobileJson();

function mobileSelect(id) {

    switch (id) {
        case "date0":
            countI = 1;
            break;
        case "date1":
            countI = 2;
            break;
        case "date2":
            countI = 3;
            break;
        case "date3":
            countI = 4;
            break;
        case "date4":
            countI = 5;
            break;
        case "date5":
            countI = 6;
            break;
        case "date6":
            countI = 7;
            break;
    }
    getMobileJson();
}

function getMobileJson() {
    $.get(contextPath+"getApplications", function (data) {
        // $.get("../createspace/json.json", function (data) {
        var jsonData = data;
        var obj = jsonData.result;
        var result = new Array(21);
        for (var i = 0; i < 3; i++) {
            var j = i + 3 * (countI - 1);
            result[i] = obj[j].status;
            var setButton = $(".timepicker-small-timeslot-list>li:nth-child(" + (i + 1) + ")>input");
            var setSpan = $(".timepicker-small-timeslot-list>li:nth-child(" + (i + 1) + ")>label");
            if (result[i] == 0) {
                setButton.attr("disabled", "disabled");
                if (i == 0) {
                    setSpan[0].innerHTML = "上午,已被预约";
                }
                else if (i == 1) {
                    setSpan[0].innerHTML = "下午,已被预约";
                }
                else if (i == 2) {
                    setSpan[0].innerHTML = "晚上,已被预约";
                }
            }
            else if (obj[j].count > 0) {
                if (i == 0) {
                    setSpan[0].innerHTML = "上午," + obj[j].count + "人正在预约";
                }
                else if (i == 1) {
                    setSpan[0].innerHTML = "下午," + obj[j].count + "人正在预约";
                }
                else if (i == 2) {
                    setSpan[0].innerHTML = "晚上," + obj[j].count + "人正在预约";
                }
                setButton.removeAttr("disabled", "disabled");
            } else {
                if (i == 0) {
                    setSpan[0].innerHTML = "上午,无人预约";
                }
                else if (i == 1) {
                    setSpan[0].innerHTML = "下午，无人预约";
                }
                else if (i == 2) {
                    setSpan[0].innerHTML = "晚上，无人预约";
                }
                setButton.removeAttr("disabled", "disabled");
            }
        }
    });
}

function timeSelect(id) {
    isclick = 1;
    switch (id) {
        case "timeslotDay0":
            countJ = 0;
            break;
        case "timeslotDay1":
            countJ = 1;
            break;
        case "timeslotDay2":
            countJ = 2;
            break;
    }

}

