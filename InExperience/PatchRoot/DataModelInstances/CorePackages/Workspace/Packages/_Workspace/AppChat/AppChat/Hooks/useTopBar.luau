local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)

return function(value)
	-- upvalues: getTopBarStoreModule (ref), reactModule (ref)
	local var1 = getTopBarStoreModule(false)
	
	return {
		setScreenTopBar = reactModule.useCallback(function(p1)
			-- upvalues: var1 (ref), value (ref)
			var1.setScreenTopBar(value, p1)
		end, { value }),
		clearScreenTopBar = reactModule.useCallback(function()
			-- upvalues: var1 (ref), value (ref)
			var1.clearScreenTopBar(value)
		end, { value })
	}
end