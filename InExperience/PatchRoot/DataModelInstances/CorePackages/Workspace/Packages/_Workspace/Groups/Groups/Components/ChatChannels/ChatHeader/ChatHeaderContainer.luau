local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)
local ChatHeaderViewModule = require(script.Parent.ChatHeaderView)
local UseChatHeaderViewModelModule = require(script.Parent.useChatHeaderViewModel)

return function(p1)
	-- upvalues: UseChatHeaderViewModelModule (copy), ReactModule (copy), ChatHeaderViewModule (copy)
	return ReactModule.createElement(ChatHeaderViewModule, (UseChatHeaderViewModelModule(p1)))
end