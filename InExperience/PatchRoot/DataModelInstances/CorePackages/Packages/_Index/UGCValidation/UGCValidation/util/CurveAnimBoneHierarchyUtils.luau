local R15plusUtilsModule = require(script.Parent.Parent.util.R15plusUtils)
local CurveAnimBoneHierarchyUtils = {}
local list = {
	"Head", "UpperTorso", "LeftFoot", "RightFoot", "LeftHand", "RightHand"
}
local v1 = nil
local v2 = nil
local v3 = nil

local function ensureCaches() --[[ Line: 14 ]]
	-- upvalues: v3 (ref), list (copy), R15plusUtilsModule (copy), v1 (ref), v2 (ref)
	if v3 then return end
	local t = {}
	local t1 = {}
	local t2 = {}
	
	local function traverse(AvatarBoneSchema, Key, Key1) --[[ Line: 23 ]]
		-- upvalues: t (copy), t1 (copy), t2 (copy), traverse (copy)
		for i, Bone in AvatarBoneSchema do
			if Bone.ClassName == "Bone" then
				t[i] = true
				
				if Key == nil then
					if not t1[Key1] then
						t1[Key1] = {}
					end
					table.insert(t1[Key1], i)
				else
					if not t2[Key] then
						t2[Key] = {}
					end
					table.insert(t2[Key], i)
				end
				if Bone._children then
					traverse(Bone._children, i, Key1)
				end
			end
		end
	end
	
	for _, value in list do
		traverse(R15plusUtilsModule.getAvatarBoneSchema(value), nil, value)
	end
	v1 = t1
	v2 = t2
	v3 = t
end

function CurveAnimBoneHierarchyUtils.hasBoneFolders(Object): boolean --[[ Line: 59 ]]
	-- upvalues: CurveAnimBoneHierarchyUtils (copy)
	for _, Folder in Object:GetDescendants() do
		if Folder:IsA("Folder") and CurveAnimBoneHierarchyUtils.isBoneFolderName(Folder.Name) then
			return true
		end
	end
	return false
end

function CurveAnimBoneHierarchyUtils.isBoneFolderName(Name): boolean --[[ Line: 68 ]]
	-- upvalues: ensureCaches (copy), v3 (ref)
	ensureCaches()
	
	return v3[Name] == true
end

function CurveAnimBoneHierarchyUtils.getRootBoneNamesForBodyPart(p1) --[[ Line: 73 ]]
	-- upvalues: ensureCaches (copy), v1 (ref)
	ensureCaches()
	
	return v1[p1] or {}
end

function CurveAnimBoneHierarchyUtils.getChildBoneNames(p1) --[[ Line: 78 ]]
	-- upvalues: ensureCaches (copy), v2 (ref)
	ensureCaches()
	
	return v2[p1] or {}
end

return CurveAnimBoneHierarchyUtils