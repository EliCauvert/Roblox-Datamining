local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getFIntFacsJointMaximumDistRatioDirectModule = require(parent.flags.getFIntFacsJointMaximumDistRatioDirect)
local getFIntFacsJointMaximumDistRatioAccumulatedModule = require(parent.flags.getFIntFacsJointMaximumDistRatioAccumulated)
local _ = require(parent.util.Types)

return function(p0, p1)
	-- upvalues: pcallDeferredModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref), analyticsModule (ref), getFIntFacsJointMaximumDistRatioDirectModule (ref), getFIntFacsJointMaximumDistRatioAccumulatedModule (ref)
	local var6, var7 = pcallDeferredModule(function()
		-- upvalues: getEditableMeshFromContextModule (copy), p0 (ref), p1 (ref), UGCValidationService (copy)
		local var12, var13 = getEditableMeshFromContextModule(p0, "MeshId", p1)
		
		if not var12 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:GetMaximalJointDistancesWithinFacs(var13)
	end, p1)
	
	if not var6 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateFACSJointTransformsWithinBounds_Error, nil, p1)
		
		return false, {
			"Failed to validate facial animation joint bounds, please try again later"
		}
	end
	local var8, var9, var10, var11 = unpack(var7)
	
	if getFIntFacsJointMaximumDistRatioDirectModule() / 100 < var8 then
		return false, {
			`Head facial animation {var9} results in joints being moved substantially outside of the head. Please edit your facial animations and try again.`
		}
	elseif getFIntFacsJointMaximumDistRatioAccumulatedModule() / 100 < var10 then
		return false, {
			`Head facial animations can be combined to extend the joint {var11} far outside the head. Please edit your facial animations and try again.`
		}
	end
	return true
end