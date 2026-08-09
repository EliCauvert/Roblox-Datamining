local _ = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.Navigation)
local var0 = nil
local var1 = false
local t = {
	dispatch = function() --[[ line: 17 ]]
		-- upvalues: var1 (write)
		if not var1 then
			var1 = true
			print("AppNavigationRegistry: not registered. This is expected in tests that aren't testing navigation. If you *are* testing navigation, please ensure AppNavigation.lua has been required.")
		end
		return false
	end,
	getIsNavigating = function() --[[ line: 24 ]]
		return false
	end
}

return {
	register = function(p0) --[[ line: 29 ]]
		-- upvalues: var0 (write)
		assert(var0 == nil, "Attempted to double-register AppNavigation")
		var0 = p0
	end,
	get = function() --[[ line: 34 ]]
		-- upvalues: var0 (write), t (ref)
		return var0 or t
	end,
	_resetForTest = function() --[[ line: 38 ]]
		-- upvalues: var0 (write)
		var0 = nil
	end
}