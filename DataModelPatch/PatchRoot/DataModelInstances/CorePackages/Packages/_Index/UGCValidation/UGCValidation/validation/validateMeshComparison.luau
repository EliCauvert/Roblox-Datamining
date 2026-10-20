local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AnalyticsModule = require(Parent.Analytics)
local GetMeshMinMaxModule = require(Parent.util.getMeshMinMax)

local function formatError(p1, p2, p3): string
	local function _(p4): string
		return p4.fullName .. "." .. p4.fieldName
	end
	
	return string.format("%s is more than max difference %.2f in size compared to the other mesh %s. You need to edit the model to adjust its size", p1.fullName .. "." .. p1.fieldName, p3, p2.fullName .. "." .. p2.fieldName)
end

return function(p1, p2, p3, p4)
	-- upvalues: GetMeshMinMaxModule (copy), AnalyticsModule (copy), formatError (copy)
	local MeshMinMaxModule, MeshMinMaxModule2, MeshMinMaxModule3, MeshMinMaxModule4 = GetMeshMinMaxModule(p1, p4)
	
	if not MeshMinMaxModule then
		return MeshMinMaxModule, MeshMinMaxModule2
	end
	local MeshMinMaxModule1, MeshMinMaxModule2_1, MeshMinMaxModule3_1, MeshMinMaxModule4_1 = GetMeshMinMaxModule(p2, p4)
	
	if not MeshMinMaxModule1 then
		return MeshMinMaxModule1, MeshMinMaxModule2_1
	elseif p3 < (MeshMinMaxModule3 - MeshMinMaxModule3_1).Magnitude or p3 < (MeshMinMaxModule4 - MeshMinMaxModule4_1).Magnitude then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMeshComparison, nil, p4)
		
		return false, { formatError(p1, p2, p3) }
	else
		return true
	end
end