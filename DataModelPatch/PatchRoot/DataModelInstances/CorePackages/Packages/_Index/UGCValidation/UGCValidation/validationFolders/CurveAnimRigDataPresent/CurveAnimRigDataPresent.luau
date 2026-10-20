local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local GetFFlagUGCValidateEmotesBonesAllowedModule = require(Parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local GetFFlagUGCValidateCurveAnimRigDataR15PlusModule = require(Parent.flags.getFFlagUGCValidateCurveAnimRigDataR15Plus)
local GetEngineFeatureIsValidR15PlusModule = require(Parent.flags.getEngineFeatureIsValidR15Plus)
local CurveAnimRigDataPresentModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimRigDataPresentModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimRigDataPresentModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
CurveAnimRigDataPresentModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimRigDataPresentModule.expectedFailures = {}
CurveAnimRigDataPresentModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function CurveAnimRigDataPresentModule.run(p1, p2)
	-- upvalues: ErrorSourceStringsModule (copy), GetFFlagUGCValidateEmotesBonesAllowedModule (copy), CurveAnimBoneHierarchyUtilsModule (copy), GetFFlagUGCValidateCurveAnimRigDataR15PlusModule (copy), GetEngineFeatureIsValidR15PlusModule (copy)
	for _, curveAnimation in p2.curveAnimations do
		local Count = 0
		
		for _, AnimationRigData in curveAnimation:GetChildren() do
			if AnimationRigData:IsA("AnimationRigData") then
				Count += 1
				
				if Count > 1 then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_MultipleRigData)
					break
				end
			end
		end
		if Count == 0 then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NoRigData)
			break
		end
		if GetFFlagUGCValidateEmotesBonesAllowedModule() and CurveAnimBoneHierarchyUtilsModule.hasBoneFolders(curveAnimation) then
			if GetFFlagUGCValidateCurveAnimRigDataR15PlusModule() and GetEngineFeatureIsValidR15PlusModule() then
				for _, AnimationRigData1 in curveAnimation:GetChildren() do
					if AnimationRigData1:IsA("AnimationRigData") and not AnimationRigData1:IsValidR15Plus() then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidRigDataR15Plus)
						break
					end
				end
			end
		else
			for _, AnimationRigData2 in curveAnimation:GetChildren() do
				if AnimationRigData2:IsA("AnimationRigData") and not AnimationRigData2:IsValidR15() then
					p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidRigData)
					break
				end
			end
		end
	end
end

return CurveAnimRigDataPresentModule