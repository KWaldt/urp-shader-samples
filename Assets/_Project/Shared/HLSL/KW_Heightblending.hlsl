#ifndef KWHEIGHTBLENDING_INCLUDED
#define KWHEIGHTBLENDING_INCLUDED

// FORMULA BASED ON: http://untitledgam.es/2017/01/height-blending-shader/

float4 Heightblend(float factor, float4 input1, float height1, float4 input2, float height2)
{
    float height_start = max(height1, height2) - factor;
    float level1 = max(height1 - height_start, 0);
    float level2 = max(height2 - height_start, 0);
    return ((input1 * level1) + (input2 * level2)) / (level1 + level2);
}

void Heightblend_float(float factor, float4 input1, float height1, float4 input2, float height2, out float4 output)
{
    output = Heightblend(factor, input1, height1, input2, height2);
}

void Heightlerp_float(float factor, float4 input1, float height1, float4 input2, float height2, float t, out float4 output)
{
    t = clamp(t, 0, 1);
    output = Heightblend(factor, input1, height1 * (1 - t), input2, height2 * t);
}

#endif