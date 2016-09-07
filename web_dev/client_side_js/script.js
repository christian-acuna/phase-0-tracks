/*jshint esversion: 6 */

var el = document.createElement("div");
document.body.appendChild(el);
el.className = "child-4";
el.innerHTML = '<h2>FOUR</h2>';
el.onmouseover = console.log('log');
el.style.color = 'red';

var list = document.querySelectorAll('div');
console.log(list);
for (var item of list) {
  item.style.fontSize = '25px';
}
