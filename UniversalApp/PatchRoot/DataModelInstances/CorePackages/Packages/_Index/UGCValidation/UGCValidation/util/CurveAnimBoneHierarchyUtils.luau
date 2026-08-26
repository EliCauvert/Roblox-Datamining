local r15plusUtilsModule = require(script.Parent.Parent.util.R15plusUtils)
local t = {}
local list = {
	"Head", "UpperTorso", "LeftFoot", "RightFoot", "LeftHand", "RightHand"
}
local var1 = nil
local var2 = nil
local var3 = nil

local function ensureCaches()
	-- upvalues: var3 (write), list (ref), r15plusUtilsModule (ref), var1 (write), var2 (write)
	if var3 then return end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function traverse(p1, p2, p3)
		-- upvalues: t (ref), t_1 (ref), t_2 (ref), traverse (ref)
		for i, v in p1 do
			if v.ClassName == "Bone" then
				t[i] = true
				
				if p2 == nil then
					if not t_1[p3] then
						t_1[p3] = {}
					end
					table.insert(t_1[p3], i)
				elseif not t_2[p2] then
					t_2[p2] = {}
				end
				table.insert(t_2[p2], i)
				if v._children then
					traverse(v._children, i, p3)
				end
			end
		end
	end
	
	for i, v in list do
		traverse(r15plusUtilsModule.getAvatarBoneSchema(v), nil, v)
	end
	var1 = t_1
	var2 = t_2
	var3 = t
end

function t.hasBoneFolders(p4)
	-- upvalues: t (ref)
	for i, v in p4:GetDescendants() do
		if v:IsA("Folder") and t.isBoneFolderName(v.Name) then
			return true
		end
	end
	return false
end

function t.isBoneFolderName(p5)
	-- upvalues: ensureCaches (ref), var3 (write)
	ensureCaches()
	
	return var3[p5] == true
end

function t.getRootBoneNamesForBodyPart(p5)
	-- upvalues: ensureCaches (ref), var1 (write)
	ensureCaches()
	
	return var1[p5] or {}
end

function t.getChildBoneNames(p5)
	-- upvalues: ensureCaches (ref), var2 (write)
	ensureCaches()
	
	return var2[p5] or {}
end

return t