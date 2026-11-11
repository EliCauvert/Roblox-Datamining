local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local GetFIntFacsJointMaximumDistRatioDirectModule = require(Parent.flags.getFIntFacsJointMaximumDistRatioDirect)
local GetFIntFacsJointMaximumDistRatioAccumulatedModule = require(Parent.flags.getFIntFacsJointMaximumDistRatioAccumulated)
local _ = require(Parent.util.Types)

return function(p1, p2)
	-- upvalues: PcallDeferredModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy), AnalyticsModule (copy), GetFIntFacsJointMaximumDistRatioDirectModule (copy), GetFIntFacsJointMaximumDistRatioAccumulatedModule (copy)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: GetEditableMeshFromContextModule (upval), p1 (copy), p2 (copy), UGCValidationService (upval)
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if not MeshId then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:GetMaximalJointDistancesWithinFacs(MeshId2)
	end, p2)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateFACSJointTransformsWithinBounds_Error, nil, p2)
		
		return false, {
			"Failed to validate facial animation joint bounds, please try again later"
		}
	end
	local Unpacked, Unpacked2, Unpacked3, Unpacked4 = unpack(PcallDeferredModuleResult2)
	
	if GetFIntFacsJointMaximumDistRatioDirectModule() / 100 < Unpacked then
		return false, {
			`Head facial animation {Unpacked2} results in joints being moved substantially outside of the head. Please edit your facial animations and try again.`
		}
	elseif GetFIntFacsJointMaximumDistRatioAccumulatedModule() / 100 < Unpacked3 then
		return false, {
			`Head facial animations can be combined to extend the joint {Unpacked4} far outside the head. Please edit your facial animations and try again.`
		}
	else
		return true
	end
end