local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.CapturesActivatedInGameMenu] = {
		name = game:DefineFastString("CapturesActivatedInGameMenu", "CapturesActivatedInGameMenu")
	},
	[EventNamesModule.CapturesCarouselOpened] = {
		name = game:DefineFastString("CapturesCarouselOpened", "CapturesCarouselOpened")
	},
	[EventNamesModule.CapturesDeactivatedInGameMenu] = {
		name = game:DefineFastString("CapturesDeactivatedInGameMenu", "CapturesDeactivatedInGameMenu")
	},
	[EventNamesModule.CapturesEntrypointActivated] = {
		name = game:DefineFastString("CapturesEntrypointActivated", "CapturesEntrypointActivated")
	},
	[EventNamesModule.CapturesPageOpenedInGameMenu] = {
		name = game:DefineFastString("CapturesPageOpenedInGameMenu", "CapturesPageOpenedInGameMenu")
	},
	[EventNamesModule.CapturesShareFromNonStandardServer] = {
		name = game:DefineFastString("CapturesShareToastButtonActivated", "CapturesShareToastButtonActivated")
	},
	[EventNamesModule.CapturesShareToastButtonActivated] = {
		name = game:DefineFastString("CapturesShareToastButtonActivated", "CapturesShareToastButtonActivated")
	},
	[EventNamesModule.ShareCaptureGenerateLinkFailed] = {
		name = game:DefineFastString("ShareCaptureGenerateLinkFailed", "ShareCaptureGenerateLinkFailed")
	},
	[EventNamesModule.ShareCapturePromptAccepted] = {
		name = game:DefineFastString("ShareCapturePromptAccepted", "ShareCapturePromptAccepted")
	},
	[EventNamesModule.ShareCapturePromptRejected] = {
		name = game:DefineFastString("ShareCapturePromptRejected", "ShareCapturePromptRejected")
	}
}