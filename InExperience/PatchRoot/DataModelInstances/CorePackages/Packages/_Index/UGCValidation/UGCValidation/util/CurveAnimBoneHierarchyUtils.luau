local r15plusUtilsModule = require(script.Parent.Parent.util.R15plusUtils)
local t = {}
local list = {
	"Head", "UpperTorso", "LeftFoot", "RightFoot", "LeftHand", "RightHand"
}
local var3 = nil
local var4 = nil
local var5 = nil

local function ensureCaches() --[[ line: 14 ]]
	-- upvalues: var5 (write), list (ref), r15plusUtilsModule (ref), var3 (write), var4 (write)
	if var5 then return end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function traverse(p0, p1, p2) --[[ line: 23 ]]
		-- upvalues: t (ref), t_1 (ref), t_2 (ref), traverse (ref)
		for i, v in p0 do
			if v.ClassName == "Bone" then
				t[i] = true
				
				if p1 == nil then
					if not t_1[p2] then
						t_1[p2] = {}
					end
					table.insert(t_1[p2], i)
				elseif not t_2[p1] then
					t_2[p1] = {}
				end
				table.insert(t_2[p1], i)
				if v._children then
					traverse(v._children, i, p2)
				end
			end
		end
	end
	
	for i, v in list do
		traverse(r15plusUtilsModule.getAvatarBoneSchema(v), nil, v)
	end
	var3 = t_1
	var4 = t_2
	var5 = t
end

function t.hasBoneFolders(p3) --[[ line: 59 ]]
	-- upvalues: t (ref)
	for i, v in p3:GetDescendants() do
		if v:IsA("Folder") and t.isBoneFolderName(v.Name) then
			return true
		end
	end
	return false
end

function t.isBoneFolderName(p4) --[[ line: 68 ]]
	-- upvalues: ensureCaches (ref), var5 (write)
	ensureCaches()
	
	return var5[p4] == true
end

function t.getRootBoneNamesForBodyPart(p5) --[[ line: 73 ]]
	-- upvalues: ensureCaches (ref), var3 (write)
	ensureCaches()
	
	return var3[p5] or {}
end

function t.getChildBoneNames(p6) --[[ line: 78 ]]
	-- upvalues: ensureCaches (ref), var4 (write)
	ensureCaches()
	
	return var4[p6] or {}
end

return t