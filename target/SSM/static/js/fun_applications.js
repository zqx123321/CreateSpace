var table;
layui.use('table', function () {
    table = layui.table;
    var text = $('#type option:selected').text();

    table.render({
        elem: '#application'
        , url: contextPath+'/admin/list?type=' + text
        , page: true
        , cols: [[
            {field: 'stuname', title: '申请人'}
            , {field: 'title', sort: true, title: '申请标题'}
            , {field: 'orderTime', sort: true, title: '申请时间段'}
            , {field: 'createtime', sort: true, title: '提交时间'}
            , {field: 'deal', sort: true, title: '处理状态'}
            , {fixed: 'right', align: 'center', toolbar: '#barDemo', width: '20%',title: '操作'}
        ]]
    });

    //监听工具条
    table.on('tool(applications)', function (obj) {
        var data = obj.data;
        if (obj.event === 'detail') {
            location = contextPath+"/admin/applications_detail?id=" + data.id;
        } else if (obj.event === 'refuse') {
            if (data.deal == "已拒绝") {
                layer.msg('该条申请已经被拒绝');
            }
            else {
                doRefuse(data.id);
            }
        } else if (obj.event === 'edit') {
            if (data.deal == "已同意") {
                layer.msg('该条申请已经被同意');
            }
            else {
                agreeChek(data.id);
            }
        } else if (obj.event === 'del') {
            doDelete(data.id);
        }
    });

    $('.applications .layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
});

layui.use('form', function () {
    var form = layui.form;
    form.on('select(type)', function (data) {
        table.render({
            elem: '#application'
            , url: contextPath+'/admin/list?type=' + data.value
            , page: true
            , cols: [[
                {field: 'stuname', title: '申请人'}
                , {field: 'createtime', sort: true, title: '申请标题'}
                , {field: 'deal', sort: true, title: '处理状态'}
                , {fixed: 'right', align: 'center', toolbar: '#barDemo', width: '20%', title: '操作'}
            ]]
        });
    });

    //监听提交
    form.on('submit(excel)', function(data){
        // layer.alert(JSON.stringify(data.field), {
        //     title: '最终的提交信息'
        // })
        // return false;
    });

});


function doAgree(id) {
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.confirm('确定同意申请？', function (index) {
            $.ajax({
                type: 'POST',
                url: contextPath+'/admin/applications_agree',
                dataType: 'json',
                data: {id: id},
                success: function (data) {
                    var messages = data.success;
                    if (messages > 0) {
                        layer.msg('已同意!');
                        setTimeout(function () {
                            window.location.reload();
                        }, 500);
                    }
                    else {
                        alert('网络异常');
                    }
                },
                error: function (data) {
                    alert('网络异常');
                },
            });
            layer.close(index);
        });
    });

    return false;
}

function agreeChek(id) {
    $.ajax({
        type: 'POST',
        url: contextPath+'/admin/applications_agreeCheck',
        dataType: 'json',
        data: {id: id},
        success: function (data) {
            var messages = data.count;
            if (messages > 0) {
                layui.use('layer', function () {
                    var layer = layui.layer;
                    layer.confirm('此时间段已经有' + messages + "人的申请被通过，确认再次通过该申请？", function (index) {
                        doAgree(id);
                        layer.close(index);
                    });

                });
            }
            else {
                doAgree(id);
            }
        },
        error: function (data) {
            alert('网络异常');
        },
    });
}

function doRefuse(id) {
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.confirm('确定拒绝申请？', function (index) {
            $.ajax({
                type: 'POST',
                url: contextPath+'/admin/applications_refuse',
                dataType: 'json',
                data: {id: id},
                success: function (data) {
                    var messages = data.success;
                    if (messages > 0) {
                        layer.msg('已拒绝!');
                        setTimeout(function () {
                            window.location.reload();
                        }, 500);
                    }
                    else {
                        alert('网络异常');
                    }
                },
                error: function (data) {
                    alert('网络异常');
                },
            });
            layer.close(index);
        });
    });
    return false;
}

function doDelete(id) {
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.confirm('确定删除申请？', function (index) {
            $.ajax({
                type: 'POST',
                url: contextPath+'/admin/applications_delete',
                dataType: 'json',
                data: {id: id},
                success: function (data) {
                    var messages = data.success;
                    if (messages > 0) {
                        layer.msg('已删除!');
                        setTimeout(function () {
                            window.location.reload();
                        }, 500);
                    }
                    else {
                        alert('网络异常');
                    }
                },
                error: function (data) {
                    alert('网络异常');
                },
            });
            layer.close(index);
        });
    });
    return false;
}

function excel() {
    console.log("ddd");
    var text = $('#type option:selected').text();
    console.log(text);
    $.ajax({
        type: 'POST',
        url: contextPath+'/admin/excel',
        dataType: 'json',
        data: {type: text},
        success: function (data) {
            // var messages = data.success;
            // if (messages > 0) {
            //     layer.msg('导出成功！');
            //     setTimeout(function () {
            //         window.location.reload();
            //     }, 500);
            // }
            // else {
            //     alert('网络异常');
            // }
        },
        error: function (data) {
            alert('网络异常');
        },
    });

    // layui.use('layer', function () {
    //     var layer = layui.layer;
    //     layer.confirm('确定导出？', function (index) {
    //
    //         layer.close(index);
    //     });
    // });
    return false;
}