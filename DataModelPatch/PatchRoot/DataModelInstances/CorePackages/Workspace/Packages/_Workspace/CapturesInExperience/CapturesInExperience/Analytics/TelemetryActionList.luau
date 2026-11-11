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
					entrypointType = function(p1)
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
					externalShareSource = function(p1)
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
					triggerType = function(p1)
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
					triggerType = function(p1)
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
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowDescriptionEdited
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowGalleryItemSelected] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowGalleryItemSelected
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicBackButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicBackButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicDoneButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicDoneButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowMusicSelected] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowMusicSelected
				},
				dynamicCustomFields = {
					musicAssetId = function(p1)
						return p1.musicAssetId
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowNextButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowNextButtonPressed
				},
				dynamicCustomFields = {
					editFlowState = function(p1)
						return p1.editFlowState
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowReturnButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowReturnButtonPressed
				},
				dynamicCustomFields = {
					editFlowState = function(p1)
						return p1.editFlowState
					end
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTextOverlayButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTextOverlayButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTrimBackButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTrimBackButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTrimButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTrimButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpEditingFlowTrimDoneButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpEditingFlowTrimDoneButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowExited] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowExited
				}
			}
		}
	},
	[EventNamesModule.XExpMomentsEditingFlowPublished] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.Moments,
					action = EventNamesModule.XExpMomentsEditingFlowPublished
				}
			}
		}
	},
	[EventNamesModule.CapturesCreateMomentToastViewed] = {
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
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
				overrideName = function()
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