local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
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
local list = {
	"Head", "UpperTorso", "LeftFoot", "RightFoot", "LeftHand", "RightHand"
}
local v1 = nil

local function getParentMap()
	-- upvalues: v1 (ref), list (copy), R15plusUtilsModule (copy)
	if v1 then
		return v1
	end
	local t = {}
	
	for _, value in list do
		local SchemaFlatHierarchyList = R15plusUtilsModule.getSchemaFlatHierarchyList(R15plusUtilsModule.getAvatarBoneSchema(value), { value })
		
		for i, Bone in SchemaFlatHierarchyList do
			if Bone.ClassName == "Bone" then
				local Path = Bone.path
				local PathEntry = Path[#Path - 1]
				local SchemaFlatHierarchy = SchemaFlatHierarchyList[PathEntry]
				
				if SchemaFlatHierarchy and SchemaFlatHierarchy.ClassName == "Bone" then
					t[i] = PathEntry
				end
			end
		end
	end
	v1 = t
	
	return t
end

function config.run(p1, p2)
	-- upvalues: getParentMap (copy), CurveAnimBoneHierarchyUtilsModule (copy), ErrorSourceStringsModule (copy)
	local ParentMap = getParentMap()
	
	for _, curveAnimation in p2.curveAnimations do
		local BoneNames = {}
		
		for BoneName, Folder in curveAnimation:GetDescendants() do
			if Folder:IsA("Folder") and CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Folder.Name) then
				BoneNames[Folder.Name] = true
			end
		end
		for BoneName in BoneNames do
			local Parent = ParentMap[BoneName]
			
			if Parent ~= nil and not BoneNames[Parent] then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BoneRequiresParent, { boneName = BoneName, parentBoneName = Parent })
			end
		end
	end
end

return config