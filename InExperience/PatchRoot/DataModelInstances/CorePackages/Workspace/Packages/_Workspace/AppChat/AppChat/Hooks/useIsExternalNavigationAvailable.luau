local appChat = script:FindFirstAncestor("AppChat")
local isPageAvailableModule = require(appChat.Utils.isPageAvailable)
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext

return function(p0) --[[ line: 16 ]]
	-- upvalues: useChatPlacementContext (ref), isPageAvailableModule (ref)
	local chatPlacement = useChatPlacementContext().chatPlacement
	local t = {}
	
	for i, v in p0 do
		t[v] = isPageAvailableModule(v, chatPlacement)
	end
	return t
end