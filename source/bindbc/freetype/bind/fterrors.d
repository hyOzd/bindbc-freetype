
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.fterrors;

import bindbc.freetype.bind.fttypes;

version(BindFT_Static) {
	extern(C) @nogc nothrow {
        const(char)* FT_Error_String(FT_Error error_code);
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Error_String = const(char)* function(FT_Error error_code);
    }

    __gshared {
        pFT_Error_String FT_Error_String;
    }
}