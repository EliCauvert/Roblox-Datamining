local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local ChatPlacementContextModule = require(AppChat.Contexts.ChatPlacementContext)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)

return function(p1)
	-- upvalues: UseChatPagePaddingModule (copy), ChatPlacementContextModule (copy), ReactModule (copy)
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local OnActivatedFunction = p1.onActivated
	
	return {
		entryHeight = p1.entryHeight or 64,
		pagePaddingLeft = UseChatPagePaddingModuleResult.left,
		pagePaddingRight = UseChatPagePaddingModuleResult.right,
		showBackground = not ChatPlacementContextModule.isPlacementInExperience(ChatPlacementContextModule.useChatPlacementContext().chatPlacement),
		onActivated = ReactModule.useCallback(function()
			-- upvalues: OnActivatedFunction (copy)
			if OnActivatedFunction ~= nil then
				OnActivatedFunction()
			end
		end, { OnActivatedFunction })
	}
end