local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ChatSearchFieldViewModule = require(script.Parent.ChatSearchFieldView)
local UseChatSearchFieldViewModelModule = require(script.Parent.useChatSearchFieldViewModel)

return function(p1) --[[ Line: 10 | Named "ChatSearchFieldContainer" ]]
	-- upvalues: UseChatSearchFieldViewModelModule (copy), ReactModule (copy), ChatSearchFieldViewModule (copy)
	return ReactModule.createElement(ChatSearchFieldViewModule, (UseChatSearchFieldViewModelModule(p1)))
end