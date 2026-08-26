local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateCurveAnimRigDataR15PlusModule = require(parent.flags.getFFlagUGCValidateCurveAnimRigDataR15Plus)
local getEngineFeatureIsValidR15PlusModule = require(parent.flags.getEngineFeatureIsValidR15Plus)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

function t.run(p1, p2)
	-- upvalues: errorSourceStringsModule (ref), getFFlagUGCValidateEmotesBonesAllowedModule (ref), curveAnimBoneHierarchyUtilsModule (ref), getFFlagUGCValidateCurveAnimRigDataR15PlusModule (ref), getEngineFeatureIsValidR15PlusModule (ref)
	for i, v in p2.curveAnimations do
		local var1 = 0
		
		for i_1, v_1 in v:GetChildren() do
			if v_1:IsA("AnimationRigData") then
				var1 += 1
				
				if var1 > 1 then
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_MultipleRigData)
					
					return
				end
			end
		end
		if var1 ~= 0 then
			if not getFFlagUGCValidateEmotesBonesAllowedModule() or not curveAnimBoneHierarchyUtilsModule.hasBoneFolders(v) then
				for v_1, v_2 in v:GetChildren() do
					if v_2:IsA("AnimationRigData") and not v_2:IsValidR15() then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidRigData)
						
						return
					end
				end
			elseif getFFlagUGCValidateCurveAnimRigDataR15PlusModule() and getEngineFeatureIsValidR15PlusModule() then
				for v_1, v_2 in v:GetChildren() do
					if v_2:IsA("AnimationRigData") and not v_2:IsValidR15Plus() then
						p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidRigDataR15Plus)
						
						return
					end
				end
			end
		end
		p1:fail(errorSourceStringsModule.Keys.CurveAnim_NoRigData)
		
		return
	end
end

return t