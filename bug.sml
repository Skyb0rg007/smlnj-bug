
structure Bug =
struct

val size = 99999

val lst = List.tabulate (size, fn i =>
  let
    val w = 0wxdeadbeef
    val r = Conv.w2r w
    val w' = Unsafe.realToBits r
  in
    if w = w' then ()
      else raise Fail
        ("ERROR: " ^ Int.toString i
             ^ " " ^ Word64.toString w
             ^ " " ^ Word64.toString w');
    (w, r)
  end)

end
