local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local chatComposerModule = require(script.Parent.ChatComposer)
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), chatComposerModule (ref)
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		Composer = reactModule.createElement(chatComposerModule, {
			LayoutOrder = 1,
			text = p1.composerText,
			composerErrorText = p1.composerErrorText,
			onChanged = p1.onComposerChanged,
			placeholder = p1.placeholder,
			textBoxRef = p1.textBoxRef,
			isAssistantResponding = p1.isAssistantResponding,
			canStopAssistantResponse = p1.canStopAssistantResponse,
			canSendWhileResponding = p1.canSendWhileResponding,
			onSend = p1.onSend,
			onStop = p1.onStop,
			maxLines = p1.maxLines,
			composerDebug = p1.composerDebug
		})
	})
end