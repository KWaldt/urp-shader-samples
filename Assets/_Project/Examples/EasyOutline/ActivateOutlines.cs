using UnityEngine;

namespace KristinaWaldt
{
	public class ActivateOutlines : MonoBehaviour
	{
		[SerializeField] private Material outlineMaterial;
		private MeshRenderer meshRenderer;

		private Material[] origMaterials;

		private void Awake()
		{
			meshRenderer = GetComponent<MeshRenderer>();
		}

		private void OnEnable()
		{
			origMaterials = meshRenderer.materials;
			var newMaterials = new Material[origMaterials.Length + 1];
			for (int i = 0; i < newMaterials.Length; i++)
			{
				if (i < newMaterials.Length - 1)
				{
					newMaterials[i] = origMaterials[i];
					continue;
				}

				newMaterials[i] = outlineMaterial;
			}
			meshRenderer.materials = newMaterials;
		}

		private void OnDisable()
		{
			meshRenderer.materials = origMaterials;
		}
	}
}