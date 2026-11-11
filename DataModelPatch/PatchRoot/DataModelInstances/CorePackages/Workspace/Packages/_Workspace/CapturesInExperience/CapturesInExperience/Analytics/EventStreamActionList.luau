local Parent = script.Parent.Parent.Parent
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.EventNames)

return {
	[EventNamesModule.CapturesActivatedChrome] = {
		additionalInfo = { btn = EventNamesModule.CapturesActivatedChrome },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesActivatedInGameMenu] = {
		additionalInfo = { btn = EventNamesModule.CapturesActivatedInGameMenu },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselClosed] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselClosed },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselClosedByKeyboard] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselClosedByKeyboard },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselNavigated] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselNavigated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { direction = DashModule.identity }
	},
	[EventNamesModule.CapturesCarouselNavigatedByKeyboard] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesCarouselNavigatedByKeyboard
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { direction = DashModule.identity }
	},
	[EventNamesModule.CapturesCarouselOpened] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselOpened },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesCarouselSaveToExternalStorageActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselScrolled] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselScrolled },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { direction = DashModule.identity }
	},
	[EventNamesModule.CapturesCarouselVideoExpanded] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselVideoExpanded },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselVideoMuteButtonActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesCarouselVideoMuteButtonActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselVideoSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesCarouselVideoSaveToExternalStorageActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselVideoShareActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesCarouselVideoShareActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselVideoShrank] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselVideoShrank },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCarouselShareActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesCarouselShareActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesCoreGuiDisabled] = {
		additionalInfo = { btn = EventNamesModule.CapturesCoreGuiDisabled },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { allTypeChanged = DashModule.identity }
	},
	[EventNamesModule.CapturesCoreGuiEnabled] = {
		additionalInfo = { btn = EventNamesModule.CapturesCoreGuiEnabled },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { allTypeChanged = DashModule.identity }
	},
	[EventNamesModule.CapturesDeactivatedChrome] = {
		additionalInfo = { btn = EventNamesModule.CapturesDeactivatedChrome },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesDeactivatedInGameMenu] = {
		additionalInfo = { btn = EventNamesModule.CapturesDeactivatedInGameMenu },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesDeleteActivatedInCaptureManager] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesDeleteActivatedInCaptureManager
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesDeleteActivatedInCarousel] = {
		additionalInfo = { btn = EventNamesModule.CapturesDeleteActivatedInCarousel },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesVideoDeleteActivatedInCarousel] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesVideoDeleteActivatedInCarousel
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesDeleteWarningModalCancelPressed] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesDeleteWarningModalCancelPressed
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesDeleteWarningModalDeletePressed] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesDeleteWarningModalDeletePressed
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesDeleteWarningModalOptedOut] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesDeleteWarningModalOptedOut
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesDesktopHotkeyCaptureTriggered] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesDesktopHotkeyCaptureTriggered
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesEntrypointActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesEntrypointActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesEntrypointVideoActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesEntrypointVideoActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesEntrypointVideoDeactivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesEntrypointVideoDeactivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesEntrypointDragged] = {
		additionalInfo = { btn = EventNamesModule.CapturesEntrypointDragged },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesEntrypointHotkeyTooltipActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesEntrypointHotkeyTooltipActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.UserSeen
	},
	[EventNamesModule.CapturesEntrypointViewed] = {
		additionalInfo = { btn = EventNamesModule.CapturesEntrypointViewed },
		context = Contexts.Captures,
		eventType = EventTypes.UserSeen
	},
	[EventNamesModule.CapturesManagerBulkSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesManagerBulkSaveToExternalStorageActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesManagerShareVideoActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesManagerShareVideoActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesManagerItemActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesManagerItemActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesManagerOpened] = {
		additionalInfo = { btn = EventNamesModule.CapturesManagerOpened },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesManagerSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesManagerSaveToExternalStorageActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesManagerSelectAllActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesManagerSelectAllActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesManagerShareActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesManagerShareActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesMigratedLegacyVideoRecordActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesMigratedLegacyVideoRecordActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesMigratedLegacyVideoRecordDeactivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesMigratedLegacyVideoRecordDeactivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesPageOpenedInGameMenu] = {
		context = Contexts.Captures,
		eventType = EventTypes.PageLoad
	},
	[EventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesSavePermissionModalAllowPressed] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesSavePermissionModalAllowPressed
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesSavePermissionModalCancelPressed] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesSavePermissionModalCancelPressed
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesShareFromNonStandardServer] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesShareFromNonStandardServer
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesShareToastButtonActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesShareToastButtonActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesVideoShareToastButtonActivated] = {
		additionalInfo = {
			btn = EventNamesModule.CapturesVideoShareToastButtonActivated
		},
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesShareToastViewed] = {
		additionalInfo = { btn = EventNamesModule.CapturesShareToastViewed },
		context = Contexts.Captures,
		eventType = EventTypes.UserSeen
	},
	[EventNamesModule.CapturesVideoShareToastViewed] = {
		additionalInfo = { btn = EventNamesModule.CapturesVideoShareToastViewed },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesShowMoreInGameMenu] = {
		additionalInfo = { btn = EventNamesModule.CapturesShowMoreInGameMenu },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesVideoCaptureDevApiStarted] = {
		additionalInfo = { btn = EventNamesModule.CapturesVideoCaptureDevApiStarted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesVideoCaptureDevApiEnded] = {
		additionalInfo = { btn = EventNamesModule.CapturesVideoCaptureDevApiEnded },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturesViewToastButtonActivated] = {
		additionalInfo = { btn = EventNamesModule.CapturesViewToastButtonActivated },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.SaveCapturesPromptVideoAccepted] = {
		additionalInfo = { btn = EventNamesModule.SaveCapturesPromptVideoAccepted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.SaveCapturesPromptVideoPrompted] = {
		additionalInfo = { btn = EventNamesModule.SaveCapturesPromptVideoPrompted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.SaveCapturesPromptVideoRejected] = {
		additionalInfo = { btn = EventNamesModule.SaveCapturesPromptVideoRejected },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.SaveCapturesPromptAccepted] = {
		additionalInfo = { btn = EventNamesModule.SaveCapturesPromptAccepted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick,
		formatRulesForAdditionalInfo = {
			savedCaptures = DashModule.identity,
			totalCaptures = DashModule.identity
		}
	},
	[EventNamesModule.SaveCapturesPromptRejected] = {
		additionalInfo = { btn = EventNamesModule.SaveCapturesPromptRejected },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.SaveCapturesPromptViewed] = {
		additionalInfo = { btn = EventNamesModule.SaveCapturesPromptViewed },
		context = Contexts.Captures,
		eventType = EventTypes.UserSeen
	},
	[EventNamesModule.ShareCaptureGenerateLinkFailed] = {
		additionalInfo = { btn = EventNamesModule.ShareCaptureGenerateLinkFailed },
		context = Contexts.Captures,
		eventType = EventTypes.GenerateLinkFailed,
		formatRulesForAdditionalInfo = { httpError = DashModule.identity }
	},
	[EventNamesModule.ShareCapturePromptAccepted] = {
		additionalInfo = { btn = EventNamesModule.ShareCapturePromptAccepted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.ShareCapturePromptRejected] = {
		additionalInfo = { btn = EventNamesModule.ShareCapturePromptRejected },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.ShareCapturePromptVideoAccepted] = {
		additionalInfo = { btn = EventNamesModule.ShareCapturePromptVideoAccepted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.ShareCapturePromptVideoPrompted] = {
		additionalInfo = { btn = EventNamesModule.ShareCapturePromptVideoPrompted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.ShareCapturePromptVideoRejected] = {
		additionalInfo = { btn = EventNamesModule.ShareCapturePromptVideoRejected },
		context = Contexts.Captures,
		eventType = EventTypes.UserSeen
	},
	[EventNamesModule.ShareCapturePromptViewed] = {
		additionalInfo = { btn = EventNamesModule.ShareCapturePromptViewed },
		context = Contexts.Captures,
		eventType = EventTypes.UserSeen
	},
	[EventNamesModule.CapturePermissionsPromptAccepted] = {
		additionalInfo = { btn = EventNamesModule.CapturePermissionsPromptAccepted },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturePermissionsPromptRejected] = {
		additionalInfo = { btn = EventNamesModule.CapturePermissionsPromptRejected },
		context = Contexts.Captures,
		eventType = EventTypes.ButtonClick
	},
	[EventNamesModule.CapturePermissionsPromptViewed] = {
		additionalInfo = { btn = EventNamesModule.CapturePermissionsPromptViewed },
		context = Contexts.Captures,
		eventType = EventTypes.UserSeen
	}
}