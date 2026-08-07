local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)

return function(value) --[[ line: 14 | named "useTopBar" ]]
	-- upvalues: getTopBarStoreModule (ref), reactModule (ref)
	local var3 = getTopBarStoreModule(false)
	
	return {
		setScreenTopBar = reactModule.useCallback(function(p0) --[[ line: 17 ]]
			-- upvalues: var3 (ref), value (ref)
			var3.setScreenTopBar(value, p0)
		end, { value }),
		clearScreenTopBar = reactModule.useCallback(function() --[[ line: 21 ]]
			-- upvalues: var3 (ref), value (ref)
			var3.clearScreenTopBar(value)
		end, { value })
	}
end