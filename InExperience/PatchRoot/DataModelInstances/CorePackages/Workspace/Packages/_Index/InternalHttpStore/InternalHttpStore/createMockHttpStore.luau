local Parent = script.Parent
local SignalsModule = require(Parent.Parent.Signals)
local _ = require(Parent.HttpStoreTypes)

return function() --[[ Line: 20 | Named "createMockHttpStore" ]]
	-- upvalues: SignalsModule (copy)
	local t = {}
	
	local function getOrCreateResponse(Key, Config) --[[ Line: 29 ]]
		-- upvalues: t (ref), SignalsModule (upval)
		if not t[Key] then
			local Signal, Signal2 = SignalsModule.createSignal({ status = "NotStarted", config = Config })
			t[Key] = { get = Signal, set = Signal2 }
		end
		return t[Key]
	end
	
	return {
		fetch = function(p1, p2) --[[ Line: 40 ]]
			-- upvalues: getOrCreateResponse (copy)
			return getOrCreateResponse(p1 or p2.Url, p2).get, function() --[[ Line: 43 ]] end
		end,
		cancelAll = function() --[[ Line: 46 ]] end,
		setResponse = function(Key, p1) --[[ Line: 53 ]]
			-- upvalues: t (ref), SignalsModule (upval)
			if t[Key] then
				t[Key].set(p1)
				
				return
			else
				local Signal, Signal2 = SignalsModule.createSignal(p1)
				t[Key] = { get = Signal, set = Signal2 }
			end
		end,
		reset = function() --[[ Line: 63 ]]
			-- upvalues: t (ref)
			t = {}
		end
	}
end