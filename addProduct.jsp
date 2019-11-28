<%--
  Created by IntelliJ IDEA.
  User: 张耿永
  Date: 2019/11/15
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加商品</title>

    <jsp:include page="/common/script.jsp"></jsp:include>

    <script type="text/html" id="showAddDiv">
        <div  >
            <form class="form-horizontal" id="formApp" >
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品名称</label>
                    <div class="col-sm-4">
                        <input type="text" name="name" class="form-control" id="add_productName" >
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品价格</label>
                    <div class="col-sm-4">
                        <input type="text" name="price" class="form-control" id="add_price" >
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">商品品牌</label>
                    <div class="col-sm-4">
                        <select class="form-control"  id="add_brand">
                            <option value="-1">==请选择==</option>
                        </select>
                    </div>
                </div>
                <div class="form-group" style="margin-bottom: 100px">
                    <label  class="col-sm-2 control-label">商品图片</label>
                    <div class="col-sm-5" style="height:300px">
                        <input id="input-id" name="file" multiple type="file" data-show-caption="true">
                        <input type="hidden" name="filePath" id="add_filePath">
                    </div>
                </div>
            </form>
        </div>
    </script>

    <script>
        <%--上传图片--%>
        function initUpdateFileInput() {
            var filePath = $("#update_filePath").val();
            $("#update_input").fileinput({
                language: 'zh', //设置语言
                uploadUrl: "<%=request.getContextPath()%>/photoUpload.do", //上传的地址
                allowedFileExtensions: ['jpg', 'gif', 'png','exe'],//接收的文件后缀
                //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
                uploadAsync: true, //默认异步上传
                showUpload: true, //是否显示上传按钮
                showRemove : true, //显示移除按钮
                showPreview : true, //是否显示预览
                showCaption: false,//是否显示标题
                browseClass: "btn btn-primary", //按钮样式
                //dropZoneEnabled: true,//是否显示拖拽区域
                //minImageWidth: 50, //图片的最小宽度
                //minImageHeight: 50,//图片的最小高度
                //maxImageWidth: 1000,//图片的最大宽度
                //maxImageHeight: 1000,//图片的最大高度
                //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                //minFileCount: 0,
                maxFileCount: 10, //表示允许同时上传的最大文件个数
                enctype: 'multipart/form-data',
                validateInitialCount:true,
                previewFileIcon: "<i class='glyphicon glyphicon-cloud'></i>",
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
                layoutTemplates :{
                    //actionDelete:'', //去除上传预览的缩略图中的删除图标
                    //actionUpload:'',//去除上传预览缩略图中的上传图片；
                    //actionZoom:''   //去除上传预览缩略图中的查看详情预览的缩略图标。
                },
                initialPreview: [
                    "<img src='"+imgUrl+""+filePath+"' class='file-preview-image' width='100px' alt='Desert' title='Desert'>",
                ],
            }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
                console.log('文件上传成功！');
                console.log(data);
                $("#update_filePath").val(data.response.filePath);
            })
        }


    </script>

    <script type="text/html" id="showUploadDiv">
        <div  >
            <div class="form-group" style="height: 50px">
                <label  class="col-sm-2 control-label">上传excel</label>
                <div class="col-sm-5" >
                    <input id="upload" name="file"  type="file" data-show-caption="true">
                    <input type="hidden"  id="upload_add_filePath">
                </div>
            </div>
        </div>
    </script>

</head>
<body>
    <input type="button" value="测试" onclick="test()">
</body>
</html>
