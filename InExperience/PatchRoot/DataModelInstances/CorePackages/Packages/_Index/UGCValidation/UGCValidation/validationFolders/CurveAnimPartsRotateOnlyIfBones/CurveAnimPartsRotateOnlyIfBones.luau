local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateAnimPartsRotationOnlyModule = require(parent.flags.getFFlagUGCValidateAnimPartsRotationOnly)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidateAnimPartsRotationOnlyModule() and require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }

if getFFlagUGCValidateAnimPartsRotationOnlyModule() then
	t.conditionalData = {}
else
	t.conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData }
end
function t.fflag() --[[ line: 27 ]]
	-- upvalues: getFFlagUGCValidateEmotesBonesAllowedModule (ref), getFFlagUGCValidateAnimPartsRotationOnlyModule (ref)
	return getFFlagUGCValidateEmotesBonesAllowedModule() or getFFlagUGCValidateAnimPartsRotationOnlyModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function bodyPartPositionHasKeyframes(p0) --[[ line: 33 ]]
	local position = p0:FindFirstChild("Position")
	
	if not position or not position:IsA("Vector3Curve") then
		return false
	end
	for i, v in { "X", "Y", "Z" } do
		local var9 = position:FindFirstChild(v)
		
		if var9 and var9:IsA("FloatCurve") and #var9:GetKeys() > 0 then
			return true
		end
	end
	return false
end

function t.run(p1, p2) --[[ line: 47 ]]
	-- upvalues: getFFlagUGCValidateAnimPartsRotationOnlyModule (ref), validationEnumsModule (ref), curveAnimBoneHierarchyUtilsModule (ref), curveAnimationHierarchyUtilsModule (ref), bodyPartPositionHasKeyframes (ref), errorSourceStringsModule (ref)
	local var11
	local var10 = getFFlagUGCValidateAnimPartsRotationOnlyModule() and p2.uploadCategory == validationEnumsModule.UploadCategory.ANIMATION
	
	for i, v in p2.curveAnimations do
		if not var10 then
			var11 = false
			
			for i_1, v_1 in v:GetDescendants() do
				if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
					var11 = true
					break
				end
			end
			if var11 then
				for i_2, i_1 in v:GetDescendants() do
					if i_1:IsA("Folder") and curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(i_1.Name) and bodyPartPositionHasKeyframes(i_1) then
						if var10 then
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_BodyPartHasPosition, { bodyPartName = i_1.Name })
						else
							p1:fail(errorSourceStringsModule.Keys.CurveAnim_BodyPartWithBoneHasPosition, { bodyPartName = i_1.Name })
						end
					end
				end
			end
		end
	end
end

return t