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


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

$(".audioButton").on("click", function() {
  $(".audio-play")[0].currentTime = 0;
  return $(".audio-play")[0].play();
});


function scrollAppear() {
  let left = document.querySelector('#left');
  let right = document.querySelector('#right');
  let left2 = document.querySelector('#left2')
  let position = left.getBoundingClientRect().top;
  let screenPosition = window.innerHeight / 1.5;

  if(position < screenPosition) {
    left.classList.add('showLeft');
    right.classList.add('showRight');
    left2.classList.add('showLeft2')
  }
  else {
    left.classList.remove('showLeft');
    right.classList.remove('showRight');
    left2.classList.remove('showLeft2')
  }
}

window.addEventListener('scroll', scrollAppear);


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});

var backButton = document.querySelector('.back-button')

function backAnim(){
  if (backButton.classList.contains('back')){
    backButton.classList.remove('back');
  }
  else{
    backButton.classList.add('back');
    setTimeout(backAnim, 1000);
  }
}

