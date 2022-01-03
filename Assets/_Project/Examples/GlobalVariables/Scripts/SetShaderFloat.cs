using System;
using UnityEngine;

public class SetShaderFloat : MonoBehaviour
{
    public string variableName;
    
    [ContextMenuItem("Update Value", nameof(UpdateValue))]
    public float value;

    private void OnValidate()
    {
        UpdateValue();
    }

    public void UpdateValue()
    {
        Shader.SetGlobalFloat(variableName, value);
    }
}
