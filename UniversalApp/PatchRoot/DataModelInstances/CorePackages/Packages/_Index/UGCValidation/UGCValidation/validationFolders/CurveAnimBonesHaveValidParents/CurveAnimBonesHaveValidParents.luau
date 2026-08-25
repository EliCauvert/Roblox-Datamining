local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local curveAnimBoneHierarchyUtilsModule = require(parent.util.CurveAnimBoneHierarchyUtils)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateAnimBonesSupportModule = require(parent.flags.getFFlagUGCValidateAnimBonesSupport)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidateAnimBonesSupportModule() and require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
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
local list = {
	"Head", "UpperTorso", "LeftFoot", "RightFoot", "LeftHand", "RightHand"
}
local var8 = nil

local function getParentMap()
	-- upvalues: var8 (write), list (ref), r15plusUtilsModule (ref)
	if var8 then
		return var8
	end
	local t = {}
	
	for i, v in list do
		local schemaFlatHierarchyList = r15plusUtilsModule.getSchemaFlatHierarchyList(r15plusUtilsModule.getAvatarBoneSchema(v), { v })
		
		for i_1, v_1 in schemaFlatHierarchyList do
			if v_1.ClassName == "Bone" then
				local path = v_1.path
				local var12 = path[#path - 1]
				local var13 = schemaFlatHierarchyList[var12]
				
				if var13 and var13.ClassName == "Bone" then
					t[i_1] = var12
				end
			end
		end
	end
	var8 = t
	
	return t
end

function t.run(p0, p1)
	-- upvalues: getParentMap (ref), curveAnimBoneHierarchyUtilsModule (ref), errorSourceStringsModule (ref)
	local var14 = getParentMap()
	
	for i, v in p1.curveAnimations do
		local t = {}
		
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
				t[v_1.Name] = true
			end
		end
		for i_1 in t do
			local var16 = var14[i_1]
			
			if var16 ~= nil and not t[var16] then
				p0:fail(errorSourceStringsModule.Keys.CurveAnim_BoneRequiresParent, { boneName = i_1, parentBoneName = var16 })
			end
		end
	end
end

return t