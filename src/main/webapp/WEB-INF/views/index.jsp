<%--
  Created by IntelliJ IDEA.
  User: zqx
  Date: 2018/3/6
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>众创空间自主预约</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css.css">
    <meta http-equiv="X-UA-Compatible" content="IE=9,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

</head>
<body>
<div class="nav">
    <a href="http://it.ouc.edu.cn/itstudio/PC/index.html"><img src="${pageContext.request.contextPath}/static/img/it-ico.png" alt=""></a>
    <span class="title"><a href="/index">众创空间自主预约</a></span>
</div>
<div class="container">
    <div id="MainStage" role="main">
        <div id="timeBar">
            <div class="concierge-body timeBar-body timeBar-timepicker">
                <h2 id="timeBar-timepicker-pagetitle" class="timepicker-title">选择时间：<br>
                </h2>
                <div id="TheForm" name="TheForm" method="get">
                    <div class="timepicker-stage">
                        <div id="timepicker" class="timepicker with-paddlenav timepicker-headless timepicker-intervals">
                            <h4 class="timepicker-daterange small-hide"></h4>
                            <div class="timepicker-full small-hide">
                                <div class="timepicker-timeslots-wrapper">
                                    <table class="timepicker-timeslots timepicker-timeslots-medium">
                                        <thead id="head">
                                        <tr>
                                            <th class="column-head timepicker-current-medium timepicker-current-large"></th>
                                            <th class="column-head timepicker-current-medium timepicker-current-large"></th>
                                            <th class="column-head timepicker-current-medium timepicker-current-large"></th>
                                            <th class="column-head timepicker-current-medium timepicker-current-large"></th>
                                            <th class="column-head timepicker-current-medium timepicker-next-medium timepicker-current-large"></th>
                                            <th class="column-head timepicker-current-medium timepicker-next-medium timepicker-current-large"></th>
                                            <th class="column-head timepicker-current-medium timepicker-next-medium timepicker-current-large"></th>
                                        </tr>
                                        </thead>
                                        <tbody id="body">
                                        <tr class="timepicker-wrapper-row">
                                            <td class="timepicker-date-column timepicker-current-medium timepicker-current-large"
                                                valign="top">
                                                <ol aria-hidden="true">
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name">上午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 下午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 晚上<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </td>
                                            <td class="timepicker-date-column timepicker-current-medium timepicker-current-large"
                                                valign="top">
                                                <ol aria-hidden="true">
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 上午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name">  下午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 晚上<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </td>
                                            <td class="timepicker-date-column timepicker-current-medium timepicker-current-large"
                                                valign="top">
                                                <ol aria-hidden="true">
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"
                                                            >
                                                                <span class="interval-name"> 上午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 下午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 晚上<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </td>
                                            <td class="timepicker-date-column timepicker-current-medium timepicker-current-large"
                                                valign="top">
                                                <ol aria-hidden="true">
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 上午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 下午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 晚上<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </td>
                                            <td class="timepicker-date-column timepicker-current-medium timepicker-next-medium timepicker-current-large"
                                                valign="top">
                                                <ol aria-hidden="true">
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 上午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell">
                                                                <span class="interval-name"> 下午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 晚上<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </td>
                                            <td class="timepicker-date-column timepicker-current-medium timepicker-next-medium timepicker-current-large"
                                                valign="top">
                                                <ol aria-hidden="true">
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 上午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 下午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 晚上<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </td>
                                            <td class="timepicker-date-column timepicker-current-medium timepicker-next-medium timepicker-current-large"
                                                valign="top">
                                                <ol aria-hidden="true">
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 上午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 下午<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                    <li class="timepicker-interval-row">
                                                        <div class="timepicker-block block-interval">
                                                            <button type="button" class="timepicker-cell"
                                                                    aria-expanded="false"  >
                                                                <span class="interval-name"> 晚上<span
                                                                        class="a11y" role="presentation">.</span></span>
                                                                <span>可选时间</span>
                                                            </button>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <nav role="navigation"
                                 class="paddlenav timepicker-main-nav timepicker-medium large-hide medium-show small-hide">
                                <ul role="presentation">
                                    <li role="presentation">
                                        <button type="button" class="paddlenav-arrow paddlenav-arrow-left hidden"
                                                onclick="theLast()" aria-label="上一页"></button>
                                    </li>
                                    <li role="presentation">
                                        <button type="button" class="paddlenav-arrow paddlenav-arrow-right"
                                                onclick="theNext()" aria-label="下一页"></button>
                                    </li>
                                </ul>
                            </nav>
                            <div class="timepicker-small large-hide medium-hide small-show">
                                <div class="timepicker-datelist-wrapper small-sticky-top small-sticky">
                                    <div class="timepicker-datelist-clip">
                                        <ol class="timepicker-datelist" style="min-width: 360px">
                                            <li role="presentation">
                                                <input type="radio" name="date" id="date0" aria-hidden="true" onclick="mobileSelect(this.id)"
                                                >
                                                <label class="date-label" for="date0" role="radio" aria-checked="false"
                                                       aria-disabled="true">
                                                    <span role="presentation" class="date-text"></span>
                                                    <span role="presentation" class="date-number"></span>
                                                </label>
                                            </li>
                                            <li role="presentation">
                                                <input type="radio" name="date" id="date1" aria-hidden="true" onclick="mobileSelect(this.id)"
                                                >
                                                <label class="date-label" for="date1" role="radio" aria-checked="false"
                                                       aria-disabled="true">
                                                    <span role="presentation" class="date-text"></span>
                                                    <span role="presentation" class="date-number"></span>
                                                </label>
                                            </li>
                                            <li role="presentation">
                                                <input type="radio" name="date" id="date2" aria-hidden="true" onclick="mobileSelect(this.id)"
                                                >
                                                <label class="date-label" for="date2" role="radio" aria-checked="false"
                                                       aria-disabled="true">
                                                    <span role="presentation" class="date-text"></span>
                                                    <span role="presentation" class="date-number"></span>
                                                </label>
                                            </li>
                                            <li role="presentation">
                                                <input type="radio" name="date" id="date3" aria-hidden="true" onclick="mobileSelect(this.id)"
                                                       checked="">
                                                <label class="date-label" for="date3" role="radio" aria-checked="true">
                                                    <span role="presentation" class="date-text"></span>
                                                    <span role="presentation" class="date-number"></span>
                                                </label>
                                            </li>
                                            <li role="presentation">
                                                <input type="radio" value="04 日 星期二" name="date" id="date4" onclick="mobileSelect(this.id)"
                                                       aria-hidden="true">
                                                <label class="date-label" for="date4" role="radio" aria-checked="false">
                                                    <span role="presentation" class="date-text"></span>
                                                    <span role="presentation" class="date-number"></span>
                                                </label>
                                            </li>
                                            <li role="presentation">
                                                <input type="radio" name="date" id="date5" aria-hidden="true" onclick="mobileSelect(this.id)">
                                                <label class="date-label" for="date5" role="radio" aria-checked="false">
                                                    <span role="presentation" class="date-text"></span>
                                                    <span role="presentation" class="date-number"></span>
                                                </label>
                                            </li>
                                            <li role="presentation">
                                                <input type="radio" name="date" id="date6" aria-hidden="true" onclick="mobileSelect(this.id)">
                                                <label class="date-label" for="date6" role="radio" aria-checked="false">
                                                    <span role="presentation" class="date-text"></span>
                                                    <span role="presentation" class="date-number"></span>
                                                </label>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                                <fieldset class="timepicker-small-fieldset" id="timepickerSmallFieldset">
                                    <legend class="a11y">03 日 星期一</legend>
                                    <ol class="timepicker-small-timeslot-list">
                                        <li role="presentation">
                                            <input id="timeslotDay0"
                                                   aria-labelledby="timepickerSmallFieldset timeslotDayLabel0"
                                                   type="radio" name="smallTimeslotId" aria-hidden="true" onclick="timeSelect(this.id)"
                                            >
                                            <label class="timeslot-day-label" for="timeslotDay0" id="timeslotDayLabel0"
                                                   role="radio" aria-checked="false"
                                                   aria-disabled="true">
                                                上午,可选时间<span class="a11y" role="presentation">, </span>
                                            </label>
                                        </li>
                                        <li role="presentation">
                                            <input id="timeslotDay1"
                                                   aria-labelledby="timepickerSmallFieldset timeslotDayLabel1"  onclick="timeSelect(this.id)"
                                                   type="radio" name="smallTimeslotId" aria-hidden="true">
                                            <label class="timeslot-day-label" for="timeslotDay1" id="timeslotDayLabel1"
                                                   role="radio" aria-checked="false" >
                                                下午,可选时间<span class="a11y" role="presentation">, </span>
                                            </label>
                                        </li>
                                        <li role="presentation">
                                            <input id="timeslotDay2"
                                                   aria-labelledby="timepickerSmallFieldset timeslotDayLabel2" onclick="timeSelect(this.id)"
                                                   type="radio" name="smallTimeslotId" aria-hidden="true">
                                            <label class="timeslot-day-label" for="timeslotDay2" id="timeslotDayLabel2"
                                                   role="radio" aria-checked="false" >
                                                晚上,可选时间<span class="a11y" role="presentation">, </span>
                                            </label>
                                        </li>
                                    </ol>
                                </fieldset>
                            </div>
                            <div class="timepicker-footer small-sticky-bottom drawer drawer-open">
                                <input type="hidden" name="id" value="">
                                <button id="timepicker-submit" onclick="submitClick()"
                                        class="button form-button is-disabled" aria-expanded="false" value="前往预约">
                                    前往预约
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="foot">
    Copyright © 2018 Itstudio All rights reserved.<a style="color: #1C86EE;font-size: 14px;line-height: 35px;" href="http://it.ouc.edu.cn/create/admin">管理登录</a>
</div>
<script>
    <%--JS gloable varilible--%>
    var contextPath = "${pageContext.request.contextPath}";
</script>
</body>
</html>
<script language=javascript src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script language=javascript src="${pageContext.request.contextPath}/static/js/function.js"></script>
