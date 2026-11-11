local AppChat = script:FindFirstAncestor("AppChat")
local ReactModule = require(AppChat.Parent.React)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)

return function(p1)
	-- upvalues: UseChatPagePaddingModule (copy), ReactModule (copy)
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local OnActivatedFunction = p1.onActivated
	
	return {
		entryHeight = p1.entryHeight or 64,
		pagePaddingLeft = UseChatPagePaddingModuleResult.left,
		pagePaddingRight = UseChatPagePaddingModuleResult.right,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: OnActivatedFunction (copy)
			if OnActivatedFunction ~= nil then
				OnActivatedFunction()
			end
		end, { OnActivatedFunction })
	}
end