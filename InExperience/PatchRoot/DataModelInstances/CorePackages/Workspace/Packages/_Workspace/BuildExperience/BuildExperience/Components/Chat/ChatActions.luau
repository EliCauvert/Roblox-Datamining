local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local chatComposerModule = require(script.Parent.ChatComposer)
local view = foundationModule.View

return function(p0) --[[ line: 28 | named "ChatActions" ]]
	-- upvalues: reactModule (ref), view (ref), chatComposerModule (ref)
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		Composer = reactModule.createElement(chatComposerModule, {
			LayoutOrder = 1,
			text = p0.composerText,
			composerErrorText = p0.composerErrorText,
			onChanged = p0.onComposerChanged,
			placeholder = p0.placeholder,
			textBoxRef = p0.textBoxRef,
			isAssistantResponding = p0.isAssistantResponding,
			canStopAssistantResponse = p0.canStopAssistantResponse,
			canSendWhileResponding = p0.canSendWhileResponding,
			onSend = p0.onSend,
			onStop = p0.onStop,
			maxLines = p0.maxLines,
			composerDebug = p0.composerDebug
		})
	})
end