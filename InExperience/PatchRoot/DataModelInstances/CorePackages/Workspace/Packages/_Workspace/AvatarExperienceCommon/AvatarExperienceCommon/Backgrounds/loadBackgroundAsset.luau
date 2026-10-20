local _ = require(script.Parent.types)
local DefaultFunction = require(script.Parent.assetSource).default
local t = {}

return {
	load = function(Key)
		-- upvalues: t (ref), DefaultFunction (copy)
		local Entry = t[Key]
		
		if Entry then
			return Entry
		else
			local v1 = DefaultFunction(Key):catch(function(Err)
				-- upvalues: t (upval), Key (copy)
				t[Key] = nil
				error(Err)
			end)
			t[Key] = v1
			
			return v1
		end
	end,
	clearCache = function()
		-- upvalues: t (ref)
		t = {}
	end
}