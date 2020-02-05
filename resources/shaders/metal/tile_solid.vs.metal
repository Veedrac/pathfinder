// Automatically generated from files in pathfinder/shaders/. Do not edit!
#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct spvDescriptorSetBuffer0
{
    constant float2* uTileSize [[id(0)]];
    constant float4x4* uTransform [[id(1)]];
};

struct main0_out
{
    float2 vColorTexCoord [[user(locn0)]];
    float4 gl_Position [[position]];
};

struct main0_in
{
    uint2 aTessCoord [[attribute(0)]];
    int2 aTileOrigin [[attribute(1)]];
    float2 aColorTexCoord [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float2 position = float2(in.aTileOrigin + int2(in.aTessCoord)) * (*spvDescriptorSet0.uTileSize);
    out.vColorTexCoord = in.aColorTexCoord;
    out.gl_Position = (*spvDescriptorSet0.uTransform) * float4(position, 0.0, 1.0);
    return out;
}

