local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)

return {
	getData = function(p1)
		-- upvalues: validationEnumsModule (ref), boundsCalculatorModule (ref)
		local rootInstance = p1.rootInstance
		local renderMeshesData = p1.renderMeshesData
		
		if not renderMeshesData then
			return {}
		end
		local t = {}
		
		for i, v in rootInstance:GetChildren() do
			if v:IsA("MeshPart") then
				t[v.Name] = v
			end
		end
		local t_1 = {}
		
		for i_1, v_1 in renderMeshesData do
			local var1 = rootInstance:FindFirstChild(i_1, true)
			
			if var1 and v_1.editable then
				t_1[var1] = { MeshId = { created = false, instance = v_1.editable } }
			end
		end
		var4, i, var5 = boundsCalculatorModule.calculateIndividualFullBodyPartsData(t, {
			isServer = p1.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
			editableMeshes = t_1
		}, nil, false)
		
		return if var4 then var5 else {}
	end
}