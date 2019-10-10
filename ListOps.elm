module ListOps exposing (foldrc, foldrl)

{-
This foldrc function is an implementation of List.foldr using
continuation passing style (CPS). The recursive call on line 16
uses function composition. This function works fine and all tests
pass.
-}
foldrc : (a -> b -> b) -> b -> List a -> b
foldrc f acc =
    let
        loop cont l =
            case l of
                [] ->
                    cont acc

                x :: xs ->
                    loop (cont << f x) xs
    in
    loop identity


{-
This foldrl function is an implementation of List.foldr using
continuation passing style (CPS). The recursive call on line 38
uses a lambda expression. This function fails with a 
'RangeError: Maximum call stack size exceeded' error. Unless I am mistaken,
the two implementations are equivalent.
-}
foldrl : (a -> b -> b) -> b -> List a -> b
foldrl f acc =
    let
        loop cont l =
            case l of
                [] ->
                    cont acc

                x :: xs ->
                    loop (\racc -> cont (f x racc)) xs
    in
    loop identity
