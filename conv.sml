
structure Conv =
struct

val r2w = Unsafe.realToBits

fun w2r w =
  let
    val arr = Word8Array.array (8, 0w0)
  in
    PackWord64Big.update (arr, 0, w);
    PackReal64Little.subArr (arr, 0)
  end

end
