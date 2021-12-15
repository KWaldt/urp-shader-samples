float GetLightIntensity(float3 color)
{
    return max(color.r, max(color.g, color.b));
}

void CustomLighting_float(float3 WorldPos, out float3 Direction, out float3 Color, out float Attenuation)
{
    #ifdef SHADERGRAPH_PREVIEW
        Direction = half3(0.5, 0.5, 0);
        Color = 1;
        Attenuation = 1;
    #else

        #if SHADOWS_SCREEN
            half4 clipPos = TransformWorldToHClip(WorldPos);
            half4 shadowCoord = ComputeScreenPos(clipPos);
        #else
            half4 shadowCoord = TransformWorldToShadowCoord(WorldPos);
        #endif 

        Light light = GetMainLight(shadowCoord);
        Direction = light.direction;
        Color = light.color;
        
        // Attenuation = light.shadowAttenuation * light.distanceAttenuation * GetLightIntensity(light.color); // From MinipnsArt
        Attenuation = light.shadowAttenuation;
    #endif
}