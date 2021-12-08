using UnityEngine;

public class SetShaderToPosition : MonoBehaviour
{
    public string variableName;

    private void Update()
    {
        Shader.SetGlobalVector(variableName, transform.position);
    }
}
