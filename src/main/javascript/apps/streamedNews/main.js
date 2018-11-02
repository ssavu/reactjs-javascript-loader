import React from 'react';
import ReactDOM from 'react-dom';
import StreamedNews from "./streamedNews";

export default function(contextualData, title, streamedNews){
    ReactDOM.render(<StreamedNews title={title} streamedNews={streamedNews} contextualData={ contextualData }/>, document.getElementById('app_streamedNews_' + contextualData.elementId));
}