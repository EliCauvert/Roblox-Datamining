local socialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("CapturesTelemetryThrottlingThousandths", 1000)
	},
	[eventNamesModule.CapturesActivatedInGameMenu] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesActivatedChrome] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesCarouselOpened] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesCarouselVideoExpanded] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesCarouselVideoMuteButtonActivated] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesCarouselVideoShrank] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesDeactivatedInGameMenu] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesDeactivatedChrome] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesEntrypointActivated] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					entrypointType = function(p0) --[[ line: 77 ]]
						return p0
					end
				}
			}
		}
	},
	[eventNamesModule.CapturesEntrypointLatency] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[eventNamesModule.CapturesLegacyVideoRecordingDuration] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[eventNamesModule.CapturesPageOpenedInGameMenu] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesShareFromNonStandardServer] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesShareLatency] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					externalShareSource = function(p1) --[[ line: 117 ]]
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.CapturesShareToastButtonActivated] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturesVideoCaptureStarted] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					triggerType = function(p2) --[[ line: 136 ]]
						return p2
					end
				}
			}
		}
	},
	[eventNamesModule.CapturesVideoCaptureStopped] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					triggerType = function(p3) --[[ line: 148 ]]
						return p3
					end
				}
			}
		}
	},
	[eventNamesModule.ShareCaptureGenerateLinkFailed] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ShareCapturePromptAccepted] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.ShareCapturePromptRejected] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturePermissionsPromptAccepted] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturePermissionsPromptRejected] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.CapturePermissionsPromptViewed] = {
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.XExpEditingFlowDescriptionEdited] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 201 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowDescriptionEdited
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowGalleryItemSelected] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 215 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowGalleryItemSelected
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 229 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 243 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicBackButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 257 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 271 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicDoneButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicSelected] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 285 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicSelected
				},
				dynamicCustomFields = {
					musicAssetId = function(value) --[[ line: 293 ]]
						return value.musicAssetId
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowNextButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 304 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowNextButtonPressed
				},
				dynamicCustomFields = {
					editFlowState = function(p4) --[[ line: 312 ]]
						return p4.editFlowState
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowReturnButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 323 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowReturnButtonPressed
				},
				dynamicCustomFields = {
					editFlowState = function(p5) --[[ line: 331 ]]
						return p5.editFlowState
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 342 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 356 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 370 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 384 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimBackButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 398 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 412 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimDoneButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 426 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 440 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowExited] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 454 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowExited
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowPublished] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 468 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowPublished
				}
			}
		}
	},
	[eventNamesModule.CapturesCreateMomentToastViewed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 482 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Captures,
					btn = eventNamesModule.CapturesCreateMomentToastViewed
				}
			}
		}
	},
	[eventNamesModule.CapturesCreateMomentToastButtonActivated] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 496 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Captures,
					btn = eventNamesModule.CapturesCreateMomentToastButtonActivated
				}
			}
		}
	}
}