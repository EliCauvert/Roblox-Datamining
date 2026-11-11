local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)

return function(p1)
	-- upvalues: GetTopBarStoreModule (copy), ReactModule (copy)
	local TopBarStoreModule = GetTopBarStoreModule(false)
	
	return {
		setScreenTopBar = ReactModule.useCallback(function(p2)
			-- upvalues: TopBarStoreModule (copy), p1 (copy)
			TopBarStoreModule.setScreenTopBar(p1, p2)
		end, { p1 }),
		clearScreenTopBar = ReactModule.useCallback(function()
			-- upvalues: TopBarStoreModule (copy), p1 (copy)
			TopBarStoreModule.clearScreenTopBar(p1)
		end, { p1 })
	}
end