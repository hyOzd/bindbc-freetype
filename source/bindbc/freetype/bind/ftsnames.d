
//          Copyright 2019 - 2021 Michael D. Parker
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freetype.bind.ftsnames;

import bindbc.freetype.config;
import bindbc.freetype.bind.freetype,
       bindbc.freetype.bind.fttypes;

struct FT_SfntName {
    FT_UShort platform_id;
    FT_UShort encoding_id;
    FT_UShort language_id;
    FT_UShort name_id;
    FT_Byte* string;
    FT_UInt string_len;
}

struct FT_SfntLangTag {
    FT_Byte* string_;
    FT_UInt string_len;
}

static if(staticBinding) {
	extern(C) @nogc nothrow {
        FT_UInt FT_Get_Sfnt_Name_Count(FT_Face face);
        FT_Error FT_Get_Sfnt_Name(FT_Face face, FT_UInt idx, FT_SfntName* aname);

        static if(ftSupport >= FTSupport.ft28) {
            FT_Error FT_Get_Sfnt_LangTag(FT_Face face, FT_UInt langID, FT_SfntLangTag* alangTag);
        }
    }
}
else {
    extern(C) @nogc nothrow {
        alias pFT_Get_Sfnt_Name_Count = FT_UInt function(FT_Face face);
        alias pFT_Get_Sfnt_Name = FT_Error function(FT_Face face, FT_UInt idx, FT_SfntName* aname);

        static if(ftSupport >= FTSupport.ft28) {
            alias pFT_Get_Sfnt_LangTag = FT_Error function(FT_Face face, FT_UInt langID, FT_SfntLangTag* alangTag);
        }
    }

    __gshared {
        pFT_Get_Sfnt_Name_Count FT_Get_Sfnt_Name_Count;
        pFT_Get_Sfnt_Name FT_Get_Sfnt_Name;

        static if(ftSupport >= FTSupport.ft28) {
            pFT_Get_Sfnt_LangTag FT_Get_Sfnt_LangTag;
        }
    }
}