local ReactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.React)
local UseChatPlatformModule = require(script.Parent.useChatPlatform)

return function() --[[ Line: 8 | Named "useChatInputBarOnFocus" ]]
	-- upvalues: UseChatPlatformModule (copy), ReactModule (copy)
	local GetTransparencyStoreFunction = UseChatPlatformModule().getTransparencyStore
	
	return {
		onFocusGained = ReactModule.useCallback(function() --[[ Line: 14 ]]
			-- upvalues: GetTransparencyStoreFunction (copy)
			GetTransparencyStoreFunction(false).setTextboxFocus()
		end, { GetTransparencyStoreFunction }),
		onFocusLost = ReactModule.useCallback(function() --[[ Line: 17 ]]
			-- upvalues: GetTransparencyStoreFunction (copy)
			GetTransparencyStoreFunction(false).clearTextboxFocus()
		end, { GetTransparencyStoreFunction })
	}
end