import Vision.GUI
import ImagProc
 
main = run $ transUI f >>> freqMonitor
 
f :: VCN Channels ImageRGB
f = return $ \cam -> do
    x <- cam
    let r = rgb x
    print (size r)
    return r
