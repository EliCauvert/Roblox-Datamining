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
				},
				dynamicCustomFields = {
					creationSessionId = function(p4) --[[ line: 209 ]]
						return p4
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowGalleryItemSelected] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 220 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowGalleryItemSelected
				},
				dynamicCustomFields = {
					creationSessionId = function(p5) --[[ line: 228 ]]
						return p5
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 239 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable
				},
				dynamicCustomFields = {
					creationSessionId = function(p6) --[[ line: 247 ]]
						return p6
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 258 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p7) --[[ line: 266 ]]
						return p7
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 277 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p8) --[[ line: 285 ]]
						return p8
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 296 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p9) --[[ line: 304 ]]
						return p9
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicSelected] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 315 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicSelected
				},
				dynamicCustomFields = {
					creationSessionId = function(p10) --[[ line: 323 ]]
						return p10
					end,
					musicAssetId = function(value) --[[ line: 326 ]]
						return value
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowNextButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 337 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowNextButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p11) --[[ line: 345 ]]
						return p11
					end,
					editFlowState = function(p12) --[[ line: 348 ]]
						return p12
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowReturnButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 359 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowReturnButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p13) --[[ line: 367 ]]
						return p13
					end,
					editFlowState = function(p14) --[[ line: 370 ]]
						return p14
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 381 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p15) --[[ line: 389 ]]
						return p15
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 400 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p16) --[[ line: 408 ]]
						return p16
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 419 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p17) --[[ line: 427 ]]
						return p17
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 438 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p18) --[[ line: 446 ]]
						return p18
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 457 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p19) --[[ line: 465 ]]
						return p19
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 476 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p20) --[[ line: 484 ]]
						return p20
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentCreationStarted] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 495 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentCreationStarted
				},
				dynamicCustomFields = {
					creationSessionId = function(p21) --[[ line: 503 ]]
						return p21
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 514 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p22) --[[ line: 522 ]]
						return p22
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 533 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p23) --[[ line: 541 ]]
						return p23
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowExited] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 552 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowExited
				},
				dynamicCustomFields = {
					creationSessionId = function(p24) --[[ line: 560 ]]
						return p24
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowPublished] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 571 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowPublished
				},
				dynamicCustomFields = {
					creationSessionId = function(p25) --[[ line: 579 ]]
						return p25
					end
				}
			}
		}
	},
	[eventNamesModule.CapturesCreateMomentToastViewed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 590 ]]
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
				overrideName = function() --[[ line: 604 ]]
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