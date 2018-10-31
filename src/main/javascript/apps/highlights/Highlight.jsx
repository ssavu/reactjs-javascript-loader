import React from "react";
import * as moment from "moment";

const styles = {
    container: {
        padding: "5px",
        border: "1px solid #eaeaea",
        borderRadius: "8px",
        marginBottom: "10px"
    },
    innerContainer: {
        display: "flex",
        padding: "5px"
    },
    image: {
        maxHeight: "180px",
        maxWidth: "240px",
        border: "1px solid #e0e0e0",
        padding: "4px"
    },
    title: {
        paddingLeft: "5px",
        color :"#006699"
    },
    excerpt: {
        lineHeight: "1.15em",
        paddingLeft: "10px",
        fontWeight: 300
    },
    date: {
        paddingLeft: "5px",
        fontSize: "12px",
        color: "#999",
        marginBottom: "10px"
    }
};

const Highlight = (props) => {
    let {article} = props;

    return <div style={styles.container}>
        <div><h3 style={styles.title}>{article.title}</h3></div>
        <p style={styles.date}>{moment(article.date).format('LLL')}</p>
        <div style={styles.innerContainer}>
            <img style={styles.image} src={"/files/default/" + article.image}/>
            <h5 style={styles.excerpt}>{article.excerpt}</h5>
        </div>
    </div>
};

export default Highlight;