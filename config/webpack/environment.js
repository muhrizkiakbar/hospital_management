const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Cookies: 'jsCookies',
        List: 'list.js',
        Dropzone: 'jsDropzone',
        Popper: ['popper.js', 'default']
    })
)

const config = environment.toWebpackConfig();
config.resolve.alias = {
    jquery: 'jquery/src/jquery',
    jsCookies: 'js-cookie/src/js.cookie',
    jsDropzone: 'dropzone/dist/dropzone.js'
    // listjs: 'list.js/dist/list'
}

environment.loaders.prepend('erb', erb)
module.exports = environment