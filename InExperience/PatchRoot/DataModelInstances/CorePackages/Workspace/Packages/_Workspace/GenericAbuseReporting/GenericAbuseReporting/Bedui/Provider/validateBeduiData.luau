local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local tModule = require(genericAbuseReporting.Parent.t)
local beduiDataTypeInterface = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).BeduiDataTypeInterface

local function _(p1, p2)
	-- upvalues: tModule (ref)
	return tModule.interface(p2)(p1)
end

local function validateStepId(p1)
	local var1 = false
	local t = {}
	
	for i, v in p1.nodes do
		if v.stepId == p1.rootStepId then
			if not var1 then
				var1 = true
			end
			return false, "Bedui data contains multiple steps with the same rootStepId"
		end
		if not table.find(t, v.stepId) then
			table.insert(t, v.stepId)
			continue
		end
		return false, "Bedui data contains duplicate stepId: " .. tostring(v.stepId)
	end
	if var1 then
		return true, nil
	end
	return false, "Bedui data does not contain a step with the rootStepId"
end

return function(p2)
	-- upvalues: beduiDataTypeInterface (ref), tModule (ref), validateStepId (ref)
	if p2 == nil then
		return false, "Bedui data is nil"
	elseif tModule.interface(beduiDataTypeInterface)(p2) then
		return validateStepId(p2)
	end
	return false, "Bedui data does not conform to the expected structure"
end