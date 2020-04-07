const { environment } = require('@rails/webpacker')

/* This modification if to ensure that our javascript
understands the $, Jquery and Popper aliases. For that
we use the Provide plugin in webpack to autoload and map
the respective libraries/modules to the aliases in this
file.
*/
const webpack = require('webpack')
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
