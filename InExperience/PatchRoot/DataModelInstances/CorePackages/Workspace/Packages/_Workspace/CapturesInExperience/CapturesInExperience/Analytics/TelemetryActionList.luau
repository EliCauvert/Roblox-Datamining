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
					entrypointType = function(p1)
						return p1
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
					externalShareSource = function(p1)
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
					triggerType = function(p1)
						return p1
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
					triggerType = function(p1)
						return p1
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
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowDescriptionEdited
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowGalleryItemSelected] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowGalleryItemSelected
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowGalleryNoCapturesAvailable
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowMusicSelected] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowMusicSelected
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end,
					musicAssetId = function(value)
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
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowNextButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end,
					editFlowState = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowReturnButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowReturnButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end,
					editFlowState = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTextOverlayDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimBackButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimBackButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpEditingFlowTrimDoneButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpEditingFlowTrimDoneButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentCreationStarted] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentCreationStarted
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowContinueToDescriptionButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowContinueToEditButtonPressed
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowExited] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowExited
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.XExpMomentsEditingFlowPublished] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.Moments,
					action = eventNamesModule.XExpMomentsEditingFlowPublished
				},
				dynamicCustomFields = {
					creationSessionId = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.CapturesCreateMomentToastViewed] = {
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
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
				overrideName = function()
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