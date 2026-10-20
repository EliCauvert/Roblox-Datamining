local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local BoundsCalculatorModule = require(Parent.util.BoundsCalculator)

return {
	getData = function(p1)
		-- upvalues: ValidationEnumsModule (copy), BoundsCalculatorModule (copy)
		local RootInstance = p1.rootInstance
		local RenderMeshesData = p1.renderMeshesData
		
		if not RenderMeshesData then
			return {}
		end
		local Parts = {}
		
		for _, Part in RootInstance:GetChildren() do
			if Part:IsA("MeshPart") then
				Parts[Part.Name] = Part
			end
		end
		local EditableMeshes = {}
		
		for ChildName, value in RenderMeshesData do
			local Child = RootInstance:FindFirstChild(ChildName, true)
			
			if Child and value.editable then
				EditableMeshes[Child] = { MeshId = { created = false, instance = value.editable } }
			end
		end
		local IndividualFullBodyPartsData, _, IndividualFullBodyPartsData3 = BoundsCalculatorModule.calculateIndividualFullBodyPartsData(Parts, {
			isServer = p1.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend,
			editableMeshes = EditableMeshes
		}, nil, false)
		
		return if IndividualFullBodyPartsData then IndividualFullBodyPartsData3 else {}
	end
}