{-# LANGUAGE OverloadedStrings #-}
module Application where

import Network.Wai
import Network.HTTP.Types (status200, status404)
import qualified Data.ByteString.Lazy.Char8 as B
import qualified Data.Text as T

homePage :: Application
homePage _ respond = respond $
  responseLBS status200 [("Content-Type", "text/plain")] "Hello World"

postPost _ respond = respond $
  responseLBS status200 [("Content-Type", "text/plain")] "Posted!"

whoa :: T.Text -> Application
whoa arg _ respond 
  | arg == T.empty = respond $
    responseLBS status200 [("Content-Type", "application/json")] $ "{\"arg\":\"Y U NO?\", \"hello\": 42}"
  | otherwise = respond $
    responseLBS status200 [("Content-Type", "application/json")] $ B.concat ["{\"arg\":", B.pack (show arg), ", \"hello\": 42}"]

notFound404 _ respond = respond $
  responseLBS status404 [("Content-Type", "text/plain")] "NOT FOUND!!!"
