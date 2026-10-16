local SocialLuaAnalyticsModule = require(script.Parent.Parent.Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("CapturesTelemetryThrottlingThousandths", 1000)
	},
	[EventNamesModule.CapturesActivatedInGameMenu] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesActivatedChrome] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesCarouselOpened] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesCarouselVideoExpanded] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesCarouselVideoMuteButtonActivated] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesCarouselVideoShrank] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesDeactivatedInGameMenu] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesDeactivatedChrome] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesEntrypointActivated] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					entrypointType = function(p1) --[[ Line: 77 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.CapturesEntrypointLatency] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[EventNamesModule.CapturesLegacyVideoRecordingDuration] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryStat }
		}
	},
	[EventNamesModule.CapturesPageOpenedInGameMenu] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesShareFromNonStandardServer] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesShareLatency] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					externalShareSource = function(p1) --[[ Line: 117 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.CapturesShareToastButtonActivated] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturesVideoCaptureStarted] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					triggerType = function(p1) --[[ Line: 136 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.CapturesVideoCaptureStopped] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					triggerType = function(p1) --[[ Line: 148 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.ShareCaptureGenerateLinkFailed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ShareCapturePromptAccepted] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.ShareCapturePromptRejected] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturePermissionsPromptAccepted] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturePermissionsPromptRejected] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CapturePermissionsPromptViewed] = {
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.XExpEditingFlowDescriptionEdited] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 201 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowDescriptionEdited
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 209 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowGalleryItemSelected] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 220 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowGalleryItemSelected
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 228 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 239 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 247 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicBackButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 258 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 266 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 277 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 285 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicDoneButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 296 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 304 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicSelected] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 315 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicSelected
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 323 ]]
						return p1
					end,
					musicAssetId = function(p1) --[[ Line: 326 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowNextButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 337 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowNextButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 345 ]]
						return p1
					end,
					editFlowState = function(p1) --[[ Line: 348 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowReturnButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 359 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowReturnButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 367 ]]
						return p1
					end,
					editFlowState = function(p1) --[[ Line: 370 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 381 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 389 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTextOverlayButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 400 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTextOverlayButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 408 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 419 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 427 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTrimBackButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 438 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTrimBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 446 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTrimButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 457 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTrimButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 465 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTrimDoneButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 476 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTrimDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 484 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpMomentCreationStarted] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 495 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentCreationStarted
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 503 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 514 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 522 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 533 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 541 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowExited] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 552 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowExited
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 560 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowPublished] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 571 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowPublished
				},
				dynamicCustomFields = {
					creationSessionId = function(p1) --[[ Line: 579 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.CapturesCreateMomentToastViewed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 590 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.Captures,
					btn = EventNamesModule.CapturesCreateMomentToastViewed
				}
			}
		}
	},
	[EventNamesModule.CapturesCreateMomentToastButtonActivated] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 604 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Captures,
					btn = EventNamesModule.CapturesCreateMomentToastButtonActivated
				}
			}
		}
	}
}