const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    Popper: ["popper.js", "default"],
    i18n: "i18n-js",
    toastr: "toastr"
  })
);

module.exports = environment;
