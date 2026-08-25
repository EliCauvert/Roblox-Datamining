local _ = require(script.Parent.types)
local default = require(script.Parent.assetSource).default
local t = {}

return {
	load = function(value)
		-- upvalues: t (write), default (ref)
		local var1 = t[value]
		
		if var1 then
			return var1
		end
		local var2 = default(value):catch(function(p0)
			-- upvalues: t (copy), value (ref)
			t[value] = nil
			error(p0)
		end)
		t[value] = var2
		
		return var2
	end,
	clearCache = function()
		-- upvalues: t (write)
		t = {}
	end
}