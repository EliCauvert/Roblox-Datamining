local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Components.Types)

local function _(p1)
	return if type(p1) == "string" then { [p1] = true } else p1
end

local function mergeTags(p1, p2)
	-- upvalues: dashModule (ref)
	return if p1 then if p2 then if type(p1) == "table" or type(p2) == "table" then dashModule.join(if type(p1) == "string" then { [p1] = true } else p1, if type(p2) == "string" then { [p2] = true } else p2) else `{p1} {p2}` else p1 else p2
end

local _ = function(p1, p2)
	-- upvalues: dashModule (ref), mergeTags (ref)
	local var1 = dashModule.join(p1, p2)
	var1.tag = mergeTags(p1.tag, p2.tag)
	
	return var1
end

function composeStyleVariant(p1, ...)
	-- upvalues: dashModule (ref), mergeTags (ref)
	local var1 = dashModule.copy(p1)
	dashModule.forEachArgs(function(p1)
		-- upvalues: var1 (ref), dashModule (copy), mergeTags (copy)
		if p1 == nil then return end
		for i, v in p1 do
			local var1 = var1
			local var2 = var1[i] or {}
			local var3 = dashModule.join(var2, v)
			var3.tag = mergeTags(var2.tag, v.tag)
			var1[i] = var3
		end
	end, ...)
	
	return var1
end

return composeStyleVariant