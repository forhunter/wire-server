{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

module V47 (migration) where

import Cassandra.Schema
import Text.RawString.QQ

migration :: Migration
migration = Migration 47 "Create and populate prefix table" $
    schema' [r|
        create table if not exists service_prefix
        ( prefix text
        , name text
        , service uuid
        , provider uuid
        , primary key (prefix, name)
        )
    |]
