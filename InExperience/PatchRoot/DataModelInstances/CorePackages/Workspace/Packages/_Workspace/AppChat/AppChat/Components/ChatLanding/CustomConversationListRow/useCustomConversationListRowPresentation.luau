local appChat = script:FindFirstAncestor("AppChat")
local reactModule = require(appChat.Parent.React)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)

return function(p1)
	-- upvalues: useChatPagePaddingModule (ref), chatPlacementContextModule (ref), reactModule (ref)
	local var1 = useChatPagePaddingModule()
	local onActivated = p1.onActivated
	
	return {
		entryHeight = p1.entryHeight or 64,
		pagePaddingLeft = var1.left,
		pagePaddingRight = var1.right,
		showBackground = not chatPlacementContextModule.isPlacementInExperience(chatPlacementContextModule.useChatPlacementContext().chatPlacement),
		onActivated = reactModule.useCallback(function()
			-- upvalues: onActivated (ref)
			if onActivated ~= nil then
				onActivated()
			end
		end, { onActivated })
	}
end