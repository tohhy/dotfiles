import XMonad
import qualified XMonad.StackSet as W

import System.IO

import XMonad.Util.EZConfig
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.DragPane
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.EwmhDesktops

colorBlue      = "#857da9"
colorGreen     = "#88b986"
colorGray      = "#676767"
colorWhite     = "#d3d7cf"
colorGrayAlt   = "#313131"
colorNormalbg  = "#1a1e1b"

myLayout = (spacing 10 $ ResizableTall 1 (3/100) (3/5) [])
            |||  (spacing 2 $ (dragPane Horizontal (1/10) (1/2)))
            |||  (dragPane Vertical   (1/10) (1/2))

main :: IO ()
main = do
  wsbar <- spawnPipe myWsBar
  xmonad $ ewmh defaultConfig {
    modMask = mod4Mask
    , terminal = "urxvt"
    , logHook = myLogHook wsbar
                  >> setWMName "LG3D"
    , layoutHook = toggleLayouts (noBorders Full) $ avoidStruts $ myLayout
    , startupHook = setWMName "LG3D"
    }
    `additionalKeysP` myKeys

myKeys =
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
         | (key, scr)  <- zip "wer" [0,1,2] -- was [0..] *** change to match your screen order ***
         , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]

myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

myWsBar = "xmobar ~/.xmonad/xmobarrc"

wsPP = xmobarPP { ppOrder               = \(ws:l:t:_)   -> [ws,t]
                , ppCurrent             = xmobarColor   colorGreen       colorNormalbg
                , ppUrgent              = xmobarColor   colorWhite       colorNormalbg
                , ppVisible             = xmobarColor   colorWhite       colorNormalbg
                , ppHidden              = xmobarColor   colorWhite       colorNormalbg
                , ppHiddenNoWindows     = xmobarColor   colorGray        colorNormalbg
                , ppTitle               = xmobarColor   colorWhite       colorNormalbg
                , ppWsSep               = ""
                , ppSep                 = "  ::: "
                }
