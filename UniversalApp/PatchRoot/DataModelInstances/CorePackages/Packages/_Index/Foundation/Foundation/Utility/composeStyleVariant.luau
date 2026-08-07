local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Components.Types)

local function _(p0) --[[ line: 11 | named "tagToTable" ]]
	return if type(p0) == "string" then { [p0] = true } else p0
end

local function mergeTags(p1, p2) --[[ line: 20 ]]
	-- upvalues: dashModule (ref)
	return if p1 then if p2 then if type(p1) == "table" or type(p2) == "table" then dashModule.join(if type(p1) == "string" then { [p1] = true } else p1, if type(p2) == "string" then { [p2] = true } else p2) else `{p1} {p2}` else p1 else p2
end

local _ = function(p3, p4) --[[ line: 40 | named "mergeProps" ]]
	-- upvalues: dashModule (ref), mergeTags (ref)
	local var3 = dashModule.join(p3, p4)
	var3.tag = mergeTags(p3.tag, p4.tag)
	
	return var3
end

function composeStyleVariant(p5, ...) --[[ line: 48 ]]
	-- upvalues: dashModule (ref), mergeTags (ref)
	local var4 = dashModule.copy(p5)
	dashModule.forEachArgs(function(p6) --[[ line: 50 ]]
		-- upvalues: var4 (ref), dashModule (copy), mergeTags (copy)
		if p6 == nil then return end
		for i, v in p6 do
			local var5 = var4
			local var6 = var4[i] or {}
			local var7 = dashModule.join(var6, v)
			var7.tag = mergeTags(var6.tag, v.tag)
			var5[i] = var7
		end
	end, ...)
	
	return var4
end

return composeStyleVariant