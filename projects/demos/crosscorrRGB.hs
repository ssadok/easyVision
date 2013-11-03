import Vision.GUI
import ImagProc
import Numeric.LinearAlgebra
import Vision(scaling)
import Contours(poly2roi)
import Util.Misc(debug)

main = run $ getBackground
         >>> observe "template" snd
         >>> observe "cross correlation" (\(x,p) -> sqrDistRGB p (rgb x))


getBackground = clickKeep "click to set template" f g Nothing
  where
    f _ = warp (255, 255, 255) (Size 320 320) (scaling 2) . rgb
    g x = Draw [Draw (rgb $ fst x), color white roi ]
    roi = Closed [Point 0.5 0.5, Point 0.5 (-0.5), Point (-0.5) (-0.5), Point (-0.5) 0.5]
