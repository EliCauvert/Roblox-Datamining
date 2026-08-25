local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)

return function(value)
	-- upvalues: getTopBarStoreModule (ref), reactModule (ref)
	local var3 = getTopBarStoreModule(false)
	
	return {
		setScreenTopBar = reactModule.useCallback(function(p0)
			-- upvalues: var3 (ref), value (ref)
			var3.setScreenTopBar(value, p0)
		end, { value }),
		clearScreenTopBar = reactModule.useCallback(function()
			-- upvalues: var3 (ref), value (ref)
			var3.clearScreenTopBar(value)
		end, { value })
	}
end