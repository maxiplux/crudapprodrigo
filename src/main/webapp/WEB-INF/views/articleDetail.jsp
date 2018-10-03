
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance" prefix="layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:extends name="base">
    <layout:put block="titlePage" type="REPLACE">
        <c:out value="Article | ${article.title}"/>
    </layout:put>
    <layout:put block="styleLinks" type="REPLACE">

    </layout:put>
    <layout:put block="content" type="REPLACE">
        <div class="container">
            <div>

                <img src="<c:url value="${article.image}"/>" height="200">
                <br/>
                <strong>${article.title}</strong>
                <br/>
                    ${article.category}
                <br/>
                    ${article.publicationDate}
                <br>

                <br>
                    ${article.content}
                <br>
            </div>

            <br>
            <strong>New Comment:</strong>


        </div>
    </layout:put>
</layout:extends>