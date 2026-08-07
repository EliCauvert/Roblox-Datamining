local reactModule = require(script:FindFirstAncestor("ExpChatIntegration").Parent.React)
local useChatPlatformModule = require(script.Parent.useChatPlatform)

return function() --[[ line: 8 | named "useChatInputBarOnFocus" ]]
	-- upvalues: useChatPlatformModule (ref), reactModule (ref)
	local getTransparencyStore = useChatPlatformModule().getTransparencyStore
	
	return {
		onFocusGained = reactModule.useCallback(function() --[[ line: 14 ]]
			-- upvalues: getTransparencyStore (ref)
			getTransparencyStore(false).setTextboxFocus()
		end, { getTransparencyStore }),
		onFocusLost = reactModule.useCallback(function() --[[ line: 17 ]]
			-- upvalues: getTransparencyStore (ref)
			getTransparencyStore(false).clearTextboxFocus()
		end, { getTransparencyStore })
	}
end