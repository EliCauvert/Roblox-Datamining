local inlineRichText = script:FindFirstAncestor("InlineRichText")
local name = require(inlineRichText.Logger):new(script.Name)
local cryoModule = require(inlineRichText.Parent.Cryo)
local t = {}

local function _(p1, p2)
	return `${p1}___${p2}`
end

local _ = function(p1, p2, p3)
	-- upvalues: t (ref)
	return t[p1][`${p2}___${p3}`]
end

local _ = function(value, p1, p2, p3)
	-- upvalues: t (ref)
	t[value][`${p1}___${p2}`] = p3
end

return function(p1, p2, p3, p4)
	-- upvalues: t (ref), name (ref), cryoModule (ref)
	if not t[p2] then
		t[p2] = {}
	end
	local t_1 = {}
	
	local function dfs(p5)
		-- upvalues: t_1 (ref), p2 (ref), p4 (ref), t (copy), p1 (ref), name (copy), cryoModule (copy), dfs (ref)
		t_1[p5] = true
		local var1 = t[p2][`${p5}___${p4}`]
		
		if var1 ~= nil then
			return var1
		end
		local var2 = p1[p5]
		
		if not var2 then
			name:error(`Node {p5} not found in graph`)
			t[p2][`${p5}___${p4}`] = false
			
			return false
		elseif var2.children[p4] then
			t[p2][`${p5}___${p4}`] = true
			
			return true
		end
		local var3 = false
		
		for i, v in cryoModule.List.filter(cryoModule.Dictionary.keys(var2.children), function(p6)
			-- upvalues: t_1 (copy), var2 (ref)
			return t_1[p6] or not var2.children[p6]
		end) do
			if dfs(v) then
				var3 = true
				break
			end
		end
		t[p2][`${p5}___${p4}`] = var3
		
		return var3
	end
	
	return dfs(p3)
end