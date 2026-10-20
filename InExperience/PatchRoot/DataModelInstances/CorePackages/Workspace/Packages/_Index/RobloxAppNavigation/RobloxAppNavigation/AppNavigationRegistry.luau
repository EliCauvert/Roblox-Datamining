local _ = require(script:FindFirstAncestor("RobloxAppNavigation").Parent.Navigation)
local v1 = nil
local Flag = false
local config = {
	dispatch = function(): boolean
		-- upvalues: Flag (ref)
		if not Flag then
			Flag = true
			print("AppNavigationRegistry: not registered. This is expected in tests that aren't testing navigation. If you *are* testing navigation, please ensure AppNavigation.lua has been required.")
		end
		return false
	end,
	getIsNavigating = function(): boolean
		return false
	end
}

return {
	register = function(p1)
		-- upvalues: v1 (ref)
		assert(v1 == nil, "Attempted to double-register AppNavigation")
		v1 = p1
	end,
	get = function()
		-- upvalues: v1 (ref), config (copy)
		return v1 or config
	end,
	isRegistered = function(): boolean
		-- upvalues: v1 (ref)
		return v1 ~= nil
	end,
	_resetForTest = function()
		-- upvalues: v1 (ref)
		v1 = nil
	end
}