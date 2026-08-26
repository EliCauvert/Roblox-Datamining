local parent = script.Parent
local signalsModule = require(parent.Parent.Signals)
local _ = require(parent.HttpStoreTypes)

return function()
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getOrCreateResponse(p1, p2)
		-- upvalues: t (write), signalsModule (copy)
		if not t[p1] then
			local var1, var2 = signalsModule.createSignal({ status = "NotStarted", config = p2 })
			t[p1] = { get = var1, set = var2 }
		end
		return t[p1]
	end
	
	return {
		fetch = function(p1, p2)
			-- upvalues: getOrCreateResponse (ref)
			return getOrCreateResponse(p1 or p2.Url, p2).get, function() end
		end,
		cancelAll = function() end,
		setResponse = function(value, p1)
			-- upvalues: t (write), signalsModule (copy)
			if t[value] then
				t[value].set(p1)
				
				return
			end
			local var1, var2 = signalsModule.createSignal(p1)
			t[value] = { get = var1, set = var2 }
		end,
		reset = function()
			-- upvalues: t (write)
			t = {}
		end
	}
end