local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)

return function(p0) --[[ line: 22 | named "useCustomConversationListRowPresentation" ]]
	-- upvalues: useChatPagePaddingModule (ref), reactModule (ref)
	local var3 = useChatPagePaddingModule()
	local onActivated = p0.onActivated
	
	return {
		entryHeight = p0.entryHeight or 64,
		pagePaddingLeft = var3.left,
		pagePaddingRight = var3.right,
		onActivated = reactModule.useCallback(function() --[[ line: 28 ]]
			-- upvalues: onActivated (ref)
			if onActivated ~= nil then
				onActivated()
			end
		end, { onActivated })
	}
end