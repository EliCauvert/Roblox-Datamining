local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.CapturesActivatedInGameMenu] = {
		name = game:DefineFastString("CapturesActivatedInGameMenu", "CapturesActivatedInGameMenu")
	},
	[eventNamesModule.CapturesCarouselOpened] = {
		name = game:DefineFastString("CapturesCarouselOpened", "CapturesCarouselOpened")
	},
	[eventNamesModule.CapturesDeactivatedInGameMenu] = {
		name = game:DefineFastString("CapturesDeactivatedInGameMenu", "CapturesDeactivatedInGameMenu")
	},
	[eventNamesModule.CapturesEntrypointActivated] = {
		name = game:DefineFastString("CapturesEntrypointActivated", "CapturesEntrypointActivated")
	},
	[eventNamesModule.CapturesPageOpenedInGameMenu] = {
		name = game:DefineFastString("CapturesPageOpenedInGameMenu", "CapturesPageOpenedInGameMenu")
	},
	[eventNamesModule.CapturesShareFromNonStandardServer] = {
		name = game:DefineFastString("CapturesShareToastButtonActivated", "CapturesShareToastButtonActivated")
	},
	[eventNamesModule.CapturesShareToastButtonActivated] = {
		name = game:DefineFastString("CapturesShareToastButtonActivated", "CapturesShareToastButtonActivated")
	},
	[eventNamesModule.ShareCaptureGenerateLinkFailed] = {
		name = game:DefineFastString("ShareCaptureGenerateLinkFailed", "ShareCaptureGenerateLinkFailed")
	},
	[eventNamesModule.ShareCapturePromptAccepted] = {
		name = game:DefineFastString("ShareCapturePromptAccepted", "ShareCapturePromptAccepted")
	},
	[eventNamesModule.ShareCapturePromptRejected] = {
		name = game:DefineFastString("ShareCapturePromptRejected", "ShareCapturePromptRejected")
	}
}