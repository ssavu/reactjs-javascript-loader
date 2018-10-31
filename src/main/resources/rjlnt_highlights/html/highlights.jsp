<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="flowRequestContext" type="org.springframework.webflow.execution.RequestContext"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>

<jahia-npm-resource name="@jahia/reactjs-javascript-loader"></jahia-npm-resource>

<script>
    (function() {
        Promise.all([System.import('@jahia/reactjs-javascript-loader/apps/highlights/main')]).then(function (m) {
            let highlights = [];
            <c:set var="items" value="${jcr:getChildrenOfType(currentNode, 'rjlnt:highlight')}"/>
            <c:forEach items="${items}" var="item">
            <jcr:node var="image" uuid='${item.properties["image"]}'/>
            highlights.push({
                id: "${item.identifier}",
                path: "${item.path}",
                title: "${item.displayableName}",
                excerpt: "${item.properties["excerpt"]}",
                image: "${image.path}",
                date: "${item.properties["date"]}"
            });
            </c:forEach>
            let contextualData = {
                servletContext: '${url.context}',
                elementId: '${currentNode.identifier}',
                mainResourcePath: '${renderContext.mainResource.path}',
                baseURL: '${url.base}',
                editMode: "${renderContext.editMode}",
                siteName: "${renderContext.site.name}",
                siteKey: "${renderContext.site.siteKey}",
            };
            m[0].default(contextualData, "${currentNode.displayableName}", highlights)
        })
    })();
</script>

<div id="app_highlights_${currentNode.identifier}"></div>

<template:include view="hidden.header"/>
<c:set var="resourceReadOnly" value="${currentResource.moduleParams.readOnly}"/>
<c:if test="${moduleMap.editable and renderContext.editMode && !resourceReadOnly}">
    <template:module path="*" nodeTypes="rjlnt:highlight"/>
</c:if>