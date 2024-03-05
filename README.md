
# SML/NJ Bug

This seems to be an issue with `PackWord64Big.update`.

To replicate:

    $ make clean
    rm -f -r .cm

    $ make build
    echo "CM.make \"sources.cm\";" | sml
    Standard ML of New Jersey (64-bit) v110.99.4 [built: Sun Oct 01 21:41:27 2023]
    - [autoloading]
    [library $smlnj/cm/cm.cm is stable]
    [library $smlnj/internal/cm-sig-lib.cm is stable]
    [library $/pgraph.cm is stable]
    [library $smlnj/internal/srcpath-lib.cm is stable]
    [library $SMLNJ-BASIS/basis.cm is stable]
    [library $SMLNJ-BASIS/(basis.cm):basis-common.cm is stable]
    [autoloading done]
    [scanning sources.cm]
    [parsing (sources.cm):conv.sml]
    [creating directory .cm/SKEL]
    [parsing (sources.cm):bug.sml]
    [compiling (sources.cm):conv.sml]
    [creating directory .cm/GUID]
    [creating directory .cm/amd64-unix]
    [code: 625, data: 1, env: 296 bytes]
    [compiling (sources.cm):bug.sml]
    [code: 2008, data: 64, env: 236 bytes]
    [New bindings added.]
    val it = true : bool
    -

    $ make build
    echo "CM.make \"sources.cm\";" | sml
    Standard ML of New Jersey (64-bit) v110.99.4 [built: Sun Oct 01 21:41:27 2023]
    - [autoloading]
    [library $smlnj/cm/cm.cm is stable]
    [library $smlnj/internal/cm-sig-lib.cm is stable]
    [library $/pgraph.cm is stable]
    [library $smlnj/internal/srcpath-lib.cm is stable]
    [library $SMLNJ-BASIS/basis.cm is stable]
    [library $SMLNJ-BASIS/(basis.cm):basis-common.cm is stable]
    [autoloading done]
    [scanning sources.cm]
    [loading (sources.cm):conv.sml]
    [loading (sources.cm):bug.sml]
    [New bindings added.]
    val it = true : bool
    -

    $ make build
    echo "CM.make \"sources.cm\";" | sml
    Standard ML of New Jersey (64-bit) v110.99.4 [built: Sun Oct 01 21:41:27 2023]
    - [autoloading]
    [library $smlnj/cm/cm.cm is stable]
    [library $smlnj/internal/cm-sig-lib.cm is stable]
    [library $/pgraph.cm is stable]
    [library $smlnj/internal/srcpath-lib.cm is stable]
    [library $SMLNJ-BASIS/basis.cm is stable]
    [library $SMLNJ-BASIS/(basis.cm):basis-common.cm is stable]
    [autoloading done]
    [scanning sources.cm]
    [loading (sources.cm):conv.sml]
    [loading (sources.cm):bug.sml]
    sources.cm:6.3-6.10 Error: link-time exception in user program (sources.cm):bug.sml
      Fail: ERROR: 2858 DEADBEEF 7F7D5654A380bug.sml:14.18-17.41


    -
