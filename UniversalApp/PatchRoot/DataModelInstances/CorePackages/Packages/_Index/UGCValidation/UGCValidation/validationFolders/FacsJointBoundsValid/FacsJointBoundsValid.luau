local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateDynamicHeadDataModule = require(parent.flags.getFFlagUGCValidateMigrateDynamicHeadData)
local getFIntFacsJointMaximumDistRatioDirectModule = require(parent.flags.getFIntFacsJointMaximumDistRatioDirect)
local getFIntFacsJointMaximumDistRatioAccumulatedModule = require(parent.flags.getFIntFacsJointMaximumDistRatioAccumulated)
local getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule = require(parent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)

return {
	fflag = getFFlagUGCValidateMigrateDynamicHeadDataModule,
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	prereqTests = {
		validationEnumsModule.ValidationModule.DynamicHeadFacsPresent
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref), getFIntFacsJointMaximumDistRatioDirectModule (ref), getFIntFacsJointMaximumDistRatioAccumulatedModule (ref)
		if not getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then return end
		local head = p2.renderMeshesData.Head
		local ok, status = pcall(function()
			-- upvalues: UGCValidationService (copy), head (ref)
			return UGCValidationService:GetMaximalJointDistancesWithinFacs(head.editable)
		end)
		
		if not ok then
			p1:fail(errorSourceStringsModule.Keys.DynHead_JointBoundsCheckFailed)
			
			return
		end
		local var1, var2, var3, var4 = unpack(status)
		
		if getFIntFacsJointMaximumDistRatioDirectModule() / 100 < var1 then
			p1:fail(errorSourceStringsModule.Keys.DynHead_JointDirectExceeded, { actionName = var2 })
		end
		if getFIntFacsJointMaximumDistRatioAccumulatedModule() / 100 < var3 then
			p1:fail(errorSourceStringsModule.Keys.DynHead_JointAccumulatedExceeded, { jointName = var4 })
		end
	end
}