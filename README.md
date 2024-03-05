
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

My machine:


    $ neofetch

                .-/+oossssoo+/-.               ssoss@Skyes-Laptop
            `:+ssssssssssssssssss+:`           ------------------
          -+ssssssssssssssssssyyssss+-         OS: Ubuntu 22.04.4 LTS on Windows 10 x86_64
        .ossssssssssssssssssdMMMNysssso.       Kernel: 5.15.146.1-microsoft-standard-WSL2
       /ssssssssssshdmmNNmmyNMMMMhssssss/      Uptime: 3 days, 12 hours, 23 mins
      +ssssssssshmydMMMMMMMNddddyssssssss+     Packages: 2638 (dpkg)
     /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/    Shell: bash 5.1.16
    .ssssssssdMMMNhsssssssssshNMMMdssssssss.   Theme: Adwaita [GTK3]
    +sssshhhyNMMNyssssssssssssyNMMMysssssss+   Icons: Adwaita [GTK3]
    ossyNMMMNyMMhsssssssssssssshmmmhssssssso   Terminal: Windows Terminal
    ossyNMMMNyMMhsssssssssssssshmmmhssssssso   CPU: 11th Gen Intel i5-1135G7 (8) @ 2.419GHz
    +sssshhhyNMMNyssssssssssssyNMMMysssssss+   GPU: 76c6:00:00.0 Microsoft Corporation Device 008e
    .ssssssssdMMMNhsssssssssshNMMMdssssssss.   Memory: 553MiB / 7800MiB
     /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/
      +sssssssssdmydMMMMMMMMddddyssssssss+
       /ssssssssssshdmNNNNmyNMMMMhssssss/
        .ossssssssssssssssssdMMMNysssso.
          -+sssssssssssssssssyyyssss+-
            `:+ssssssssssssssssss+:`
                .-/+oossssoo+/-.

