local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)
local GetFFlagUGCValidateEmotesBonesAllowedModule = require(Parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local GetFFlagUGCValidateAnimBonesSupportModule = require(Parent.flags.getFFlagUGCValidateAnimBonesSupport)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local config = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if GetFFlagUGCValidateAnimBonesSupportModule() and GetFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(config.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
config.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
config.conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimBoneData }

function config.fflag()
	-- upvalues: GetFFlagUGCValidateEmotesBonesAllowedModule (copy), GetFFlagUGCValidateAnimBonesSupportModule (copy)
	return GetFFlagUGCValidateEmotesBonesAllowedModule() or GetFFlagUGCValidateAnimBonesSupportModule()
end

config.expectedFailures = {}
config.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function bonePositionHasKeyframes(Folder): boolean
	local Position = Folder:FindFirstChild("Position")
	
	if not Position or not Position:IsA("Vector3Curve") then
		return false
	end
	for _, ChildName in { "X", "Y", "Z" } do
		local Child = Position:FindFirstChild(ChildName)
		
		if Child and Child:IsA("FloatCurve") and #Child:GetKeys() > 0 then
			return true
		end
	end
	return false
end

function config.run(p1, p2)
	-- upvalues: CurveAnimBoneHierarchyUtilsModule (copy), bonePositionHasKeyframes (copy), ErrorSourceStringsModule (copy)
	for _, curveAnimation in p2.curveAnimations do
		for _, Folder in curveAnimation:GetDescendants() do
			if Folder:IsA("Folder") and CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Folder.Name) and bonePositionHasKeyframes(Folder) then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BonePositionNotAllowed, { boneName = Folder.Name })
			end
		end
	end
end

return config