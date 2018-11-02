import React from 'react';
import NewsAPI from 'newsapi'
import Entry from './entry';

class StreamedNews extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            entries: []
        };
        let {apiKey} = this.props.contextualData;
        const newsapi = new NewsAPI(apiKey);
        if (apiKey) {
            newsapi.v2.topHeadlines({
                sources: props.streamedNews.sources,
                language: props.streamedNews.language,
                pageSize: 10,
                page:1
            }).then(response => {
                if (response.status === "ok") {
                    this.setState({
                        entries: response.articles
                    })
                }
            });
        }
    }

    render() {
        let {entries} = this.state;
        let {title} = this.props;
        return <div>
            <h1 style={{textAlign:"center"}}>Demonstrating DX, ReactJS and Javascript Loader</h1>
            <h2>{title}</h2>
            {entries.map((entry, index)=> {
                return <Entry key={"entry_" + index} entry={entry}/>
            })}
        </div>
    }
}

export default StreamedNews