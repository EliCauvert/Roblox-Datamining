local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getFIntFacsJointMaximumDistRatioDirectModule = require(parent.flags.getFIntFacsJointMaximumDistRatioDirect)
local getFIntFacsJointMaximumDistRatioAccumulatedModule = require(parent.flags.getFIntFacsJointMaximumDistRatioAccumulated)
local _ = require(parent.util.Types)

return function(p1, p2)
	-- upvalues: pcallDeferredModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntFacsJointMaximumDistRatioDirectModule (ref), getFIntFacsJointMaximumDistRatioAccumulatedModule (ref)
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: getEditableMeshFromContextModule (copy), p1 (ref), p2 (ref), UGCValidationService (copy)
		local var3, var4 = getEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if not var3 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:GetMaximalJointDistancesWithinFacs(var4)
	end, p2)
	
	if not var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateFACSJointTransformsWithinBounds_Error, nil, p2)
		
		return false, {
			"Failed to validate facial animation joint bounds, please try again later"
		}
	end
	local var3, var4, var5, var6 = unpack(var2)
	
	if getFIntFacsJointMaximumDistRatioDirectModule() / 100 < var3 then
		return false, {
			`Head facial animation {var4} results in joints being moved substantially outside of the head. Please edit your facial animations and try again.`
		}
	elseif getFIntFacsJointMaximumDistRatioAccumulatedModule() / 100 < var5 then
		return false, {
			`Head facial animations can be combined to extend the joint {var6} far outside the head. Please edit your facial animations and try again.`
		}
	end
	return true
end