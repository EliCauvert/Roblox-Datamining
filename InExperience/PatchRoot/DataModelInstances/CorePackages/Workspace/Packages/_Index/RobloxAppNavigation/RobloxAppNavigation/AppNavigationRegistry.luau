local _ = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.Navigation)
local var0 = nil
local var1 = false
local t = {
	dispatch = function()
		-- upvalues: var1 (write)
		if not var1 then
			var1 = true
			print("AppNavigationRegistry: not registered. This is expected in tests that aren't testing navigation. If you *are* testing navigation, please ensure AppNavigation.lua has been required.")
		end
		return false
	end,
	getIsNavigating = function()
		return false
	end
}

return {
	register = function(p0)
		-- upvalues: var0 (write)
		assert(var0 == nil, "Attempted to double-register AppNavigation")
		var0 = p0
	end,
	get = function()
		-- upvalues: var0 (write), t (ref)
		return var0 or t
	end,
	isRegistered = function()
		-- upvalues: var0 (write)
		return var0 ~= nil
	end,
	_resetForTest = function()
		-- upvalues: var0 (write)
		var0 = nil
	end
}