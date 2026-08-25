local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local curveAnimTranslationUtilsModule = require(parent.util.CurveAnimTranslationUtils)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateAnimBonesSupportModule = require(parent.flags.getFFlagUGCValidateAnimBonesSupport)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidateAnimTranslationThresholdModule = require(parent.flags.getFFlagUGCValidateAnimTranslationThreshold)
local UGCValidateBoneTranslationMaxDistanceHundredths = game:DefineFastInt("UGCValidateBoneTranslationMaxDistanceHundredths", 50)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidateAnimBonesSupportModule() and getFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData }

function t.fflag()
	-- upvalues: getFFlagUGCValidateEmotesBonesAllowedModule (ref), getFFlagUGCValidateAnimBonesSupportModule (ref)
	return getFFlagUGCValidateEmotesBonesAllowedModule() or getFFlagUGCValidateAnimBonesSupportModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p0, p1)
	-- upvalues: UGCValidateBoneTranslationMaxDistanceHundredths (ref), curveAnimBoneHierarchyUtilsModule (ref), getFFlagUGCValidateAnimTranslationThresholdModule (ref), curveAnimTranslationUtilsModule (ref), errorSourceStringsModule (ref)
	local var10 = UGCValidateBoneTranslationMaxDistanceHundredths / 100
	
	for i, v in p1.curveAnimations do
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
				if getFFlagUGCValidateAnimTranslationThresholdModule() then
					local var11, var12 = curveAnimTranslationUtilsModule.translationExceedsThreshold(v_1, var10)
					
					if var11 then
						p0:fail(errorSourceStringsModule.Keys.CurveAnim_BoneTranslationExceedsThreshold, {
							boneName = v_1.Name,
							distance = string.format("%.3f", var12),
							maxDistance = string.format("%.3f", var10)
						})
					end
				elseif curveAnimTranslationUtilsModule.positionHasKeyframes(v_1) then
					p0:fail(errorSourceStringsModule.Keys.CurveAnim_BonePositionNotAllowed, { boneName = v_1.Name })
				end
			end
		end
	end
end

return t