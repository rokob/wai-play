{-# LANGUAGE OverloadedStrings #-}
import Network.Wai.Handler.Warp (run)
import Network.Wai.Dispatch (dispatch)
import Application
import Routes

main = run 3000 $ dispatch notFound404 routes
