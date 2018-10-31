import React from "react";
import Highlight from "./Highlight";
import * as _ from "lodash"

class HighlightsApp extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        let {highlights, title} = this.props;
        return <div>
            <h1 style={{textAlign:"center"}}>Demonstrating DX, ReactJS and Javascript Loader</h1>
            <h2>{title}</h2>
            {highlights.map((highlight) => {
                return <Highlight key={_.toLower(highlight.id)} article={highlight}/>
            })}
        </div>
    }
}

export default HighlightsApp