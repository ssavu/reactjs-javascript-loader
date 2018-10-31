import React from 'react';
import ReactDOM from 'react-dom';
import BannerApp from './BannerApp';

export default function(contextualData){
    ReactDOM.render(<BannerApp contextualData={ contextualData }/>, document.getElementById('app_banner_' + contextualData.elementId));
}

window.rjsntBannerReactRender = function(target, id, contextualData) {
    ReactDOM.render(<BannerApp id={id} contextualData={contextualData}/>, document.getElementById(target));
};