// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'core-js/stable'
import 'regenerator-runtime/runtime'
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("jquery");

import 'bootstrap';
require("js-cookie");
require("jquery.scrollbar");
require("jquery-scroll-lock");
require("list.js");
require("bs-stepper");
// $(document).on('turbolinks:load', function() {
// import List from "list.js";
// });
import './argon/argon';

import '../stylesheets/application';
import "@fortawesome/fontawesome-free/js/all";

import './custom';
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)