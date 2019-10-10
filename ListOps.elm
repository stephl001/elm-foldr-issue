module ListOps exposing (foldrc, foldrl)


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
