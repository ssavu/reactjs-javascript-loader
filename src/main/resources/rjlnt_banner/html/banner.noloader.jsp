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

<template:addResources type="javascript" resources="apps/vendors.apps.js" />
<template:addResources type="javascript" resources="apps/apps.js" />
<c:set var="targetId" value="app_banner_${fn:replace(currentNode.identifier,'-','_')}"/>
<div id="${targetId}"></div>
<script type="text/javascript">
    (function(){
        let contextualData = {
            servletContext: '${url.context}',
            elementId: '${currentNode.identifier}',
            mainResourcePath: '${renderContext.mainResource.path}',
            baseURL: '${url.base}',
            editMode: "${renderContext.editMode}",
            siteName: "${renderContext.site.name}",
            siteKey: "${renderContext.site.siteKey}"
        };
        document.addEventListener("DOMContentLoaded", function(event) {
            rjsntBannerReactRender('${targetId}', "${currentNode.identifier}", contextualData);
        });
    })();
</script>