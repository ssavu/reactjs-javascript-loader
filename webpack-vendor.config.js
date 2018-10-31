let SystemJSPlugin = require('webpack-systemjs-bundle-plugin/');
let config = {
    //The vendor bundle will be constructed and tracked by javascript loader in order to prevent loading the
    // same dependency twice
    entry: {
        vendors: [
            "react",
            "react-dom",
            "lodash",
            "moment"
        ]
    },

    externals: {},

    output: {
        path         : __dirname + '/src/main/resources/javascript/bundles/',
        filename     : "[name].js",
        libraryTarget: "amd",
        library      : "[name]_[hash]"
    },

    resolve:{
        mainFields:["browser","main"]
    },

    plugins: [
        new SystemJSPlugin({
            path: __dirname + "/src/main/resources/javascript/bundles/[name].config.json",
            name: "[name]_[hash]"
        })
    ],
    devtool: 'source-map',
    mode:'development'
};

module.exports = [config];