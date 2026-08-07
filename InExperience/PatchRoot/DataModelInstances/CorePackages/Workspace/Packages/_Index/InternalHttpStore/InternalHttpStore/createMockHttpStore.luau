local parent = script.Parent
local signalsModule = require(parent.Parent.Signals)
local _ = require(parent.HttpStoreTypes)

return function() --[[ line: 20 | named "createMockHttpStore" ]]
	-- upvalues: signalsModule (ref)
	local t = {}
	
	local function getOrCreateResponse(p0, p1) --[[ line: 29 ]]
		-- upvalues: t (write), signalsModule (copy)
		if not t[p0] then
			local var3, var4 = signalsModule.createSignal({ status = "NotStarted", config = p1 })
			t[p0] = { get = var3, set = var4 }
		end
		return t[p0]
	end
	
	return {
		fetch = function(p2, p3) --[[ line: 40 ]]
			-- upvalues: getOrCreateResponse (ref)
			return getOrCreateResponse(p2 or p3.Url, p3).get, function() --[[ line: 43 ]] end
		end,
		cancelAll = function() --[[ line: 46 ]] end,
		setResponse = function(value, p4) --[[ line: 53 ]]
			-- upvalues: t (write), signalsModule (copy)
			if t[value] then
				t[value].set(p4)
				
				return
			end
			local var5, var6 = signalsModule.createSignal(p4)
			t[value] = { get = var5, set = var6 }
		end,
		reset = function() --[[ line: 63 ]]
			-- upvalues: t (write)
			t = {}
		end
	}
end