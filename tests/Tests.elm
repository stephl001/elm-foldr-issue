module Tests exposing (tests)

import Expect
import ListOps exposing (foldrc, foldrl)
import Test exposing (..)


tests : Test
tests =
    describe "List Ops"
        [ describe "foldr with composition"
            [ test "empty list" <|
                \() -> Expect.equal 0 (ListOps.foldrc (-) 0 [])
            , test "single element list" <|
                \() -> Expect.equal 5 (ListOps.foldrc (-) 0 [5])
            , test "non-empty list" <|
                \() -> Expect.equal -5 (ListOps.foldrc (-) 0 (List.range 1 10))
            , test "direction" <|
                \() -> Expect.equal (List.range 1 4) (ListOps.foldrc (::) [] (List.range 1 4))
            ]
        , describe "foldr with lambda"
            [ test "empty list" <|
                \() -> Expect.equal 0 (ListOps.foldrl (-) 0 [])
            , test "single element list" <|
                \() -> Expect.equal 5 (ListOps.foldrl (-) 0 [5])
            , test "non-empty list" <|
                \() -> Expect.equal -5 (ListOps.foldrl (-) 0 (List.range 1 10))
            , test "direction" <|
                \() -> Expect.equal (List.range 1 4) (ListOps.foldrl (::) [] (List.range 1 4))
            ]
        ]
