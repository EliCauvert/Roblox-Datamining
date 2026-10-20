local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntFacsJointMaximumDistRatioDirectModule = require(Parent.flags.getFIntFacsJointMaximumDistRatioDirect)
local GetFIntFacsJointMaximumDistRatioAccumulatedModule = require(Parent.flags.getFIntFacsJointMaximumDistRatioAccumulated)
local GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule = require(Parent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)

return {
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	prereqTests = {
		ValidationEnumsModule.ValidationModule.DynamicHeadFacsPresent
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule (copy), UGCValidationService (copy), ErrorSourceStringsModule (copy), GetFIntFacsJointMaximumDistRatioDirectModule (copy), GetFIntFacsJointMaximumDistRatioAccumulatedModule (copy)
		if not GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then return end
		local Head = p2.renderMeshesData.Head
		local Success, Result = pcall(function()
			-- upvalues: UGCValidationService (upval), Head (copy)
			return UGCValidationService:GetMaximalJointDistancesWithinFacs(Head.editable)
		end)
		
		if not Success then
			p1:fail(ErrorSourceStringsModule.Keys.DynHead_JointBoundsCheckFailed)
			
			return
		end
		local Unpacked, Unpacked2, Unpacked3, Unpacked4 = unpack(Result)
		
		if GetFIntFacsJointMaximumDistRatioDirectModule() / 100 < Unpacked then
			p1:fail(ErrorSourceStringsModule.Keys.DynHead_JointDirectExceeded, { actionName = Unpacked2 })
		end
		if GetFIntFacsJointMaximumDistRatioAccumulatedModule() / 100 < Unpacked3 then
			p1:fail(ErrorSourceStringsModule.Keys.DynHead_JointAccumulatedExceeded, { jointName = Unpacked4 })
		end
	end
}