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
        Promise.all([System.import('@jahia/reactjs-javascript-loader/apps/streamedNews/main')]).then(function (m) {
            let sources = [];
            <c:forEach var="source" items="${currentNode.properties['sources']}">
                sources.push("${source}");
            </c:forEach>
            let streamedNews = {
              sources: sources.join(","),
              language: "${currentNode.properties['language']}"
            };
            let contextualData = {
                servletContext: '${url.context}',
                elementId: '${currentNode.identifier}',
                mainResourcePath: '${renderContext.mainResource.path}',
                baseURL: '${url.base}',
                editMode: "${renderContext.editMode}",
                siteName: "${renderContext.site.name}",
                siteKey: "${renderContext.site.siteKey}",
                apiKey: "${currentNode.properties["apiKey"]}"
            };
            m[0].default(contextualData, "${currentNode.displayableName}", streamedNews)
        })
    })();
</script>

<div id="app_streamedNews_${currentNode.identifier}"></div>