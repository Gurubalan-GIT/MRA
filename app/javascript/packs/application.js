// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css'

$(document).on('turbolinks:load', function(){
    // Turn on js-selectable class so that it becomes SELCT 2 tag
    $('.js-selectable').select2({
      allowClear: true,
      width: 200
      // If you are using Bootstrap, please add　`theme: "bootstrap"` too.
    });
  });

