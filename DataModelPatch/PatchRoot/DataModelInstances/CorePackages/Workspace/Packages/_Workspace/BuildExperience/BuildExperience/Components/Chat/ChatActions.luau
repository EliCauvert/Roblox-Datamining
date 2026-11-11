local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local ChatComposerModule = require(script.Parent.ChatComposer)
local View = require(Parent.Foundation).View

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), ChatComposerModule (copy)
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Composer = ReactModule.createElement(ChatComposerModule, {
			LayoutOrder = 1,
			text = Frame.composerText,
			composerErrorText = Frame.composerErrorText,
			onChanged = Frame.onComposerChanged,
			placeholder = Frame.placeholder,
			textBoxRef = Frame.textBoxRef,
			isAssistantResponding = Frame.isAssistantResponding,
			canStopAssistantResponse = Frame.canStopAssistantResponse,
			onSend = Frame.onSend,
			onStop = Frame.onStop,
			maxLines = Frame.maxLines,
			composerDebug = Frame.composerDebug
		})
	})
end