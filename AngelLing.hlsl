if (_Enable) {
    half3 N_VD = vertex.Head;
    half3 B_VD = normalize(float3(0,1,0) - N_VD * N_VD.y * 0.9);
    half3 T_VD = cross(N_VD, B_VD);
    half3x3 TBN_VD = float3x3(T_VD, B_VD, N_VD);
    half2 uvMat = mul(TBN_VD, sd.N).xy;
    half2 uvMat_Detail = mul(TBN_VD, sd.N_detail).xy;

    // blend UV1
    float2 matcapBlendUV1 = float2(_AngelMatCapUV1X, _AngelMatCapUV1Y);
    uvMat = lerp(uvMat, saturate(vertex.uv[1].xy)*2-1, matcapBlendUV1);
    uvMat_Detail = lerp(uvMat_Detail, saturate(vertex.uv[1].xy)*2-1, matcapBlendUV1);

    // add offset\
    uvMat = uvMat + _AngelMatCap_ST.zw;
    uvMat_Detail = uvMat_Detail + _AngelMatCap_ST.zw;

    uvMat = uvMat * 0.5 + 0.5;
    uvMat_Detail = uvMat_Detail * 0.5 + 0,5;


    sd.add += SCSampleClamp(_AngelMatCap, lerp(uvMat, uvMat_Detail, _AngelMatCapDetail)).rgb * _AngelMatCapColor.rgb * sd.mask[_AngelMatCapMaskChannel] * _AngelMatCapColor.a;
}