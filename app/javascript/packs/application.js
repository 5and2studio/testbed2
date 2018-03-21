/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'bootstrap/dist/css/bootstrap.min.css';
import 'font-awesome/css/font-awesome.min.css';
import 'ionicons/dist/css/ionicons.min.css';
import 'jvectormap/jquery-jvectormap.css';
import 'admin-lte/dist/css/AdminLTE.min.css';
import 'admin-lte/dist/css/skins/skin-blue.min.css';

require('rails-ujs');
require('turbolinks');

require('respond');
require('html5shiv');

import 'expose-loader?$!expose-loader?jQuery!jquery'
import 'jquery-sparkline'
import 'expose-loader?Chart!chart.js'
import 'bootstrap'
import 'admin-lte'

import 'application';

/*
$(function () {
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%' // optional
  });
});
*/
//require('fastclick');
//require('icheck');
