# APLProgressKringel

APLProgressKringel is a modern way to represent your progress using a circle. To use it, these steps are necessary:

  - Add the pod to your Podfile
  - `#import <APLProgressKringel/APLProgressKringel.h>`
  - Instantiate the _APLProgressKringelView_ using its `-instantiateFromXib` method
  - Add it to your view hierarchy
  - Configure the `textColor`, `circleColor` and optionally the `font` as needed
  - Don't forget to set the `strokeWidth` to something greater than zero
  - Set the `progress` property to something between 0 _(meaning 0%)_ and 1 _(100%)_
  - Enjoy.
