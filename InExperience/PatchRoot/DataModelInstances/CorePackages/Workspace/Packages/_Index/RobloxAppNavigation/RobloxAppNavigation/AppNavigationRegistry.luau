local _ = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.Navigation)
local var1 = nil
local var2 = false
local t = {
	dispatch = function()
		-- upvalues: var2 (write)
		if not var2 then
			var2 = true
			print("AppNavigationRegistry: not registered. This is expected in tests that aren't testing navigation. If you *are* testing navigation, please ensure AppNavigation.lua has been required.")
		end
		return false
	end,
	getIsNavigating = function()
		return false
	end
}

return {
	register = function(p1)
		-- upvalues: var1 (write)
		assert(var1 == nil, "Attempted to double-register AppNavigation")
		var1 = p1
	end,
	get = function()
		-- upvalues: var1 (write), t (ref)
		return var1 or t
	end,
	isRegistered = function()
		-- upvalues: var1 (write)
		return var1 ~= nil
	end,
	_resetForTest = function()
		-- upvalues: var1 (write)
		var1 = nil
	end
}