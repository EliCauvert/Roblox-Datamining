local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local reactModule = require(chatUIPrimitives.Parent.React)
local chatInputBarViewModule = require(chatUIPrimitives.Components.ChatInputBar.ChatInputBarView)
local useMessageComposerViewModelModule = require(script.Parent.useMessageComposerViewModel)

return function(p1)
	-- upvalues: useMessageComposerViewModelModule (ref), reactModule (ref), chatInputBarViewModule (ref)
	return reactModule.createElement(chatInputBarViewModule, useMessageComposerViewModelModule(p1))
end