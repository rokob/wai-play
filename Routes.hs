{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module Routes where

import Application
import Control.Monad (ap)
import Data.Text (pack)
import Web.PathPieces (fromPathPiece, fromPathMultiPiece)
import Yesod.Routes.Dispatch (Route(..), Piece(Static, Dynamic))

routes  = [
		Route {
			rhPieces = [Static (pack "GET")],
			rhHasMulti = False,
			rhDispatch = (\(_:_) -> return (homePage ))
		},
		Route {
			rhPieces = [Static (pack "POST")],
			rhHasMulti = False,
			rhDispatch = (\(_:_) -> return (postPost ))
		},
		Route {
			rhPieces = [Static (pack "GET"),Static (pack "shit"),Dynamic],
			rhHasMulti = False,
			rhDispatch = (\(_:_:val0:_) -> return (whoa ) `ap` (fromPathPiece val0))
		}
	]
