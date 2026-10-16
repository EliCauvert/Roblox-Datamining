local InlineRichText = script:FindFirstAncestor("InlineRichText")
local NewResult = require(InlineRichText.Logger):new(script.Name)
local CryoModule = require(InlineRichText.Parent.Cryo)
local t = {}

local function _(p1, p2): string --[[ Line: 25 | Named "getMemoKey" ]]
	return `${p1}___${p2}`
end

local _ = function(p1, p2, p3) --[[ Line: 29 | Named "getMemo" ]]
	-- upvalues: t (copy)
	return t[p1][`${p2}___${p3}`]
end

local _ = function(p1, p2, p3, p4) --[[ Line: 35 | Named "setMemo" ]]
	-- upvalues: t (copy)
	t[p1][`${p2}___${p3}`] = p4
end

return function(p1, Key, p2, p3) --[[ Line: 40 | Named "isDescendant" ]]
	-- upvalues: t (copy), NewResult (copy), CryoModule (copy)
	if not t[Key] then
		t[Key] = {}
	end
	local t1 = {}
	
	local function dfs(Key1) --[[ Line: 46 ]]
		-- upvalues: t1 (copy), Key (copy), p3 (copy), t (upval), p1 (copy), NewResult (upval), CryoModule (upval), dfs (copy)
		t1[Key1] = true
		local Entry = t[Key][`${Key1}___${p3}`]
		
		if Entry ~= nil then
			return Entry
		end
		local v1 = p1[Key1]
		
		if not v1 then
			NewResult:error(`Node {Key1} not found in graph`)
			t[Key][`${Key1}___${p3}`] = false
			
			return false
		end
		if v1.children[p3] then
			t[Key][`${Key1}___${p3}`] = true
			
			return true
		end
		local Flag = false
		
		for _, value in CryoModule.List.filter(CryoModule.Dictionary.keys(v1.children), function(p4) --[[ Line: 64 ]]
			-- upvalues: t1 (upval), v1 (copy)
			return not t1[p4] and v1.children[p4]
		end) do
			if dfs(value) then
				Flag = true
				break
			end
		end
		t[Key][`${Key1}___${p3}`] = Flag
		
		return Flag
	end
	
	return (dfs(p2))
end