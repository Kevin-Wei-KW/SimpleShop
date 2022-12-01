<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 2021-03-13
  Time: 8:21 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../header.jsp" %>
<div id="title">
    <c:if test="${postModel.id!=null}">
        <h1>Edit Post</h1>
    </c:if>
    <c:if test="${postModel.id==null}">
        <h1>New Post</h1>
    </c:if>
</div>
<div class="editSection">
    <form action="/post/save" method="post" enctype="multipart/form-data" name="postForm">
        <div>
            <input type="hidden" name="id" value="${postModel.id}">
        </div>
        <div class="form-group">
            <label>Title:</label>
            <br>
            <input type="text" id="post.title" name="title" value="${postModel.title}">
        </div>
        <div class="form-group">
            <label>Picture: <input type = "file" name = "files" multiple = "multiple" /></label>

            <br>

<%--            <c:if test="${postModel.getAllURL().size() > 0}">--%>
<%--                <c:forEach items="${postModel.getAllURL()}" var="pic" varStatus="state">--%>
<%--                    <c:if test="${pic != null}">--%>
<%--                        ${pic}--%>
<%--                        <img src="${pic}" style="width: 64px; min-height: 16px" id="imgPicture${pic.charAt(pic.length()-1)}">--%>
<%--                        <input type="hidden" name="picURL${pic.charAt(pic.length()-1)}" value="${pic}">--%>
<%--                        <button type="button" class="btn btn-sm" onclick="deletePicture(${Integer.parseInt(pic.substring(pic.length()-1))})">Delete</button>--%>
<%--                    </c:if>--%>
<%--                </c:forEach>--%>
<%--            </c:if>--%>


            <div id="picture" class="row">
                <c:if test="${postModel.picURL0!=null && postModel.picURL0.length()>0}">
                    ${postModel.picURL0}
                    <img src="${postModel.picURL0}" style="width: 64px; min-height: 16px" id="imgPicture0">
                    <input type="hidden" name="picURL0" value="${postModel.picURL0}">
                    <button type="button" class="btn btn-sm" onclick="deletePicture(0)">Delete</button>
                </c:if>
                <c:if test="${postModel.picURL1!=null && postModel.picURL1.length()>0}">
                    ${postModel.picURL1}
                    <img src="${postModel.picURL1}" style="width: 64px; min-height: 16px" id="imgPicture1">
                    <input type="hidden" name="picURL1" value="${postModel.picURL1}">
                    <button type="button" class="btn btn-sm" onclick="deletePicture(1)">Delete</button>
                </c:if>
                <c:if test="${postModel.picURL2!=null && postModel.picURL2.length()>0}">
                    ${postModel.picURL2}
                    <img src="${postModel.picURL2}" style="width: 64px; min-height: 16px" id="imgPicture2">
                    <input type="hidden" name="picURL2" value="${postModel.picURL2}">
                    <button type="button" class="btn btn-sm" onclick="deletePicture(2)">Delete</button>
                </c:if>
                <c:if test="${postModel.picURL3!=null && postModel.picURL3.length()>0}">
                    ${postModel.picURL3}
                    <img src="${postModel.picURL3}" style="width: 64px; min-height: 16px" id="imgPicture3">
                    <input type="hidden" name="picURL3" value="${postModel.picURL3}">
                    <button type="button" class="btn btn-sm" onclick="deletePicture(3)">Delete</button>
                </c:if>
                <c:if test="${postModel.picURL4!=null && postModel.picURL4.length()>0}">
                    ${postModel.picURL4}
                    <img src="${postModel.picURL4}" style="width: 64px; min-height: 16px" id="imgPicture4">
                    <input type="hidden" name="picURL4" value="${postModel.picURL4}">
                    <button type="button" class="btn btn-sm" onclick="deletePicture(4)">Delete</button>
                </c:if>
            </div>


        </div>
        <div class="form-group">
            <label>Price:</label>
            <br>
            <input type="number" id="post.price" name="price" value="${postModel.price}">
        </div>
        <div class="form-group">
            <label>Description:</label>
            <br>
            <textarea rows="3" cols="50" name="description"
                      placeholder="${postModel.description}">${postModel.description}</textarea>
        </div>
        <div class="form-group" style="padding-top: 10px; padding-left:80px;padding-right:80px">
            <label for="Category">Category:</label>
            <div id="Category" class="row">

                <div class="form-check ml-3">
                    <input type="radio" class="form-check-input" name="category" id="uniforms"
                           value="UNIFORMS" ${postModel.category=="UNIFORMS"?"checked":""}>
                    <label class="form-check-label" for="books">Uniforms</label>
                </div>

                <div class="form-check ml-3">
                    <input type="radio" class="form-check-input" name="category" id="books"
                           value="BOOKS" ${postModel.category=="BOOKS"?"checked":""}>
                    <label class="form-check-label" for="books">Books</label>
                </div>

                <div class="form-check ml-3">
                    <input type="radio" class="form-check-input" name="category" id="electronics"
                           value="ELECTRONICS" ${postModel.category=="ELECTRONICS"?"checked":""}>
                    <label class="form-check-label" for="electronics">Electronics</label>
                </div>

                <div class="form-check ml-3">
                    <input type="radio" class="form-check-input" name="category" id="sports"
                           value="SPORTS" ${postModel.category=="SPORTS"?"checked":""}>
                    <label class="form-check-label" for="books">Sports</label>
                </div>

                <div class="form-check ml-3">
                    <input type="radio" class="form-check-input" name="category" id="instruments"
                           value="INSTRUMENTS" ${postModel.category=="INSTRUMENTS"?"checked":""}>
                    <label class="form-check-label" for="books">Instruments</label>
                </div>

                <div class="form-check ml-3">
                    <input type="radio" class="form-check-input" name="category" id="otheres"
                           value="OTHERS" ${postModel.category=="OTHERS"?"checked":""}>
                    <label class="form-check-label" for="books">Others</label>
                </div>

            </div>
        </div>
        <div style="padding-top: 12px">
            <c:if test="${postModel.id!=null}">
                <button type="submit" class="btn btn-primary">SAVE</button>
            </c:if>
            <c:if test="${postModel.id==null}">
                <button type="submit" class="btn btn-primary">POST</button>
            </c:if>

        </div>

        <br>
        ${saveMessage}

    </form>
</div>
<script type="application/javascript">
    function deletePicture(index){
        $("input[name|='picURL"+index+"']").val("");
        $("#imgPicture"+index).attr("src","");
    }
</script>
<%@include file="../footer.jsp" %>
