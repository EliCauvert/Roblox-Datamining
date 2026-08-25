local reactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.React)
local useChatPlatformModule = require(script.Parent.useChatPlatform)

return function()
	-- upvalues: useChatPlatformModule (ref), reactModule (ref)
	local getTransparencyStore = useChatPlatformModule().getTransparencyStore
	
	return {
		onFocusGained = reactModule.useCallback(function()
			-- upvalues: getTransparencyStore (ref)
			getTransparencyStore(false).setTextboxFocus()
		end, { getTransparencyStore }),
		onFocusLost = reactModule.useCallback(function()
			-- upvalues: getTransparencyStore (ref)
			getTransparencyStore(false).clearTextboxFocus()
		end, { getTransparencyStore })
	}
end