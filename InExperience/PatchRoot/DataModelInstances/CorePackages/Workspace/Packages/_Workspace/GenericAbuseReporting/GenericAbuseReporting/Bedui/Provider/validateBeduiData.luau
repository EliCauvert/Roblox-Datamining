local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local tModule = require(genericAbuseReporting.Parent.t)
local beduiDataTypeInterface = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).BeduiDataTypeInterface

local function _(p0, p1)
	-- upvalues: tModule (ref)
	return tModule.interface(p1)(p0)
end

local function validateStepId(p2)
	local var3 = false
	local t = {}
	
	for i, v in p2.nodes do
		if v.stepId == p2.rootStepId then
			if not var3 then
				var3 = true
			end
			return false, "Bedui data contains multiple steps with the same rootStepId"
		end
		if not table.find(t, v.stepId) then
			table.insert(t, v.stepId)
			continue
		end
		return false, "Bedui data contains duplicate stepId: " .. tostring(v.stepId)
	end
	if var3 then
		return true, nil
	end
	return false, "Bedui data does not contain a step with the rootStepId"
end

return function(p3)
	-- upvalues: beduiDataTypeInterface (ref), tModule (ref), validateStepId (ref)
	if p3 == nil then
		return false, "Bedui data is nil"
	elseif tModule.interface(beduiDataTypeInterface)(p3) then
		return validateStepId(p3)
	end
	return false, "Bedui data does not conform to the expected structure"
end