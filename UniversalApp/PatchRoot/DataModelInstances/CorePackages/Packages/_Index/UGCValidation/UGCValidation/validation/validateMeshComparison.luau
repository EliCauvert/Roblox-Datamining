local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)

local function formatError(p1, p2, p3)
	local function _(p4)
		return p4.fullName .. "." .. p3.fieldName
	end
	
	return string.format("%s is more than max difference %.2f in size compared to the other mesh %s. You need to edit the model to adjust its size", p1.fullName .. "." .. p0.fieldName, p3, p2.fullName .. "." .. p1.fieldName)
end

return function(p1, p2, p3, p4)
	-- upvalues: getMeshMinMaxModule (ref), analyticsModule (ref), formatError (ref)
	local var1, var2, var3, var4 = getMeshMinMaxModule(p1, p4)
	
	if not var1 then
		return var1, var2
	end
	local var5, var6, var7, var8 = getMeshMinMaxModule(p2, p4)
	
	if not var5 then
		return var5, var6
	elseif p3 < (var3 - var7).Magnitude or p3 < (var4 - var8).Magnitude then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshComparison, nil, p4)
		
		return false, { formatError(p1, p2, p3) }
	end
	return true
end