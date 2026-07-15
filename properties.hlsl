SC_uint(_Enable, 0, [SCInHeader][SCToggle][SCConstValue(1,pixel)], "", "")

SC_Box
SC_color(_AngelMatCapColor, (1,1,1,1), [SCCache], "", "")
SC_Texture2D(_AngelMatCap, "black", [], "AngelLing MatCap", "")
SC_ScaleOffset(_AngelMatCap)
SC_float(_AngelMatCapDetail, 1, [SCRange(0,1)], "Detail Normal", "")
SC_uint(_AngelMatCapMaskChannel, 3, [SCMaskChannel], "__MaskChannel", "")
SC_float(_AngelMatCapUV1X, 0, [SCRange(0,1)], "UV1: x", "")
SC_float(_AngelMatCapUV1Y, 0, [SCRange(0, 1)], "UV1: y", "")
SC_BoxEnd