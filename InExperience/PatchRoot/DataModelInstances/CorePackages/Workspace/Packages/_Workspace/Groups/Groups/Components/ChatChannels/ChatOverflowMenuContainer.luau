local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)
local ChatOverflowMenuViewModule = require(script.Parent.ChatOverflowMenuView)
local UseChatOverflowMenuViewModelModule = require(script.Parent.useChatOverflowMenuViewModel)

return function(p1)
	-- upvalues: UseChatOverflowMenuViewModelModule (copy), ReactModule (copy), ChatOverflowMenuViewModule (copy)
	return ReactModule.createElement(ChatOverflowMenuViewModule, (UseChatOverflowMenuViewModelModule(p1)))
end