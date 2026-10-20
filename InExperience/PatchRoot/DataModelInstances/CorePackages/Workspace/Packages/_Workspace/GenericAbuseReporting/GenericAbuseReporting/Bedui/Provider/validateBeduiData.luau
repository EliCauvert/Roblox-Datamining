local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local TModule = require(GenericAbuseReporting.Parent.t)
local BeduiDataTypeInterface = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).BeduiDataTypeInterface

local function _(p1, p2)
	-- upvalues: TModule (copy)
	return TModule.interface(p2)(p1)
end

local function validateStepId(p1)
	local Flag = false
	local List = {}
	
	for _, node in p1.nodes do
		if node.stepId == p1.rootStepId then
			if Flag then
				return false, "Bedui data contains multiple steps with the same rootStepId"
			end
			Flag = true
		end
		if table.find(List, node.stepId) then
			return false, "Bedui data contains duplicate stepId: " .. tostring(node.stepId)
		end
		table.insert(List, node.stepId)
	end
	if Flag then
		return true, nil
	else
		return false, "Bedui data does not contain a step with the rootStepId"
	end
end

return function(p2)
	-- upvalues: BeduiDataTypeInterface (copy), TModule (copy), validateStepId (copy)
	if p2 == nil then
		return false, "Bedui data is nil"
	elseif TModule.interface(BeduiDataTypeInterface)(p2) then
		return validateStepId(p2)
	else
		return false, "Bedui data does not conform to the expected structure"
	end
end