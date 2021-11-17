// German explanation: https://www.notion.so/kristinawaldt/b926d68ed8704a418a9d3594a4badc5c#d60fa78cce3143949c82cd89402c3a5c

Shader "Unlit/OnlyOutline"
{
    Properties
    {
        // Reference(Pretty Name, Variablentyp) = Default
        
        [HDR]
        _Color ("Color", Color) = (1,1,1,1)
        _Thickness ("Thickness", float) = 0.1
    }
    
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Cull Front

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            fixed4 _Color;
            half _Thickness;

            v2f vert (appdata v)
            {
                v2f o;
                float3 normal = normalize(v.normal);
                float3 outlineOffset = normal * _Thickness * 0.01;
                o.vertex = UnityObjectToClipPos(v.vertex + outlineOffset);
                // o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = _Color;
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}
