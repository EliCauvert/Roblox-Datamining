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
local var1 = nil

local function getParentMap()
	-- upvalues: var1 (write), list (ref), r15plusUtilsModule (ref)
	if var1 then
		return var1
	end
	local t = {}
	
	for i, v in list do
		local schemaFlatHierarchyList = r15plusUtilsModule.getSchemaFlatHierarchyList(r15plusUtilsModule.getAvatarBoneSchema(v), { v })
		
		for i_1, v_1 in schemaFlatHierarchyList do
			if v_1.ClassName == "Bone" then
				local path = v_1.path
				local var2 = path[#path - 1]
				local var3 = schemaFlatHierarchyList[var2]
				
				if var3 and var3.ClassName == "Bone" then
					t[i_1] = var2
				end
			end
		end
	end
	var1 = t
	
	return t
end

function t.run(p1, p2)
	-- upvalues: getParentMap (ref), curveAnimBoneHierarchyUtilsModule (ref), errorSourceStringsModule (ref)
	local var4 = getParentMap()
	
	for i, v in p2.curveAnimations do
		local t = {}
		
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("Folder") and curveAnimBoneHierarchyUtilsModule.isBoneFolderName(v_1.Name) then
				t[v_1.Name] = true
			end
		end
		for i_1 in t do
			local var5 = var4[i_1]
			
			if var5 ~= nil and not t[var5] then
				p1:fail(errorSourceStringsModule.Keys.CurveAnim_BoneRequiresParent, { boneName = i_1, parentBoneName = var5 })
			end
		end
	end
end

return t