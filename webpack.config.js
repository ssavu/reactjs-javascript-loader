const path = require('path');
let SystemJSPlugin = require('webpack-systemjs-bundle-plugin/');
let nodeExternals = require('webpack-node-externals');
module.exports = {
    entry: {
        apps: [ path.resolve(__dirname, 'src/main/javascript/apps/banner/main'),
            path.resolve(__dirname, 'src/main/javascript/apps/streamedNews/main'),
            path.resolve(__dirname, 'src/main/javascript/apps/highlights/main')]
    },
    resolve: {
        mainFields: ['module', 'main'],
        extensions: ['.mjs', '.js', '.jsx', '.json']
    },
    externals: [
        nodeExternals( { importType:'amd'})
    ],

    output: {
        path: __dirname + '/src/main/resources/javascript/bundles/',
        filename: "[name].js",
        libraryTarget: "amd",
        library: "[name]_[hash]"
    },

    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader",
                    options: {
                        "presets": [["@babel/preset-env", {"modules": false}], "@babel/preset-react"],
                        "plugins": [
                            ["@babel/plugin-proposal-decorators", { "legacy": true }],
                            "@babel/plugin-proposal-function-sent",
                            "@babel/plugin-proposal-export-namespace-from",
                            "@babel/plugin-proposal-numeric-separator",
                            "@babel/plugin-proposal-throw-expressions",
                            "@babel/plugin-proposal-class-properties",
                            "@babel/plugin-proposal-object-rest-spread",
                        ]
                    }
                }
            }
        ]
    },
    plugins: [
        new SystemJSPlugin({
            path: __dirname + "/src/main/resources/javascript/bundles/[name].config.json",
            name: "[name]_[hash]"
        })
    ],
    mode: 'development',
    devtool: 'source-map'
};