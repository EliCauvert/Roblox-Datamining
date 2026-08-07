local parent = script.Parent.Parent.Parent
local dashModule = require(parent.Dash)
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.EventNames)

return {
	[eventNamesModule.CapturesActivatedChrome] = {
		additionalInfo = { btn = eventNamesModule.CapturesActivatedChrome },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesActivatedInGameMenu] = {
		additionalInfo = { btn = eventNamesModule.CapturesActivatedInGameMenu },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselClosed] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselClosed },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselClosedByKeyboard] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselClosedByKeyboard },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselNavigated] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselNavigated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { direction = dashModule.identity }
	},
	[eventNamesModule.CapturesCarouselNavigatedByKeyboard] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesCarouselNavigatedByKeyboard
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { direction = dashModule.identity }
	},
	[eventNamesModule.CapturesCarouselOpened] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselOpened },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesCarouselSaveToExternalStorageActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselScrolled] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselScrolled },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { direction = dashModule.identity }
	},
	[eventNamesModule.CapturesCarouselVideoExpanded] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselVideoExpanded },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselVideoMuteButtonActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesCarouselVideoMuteButtonActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselVideoSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesCarouselVideoSaveToExternalStorageActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselVideoShareActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesCarouselVideoShareActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselVideoShrank] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselVideoShrank },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCarouselShareActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesCarouselShareActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesCoreGuiDisabled] = {
		additionalInfo = { btn = eventNamesModule.CapturesCoreGuiDisabled },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { allTypeChanged = dashModule.identity }
	},
	[eventNamesModule.CapturesCoreGuiEnabled] = {
		additionalInfo = { btn = eventNamesModule.CapturesCoreGuiEnabled },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = { allTypeChanged = dashModule.identity }
	},
	[eventNamesModule.CapturesDeactivatedChrome] = {
		additionalInfo = { btn = eventNamesModule.CapturesDeactivatedChrome },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesDeactivatedInGameMenu] = {
		additionalInfo = { btn = eventNamesModule.CapturesDeactivatedInGameMenu },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesDeleteActivatedInCaptureManager] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesDeleteActivatedInCaptureManager
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesDeleteActivatedInCarousel] = {
		additionalInfo = { btn = eventNamesModule.CapturesDeleteActivatedInCarousel },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesVideoDeleteActivatedInCarousel] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesVideoDeleteActivatedInCarousel
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesDeleteWarningModalCancelPressed] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesDeleteWarningModalCancelPressed
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesDeleteWarningModalDeletePressed] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesDeleteWarningModalDeletePressed
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesDeleteWarningModalOptedOut] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesDeleteWarningModalOptedOut
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesDesktopHotkeyCaptureTriggered] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesDesktopHotkeyCaptureTriggered
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesEntrypointActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesEntrypointActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesEntrypointVideoActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesEntrypointVideoActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesEntrypointVideoDeactivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesEntrypointVideoDeactivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesEntrypointVideoDeactivatedAutomatically
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesEntrypointDragged] = {
		additionalInfo = { btn = eventNamesModule.CapturesEntrypointDragged },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesEntrypointHotkeyTooltipActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesEntrypointHotkeyTooltipActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.UserSeen
	},
	[eventNamesModule.CapturesEntrypointViewed] = {
		additionalInfo = { btn = eventNamesModule.CapturesEntrypointViewed },
		context = contexts.Captures,
		eventType = eventTypes.UserSeen
	},
	[eventNamesModule.CapturesManagerBulkSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesManagerBulkSaveToExternalStorageActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesManagerShareVideoActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesManagerShareVideoActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesManagerItemActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesManagerItemActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesManagerOpened] = {
		additionalInfo = { btn = eventNamesModule.CapturesManagerOpened },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesManagerSaveToExternalStorageActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesManagerSaveToExternalStorageActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesManagerSelectAllActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesManagerSelectAllActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesManagerShareActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesManagerShareActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesMigratedLegacyVideoRecordActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesMigratedLegacyVideoRecordActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesMigratedLegacyVideoRecordDeactivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesMigratedLegacyVideoRecordDeactivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesPageOpenedInGameMenu] = {
		context = contexts.Captures,
		eventType = eventTypes.PageLoad
	},
	[eventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesSavedToDeviceToastOpenButtonActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesSavePermissionModalAllowPressed] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesSavePermissionModalAllowPressed
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesSavePermissionModalCancelPressed] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesSavePermissionModalCancelPressed
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesShareFromNonStandardServer] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesShareFromNonStandardServer
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesShareToastButtonActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesShareToastButtonActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesVideoShareToastButtonActivated] = {
		additionalInfo = {
			btn = eventNamesModule.CapturesVideoShareToastButtonActivated
		},
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesShareToastViewed] = {
		additionalInfo = { btn = eventNamesModule.CapturesShareToastViewed },
		context = contexts.Captures,
		eventType = eventTypes.UserSeen
	},
	[eventNamesModule.CapturesVideoShareToastViewed] = {
		additionalInfo = { btn = eventNamesModule.CapturesVideoShareToastViewed },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesShowMoreInGameMenu] = {
		additionalInfo = { btn = eventNamesModule.CapturesShowMoreInGameMenu },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesVideoCaptureDevApiStarted] = {
		additionalInfo = { btn = eventNamesModule.CapturesVideoCaptureDevApiStarted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesVideoCaptureDevApiEnded] = {
		additionalInfo = { btn = eventNamesModule.CapturesVideoCaptureDevApiEnded },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturesViewToastButtonActivated] = {
		additionalInfo = { btn = eventNamesModule.CapturesViewToastButtonActivated },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.SaveCapturesPromptVideoAccepted] = {
		additionalInfo = { btn = eventNamesModule.SaveCapturesPromptVideoAccepted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.SaveCapturesPromptVideoPrompted] = {
		additionalInfo = { btn = eventNamesModule.SaveCapturesPromptVideoPrompted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.SaveCapturesPromptVideoRejected] = {
		additionalInfo = { btn = eventNamesModule.SaveCapturesPromptVideoRejected },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.SaveCapturesPromptAccepted] = {
		additionalInfo = { btn = eventNamesModule.SaveCapturesPromptAccepted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick,
		formatRulesForAdditionalInfo = {
			savedCaptures = dashModule.identity,
			totalCaptures = dashModule.identity
		}
	},
	[eventNamesModule.SaveCapturesPromptRejected] = {
		additionalInfo = { btn = eventNamesModule.SaveCapturesPromptRejected },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.SaveCapturesPromptViewed] = {
		additionalInfo = { btn = eventNamesModule.SaveCapturesPromptViewed },
		context = contexts.Captures,
		eventType = eventTypes.UserSeen
	},
	[eventNamesModule.ShareCaptureGenerateLinkFailed] = {
		additionalInfo = { btn = eventNamesModule.ShareCaptureGenerateLinkFailed },
		context = contexts.Captures,
		eventType = eventTypes.GenerateLinkFailed,
		formatRulesForAdditionalInfo = { httpError = dashModule.identity }
	},
	[eventNamesModule.ShareCapturePromptAccepted] = {
		additionalInfo = { btn = eventNamesModule.ShareCapturePromptAccepted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.ShareCapturePromptRejected] = {
		additionalInfo = { btn = eventNamesModule.ShareCapturePromptRejected },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.ShareCapturePromptVideoAccepted] = {
		additionalInfo = { btn = eventNamesModule.ShareCapturePromptVideoAccepted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.ShareCapturePromptVideoPrompted] = {
		additionalInfo = { btn = eventNamesModule.ShareCapturePromptVideoPrompted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.ShareCapturePromptVideoRejected] = {
		additionalInfo = { btn = eventNamesModule.ShareCapturePromptVideoRejected },
		context = contexts.Captures,
		eventType = eventTypes.UserSeen
	},
	[eventNamesModule.ShareCapturePromptViewed] = {
		additionalInfo = { btn = eventNamesModule.ShareCapturePromptViewed },
		context = contexts.Captures,
		eventType = eventTypes.UserSeen
	},
	[eventNamesModule.CapturePermissionsPromptAccepted] = {
		additionalInfo = { btn = eventNamesModule.CapturePermissionsPromptAccepted },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturePermissionsPromptRejected] = {
		additionalInfo = { btn = eventNamesModule.CapturePermissionsPromptRejected },
		context = contexts.Captures,
		eventType = eventTypes.ButtonClick
	},
	[eventNamesModule.CapturePermissionsPromptViewed] = {
		additionalInfo = { btn = eventNamesModule.CapturePermissionsPromptViewed },
		context = contexts.Captures,
		eventType = eventTypes.UserSeen
	}
}