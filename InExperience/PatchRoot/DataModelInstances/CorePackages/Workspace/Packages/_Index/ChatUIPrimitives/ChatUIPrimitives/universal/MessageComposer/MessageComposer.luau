local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local ReactModule = require(ChatUIPrimitives.Parent.React)
local ChatInputBarViewModule = require(ChatUIPrimitives.Components.ChatInputBar.ChatInputBarView)
local UseMessageComposerViewModelModule = require(script.Parent.useMessageComposerViewModel)

return function(p1)
	-- upvalues: UseMessageComposerViewModelModule (copy), ReactModule (copy), ChatInputBarViewModule (copy)
	return ReactModule.createElement(ChatInputBarViewModule, (UseMessageComposerViewModelModule(p1)))
end