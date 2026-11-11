local ReactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.React)
local UseChatPlatformModule = require(script.Parent.useChatPlatform)

return function()
	-- upvalues: UseChatPlatformModule (copy), ReactModule (copy)
	local GetTransparencyStoreFunction = UseChatPlatformModule().getTransparencyStore
	
	return {
		onFocusGained = ReactModule.useCallback(function()
			-- upvalues: GetTransparencyStoreFunction (copy)
			GetTransparencyStoreFunction(false).setTextboxFocus()
		end, { GetTransparencyStoreFunction }),
		onFocusLost = ReactModule.useCallback(function()
			-- upvalues: GetTransparencyStoreFunction (copy)
			GetTransparencyStoreFunction(false).clearTextboxFocus()
		end, { GetTransparencyStoreFunction })
	}
end