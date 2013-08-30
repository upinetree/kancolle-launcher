var dragging = false;
var diffX = 0, diffY = 0;

document.addEventListener("mousedown", function(event)
{
  diffX = event.pageX;
  diffY = event.pageY;
  dragging = true;
  event.preventDefault();

  return true;
});

document.addEventListener("mouseup", function(event)
{
  dragging = false;
  event.preventDefault();

  return true;
});

document.addEventListener("mousemove", function(event)
{
  if (dragging) {
    window.moveTo(event.screenX - window.diffX, event.screenY - window.diffY);
  }
    
  return true;
});
