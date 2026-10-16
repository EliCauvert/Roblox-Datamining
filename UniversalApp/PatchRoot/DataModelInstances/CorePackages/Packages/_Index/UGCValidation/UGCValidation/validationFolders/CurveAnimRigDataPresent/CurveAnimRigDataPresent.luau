local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local GetEngineFeatureIsValidR15PlusModule = require(Parent.flags.getEngineFeatureIsValidR15Plus)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2) --[[ Line: 20 ]]
		-- upvalues: ErrorSourceStringsModule (copy), CurveAnimBoneHierarchyUtilsModule (copy), GetEngineFeatureIsValidR15PlusModule (copy)
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
			if CurveAnimBoneHierarchyUtilsModule.hasBoneFolders(curveAnimation) then
				if GetEngineFeatureIsValidR15PlusModule() then
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
}