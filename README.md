# RAContentStretchingView

UIView content stretching / grouped table view cells done right.

## Sample

Look at the [Sample App](https://github.com/evadne/RAContentStretchingView-Sample).  It contains several static cells, and no interaction at all.  The interesting part is that the whole thing is backed by *one image* and there is no runtime drawing involved.

## What’s Inside

There’s a super generic `RAContentStretchingView`.  It takes an `image`, and exposes three insets as `UIEdgeInsets`:

*	`imageStretchingInsets`: The actual edge insets for image stretching. 
*	`imageVisualInsets`: The logical or visual edge insets, from the edge of the bitmap to the edge of the box drawn in the bitmap.
*	`stretchedResultInsets`: The inset to apply to the final container view surrounding the image.

Let’s look at the grouped table view cells in `UITableView` to discuss why three separate insets are needed.  

If you’re conscious about memory usage and interface flexibility, you’ll also want to stretch a small, nine-slice image instead of a very wide, 320-by-44-points image that is only good for one dimension, hence you use `imageStretchingInsets` to define the stretchability of the image.

Some times, the inset bevel has a drop shadow below it or a highlight above it.  In all cases, the image needs to be larger than the cell itself to allow such effects to be baked into the image.  Hence you use `imageVisualInsets` to define the distance from each edge of the image to the actual edge that is aligned with the cell background view bounds.

When you have a grouped `UITableView` which supports row swapping (data source implements `-tableView:moveRowAtIndexPath:toIndexPath:` and potentially `-tableView:canMoveRowAtIndexPath:`), the corners in the background view for the cells slide in and out as you move the rows around.  This behavior can be observed within the Notifications settings pane in Settings.app as well.  If you’re drawing the backgrounds in code using Core Graphics, you’ll be out of luck.  You need to have *one common backing image* that spans all states and can be *slided around* and *clipped at-will*.  Hence you use `stretchedResultInsets` in conjunction with `imageVisualInsets` to clip the top or bottom parts of the image off.  Both, if you are displaying the view for a middle row that is not the first or last row in the section.  Neither, if you are displaying a row for a section that has only one row.


## Licensing

This project is in the public domain.  You can use it and embed it in whatever application you sell, and you can use it for evil.  However, it is appreciated if you provide attribution, by linking to the project page ([https://github.com/evadne/RAContentStretchingView](https://github.com/evadne/RAContentStretchingView)) from your application.

## Credits

*	[Evadne Wu](http://twitter.com/evadne) at Radius ([Info](http://radi.ws))
