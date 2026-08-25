local inlineRichText = script:FindFirstAncestor("InlineRichText")
local name = require(inlineRichText.Logger):new(script.Name)
local cryoModule = require(inlineRichText.Parent.Cryo)
local t = {}

local function _(p0, p1)
	return `${p0}___${p1}`
end

local _ = function(p2, p3, p4)
	-- upvalues: t (ref)
	return t[p2][`${p3}___${p4}`]
end

local _ = function(value, p5, p6, p7)
	-- upvalues: t (ref)
	t[value][`${p5}___${p6}`] = p7
end

return function(p8, p9, p10, p11)
	-- upvalues: t (ref), name (ref), cryoModule (ref)
	if not t[p9] then
		t[p9] = {}
	end
	local t_1 = {}
	
	local function dfs(p12)
		-- upvalues: t_1 (ref), p9 (ref), p11 (ref), t (copy), p8 (ref), name (copy), cryoModule (copy), dfs (ref)
		t_1[p12] = true
		local var6 = t[p9][`${p12}___${p11}`]
		
		if var6 ~= nil then
			return var6
		end
		local var7 = p8[p12]
		
		if not var7 then
			name:error(`Node {p12} not found in graph`)
			t[p9][`${p12}___${p11}`] = false
			
			return false
		elseif var7.children[p11] then
			t[p9][`${p12}___${p11}`] = true
			
			return true
		end
		local var8 = false
		
		for i, v in cryoModule.List.filter(cryoModule.Dictionary.keys(var7.children), function(p13)
			-- upvalues: t_1 (copy), var7 (ref)
			return t_1[p13] or not var7.children[p13]
		end) do
			if dfs(v) then
				var8 = true
				break
			end
		end
		t[p9][`${p12}___${p11}`] = var8
		
		return var8
	end
	
	return dfs(p10)
end