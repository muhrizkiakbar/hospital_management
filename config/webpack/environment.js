const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Cookies: 'jsCookies',
        Popper: ['popper.js', 'default']
    })
)

const config = environment.toWebpackConfig();
config.resolve.alias = {
    jquery: 'jquery/src/jquery',
    jsCookies: 'js-cookie/src/js.cookie'
}

module.exports = environment

