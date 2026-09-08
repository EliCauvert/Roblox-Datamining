local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local chatSearchFieldViewModule = require(script.Parent.ChatSearchFieldView)
local useChatSearchFieldViewModelModule = require(script.Parent.useChatSearchFieldViewModel)

return function(p1)
	-- upvalues: useChatSearchFieldViewModelModule (ref), reactModule (ref), chatSearchFieldViewModule (ref)
	return reactModule.createElement(chatSearchFieldViewModule, useChatSearchFieldViewModelModule(p1))
end