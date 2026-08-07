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
	run = function(p0, p1) --[[ line: 29 ]]
		-- upvalues: getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref), getFIntFacsJointMaximumDistRatioDirectModule (ref), getFIntFacsJointMaximumDistRatioAccumulatedModule (ref)
		if not getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then return end
		local head = p1.renderMeshesData.Head
		local ok, status = pcall(function() --[[ line: 38 ]]
			-- upvalues: UGCValidationService (copy), head (ref)
			return UGCValidationService:GetMaximalJointDistancesWithinFacs(head.editable)
		end)
		
		if not ok then
			p0:fail(errorSourceStringsModule.Keys.DynHead_JointBoundsCheckFailed)
			
			return
		end
		local var7, var8, var9, var10 = unpack(status)
		
		if getFIntFacsJointMaximumDistRatioDirectModule() / 100 < var7 then
			p0:fail(errorSourceStringsModule.Keys.DynHead_JointDirectExceeded, { actionName = var8 })
		end
		if getFIntFacsJointMaximumDistRatioAccumulatedModule() / 100 < var9 then
			p0:fail(errorSourceStringsModule.Keys.DynHead_JointAccumulatedExceeded, { jointName = var10 })
		end
	end
}