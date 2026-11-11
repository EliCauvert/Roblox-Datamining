local AppChat = script:FindFirstAncestor("AppChat")
local IsPageAvailableModule = require(AppChat.Utils.isPageAvailable)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext

return function(List)
	-- upvalues: UseChatPlacementContextFunction (copy), IsPageAvailableModule (copy)
	local ChatPlacement = UseChatPlacementContextFunction().chatPlacement
	local t = {}
	
	for _, value in List do
		t[value] = IsPageAvailableModule(value, ChatPlacement)
	end
	return t
end