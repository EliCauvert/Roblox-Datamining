local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local analyticsModule = require(parent.Analytics)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)

local function formatError(p0, p1, p2)
	local function _(p3)
		return p3.fullName .. "." .. p3.fieldName
	end
	
	return string.format("%s is more than max difference %.2f in size compared to the other mesh %s. You need to edit the model to adjust its size", p0.fullName .. "." .. p0.fieldName, p2, p1.fullName .. "." .. p1.fieldName)
end

return function(p4, p5, p6, p7)
	-- upvalues: getMeshMinMaxModule (ref), analyticsModule (ref), formatError (ref)
	local var3, var4, var5, var6 = getMeshMinMaxModule(p4, p7)
	
	if not var3 then
		return var3, var4
	end
	local var7, var8, var9, var10 = getMeshMinMaxModule(p5, p7)
	
	if not var7 then
		return var7, var8
	elseif p6 < (var5 - var9).Magnitude or p6 < (var6 - var10).Magnitude then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshComparison, nil, p7)
		
		return false, { formatError(p4, p5, p6) }
	end
	return true
end