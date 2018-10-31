import React from 'react';
import ReactDOM from 'react-dom';
import HighlightsApp from "./HighlightsApp";

export default function(contextualData, title, highlights){
    ReactDOM.render(<HighlightsApp title={title} highlights={highlights} contextualData={ contextualData }/>, document.getElementById('app_highlights_' + contextualData.elementId));
}