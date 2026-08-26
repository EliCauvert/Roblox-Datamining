local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local eventNamesModule = require(script.Parent.EventNames)
local buttonNamesModule = require(script.Parent.ButtonNames)
local fFlagTFUpdateAnalyticsModule = require(trustedContacts.Flags.FFlagTFUpdateAnalytics)

return {
	defaults = {
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/trusted_connections.proto",
		throttlingThousandths = game:DefineFastInt("TrustedContactsAnalyticsThrottlingThousandths", 10000)
	},
	[eventNamesModule.FriendsRenameInfoModalSeen] = {
		description = "Friends rename info modal mounted",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.FriendsRenameInfoModal }
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCUpsellModalSeen] = {
		description = "TC Upsell modal mounted",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.TCEducationModalSeen] = {
		description = "TC Education modal mounted",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCEducationModal }
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.FriendsRenameLearnMoreClicked] = {
		description = "Friends rename info modal learn more text clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.FriendsRenameInfoModal,
					btn = buttonNamesModule.LearnMore
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TrustedFriendsModalOkClicked] = {
		description = "Trusted friends info modal ok button clicked",
		lastUpdated = { 26, 3, 20 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.Ok
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCUpsellCloseClicked] = {
		description = "TC Upsell modal close button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.Close
				},
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.TCUpsellAcceptTrustedConnectionClicked] = {
		description = "TC Upsell modal accept trusted connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.AcceptTrustedConnection
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCUpsellAddTrustedConnectionClicked] = {
		description = "TC Upsell modal add trusted connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.AddTrustedConnection
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCEducationGotItClicked] = {
		description = "TC Education modal got it button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCEducationModal,
					btn = buttonNamesModule.GotIt
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCEducationCloseClicked] = {
		description = "TC Education modal close button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCEducationModal,
					btn = buttonNamesModule.Close
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCUpsellCancelClicked] = {
		description = "TC Upsell modal cancel button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.Cancel
				},
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.TCUpsellAddViaLinkClicked] = {
		description = "TC Upsell modal 'Add via link' button clicked",
		lastUpdated = { 26, 1, 28 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.AddViaLink
				},
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.TrustedFriendsVPCPrologueOpened] = {
		description = "Trusted Friends VPC Prologue open button clicked in TC modal",
		lastUpdated = { 26, 2, 26 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.OpenVPCPrologue
				},
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			}
		}
	},
	[eventNamesModule.TrustedFriendsVPCAskClicked] = {
		description = "Trusted Friends VPC Prologue Ask button clicked",
		lastUpdated = { 26, 2, 26 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TrustedFriendsVPCPrologue,
					btn = buttonNamesModule.Ask
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TrustedFriendsVPCCancelClicked] = {
		description = "Trusted Friends VPC Prologue Cancel button clicked",
		lastUpdated = { 26, 2, 26 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TrustedFriendsVPCPrologue,
					btn = buttonNamesModule.Cancel
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCEducationManageConnectionsClicked] = {
		description = "TC Education modal manage connections button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCEducationModal,
					btn = buttonNamesModule.ManageConnections
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCStreamNotificationAcceptClicked] = if require(parent.SharedFlags).FFlagTCStreamNotifEventReceiver then {
		description = "TC stream notification accept CTA clicked",
		lastUpdated = { 26, 1, 16 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.StreamNotification,
					btn = buttonNamesModule.AcceptTrustedConnection
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[eventNamesModule.TCToastNotificationAcceptClicked] = {
		description = "TC toast notification accept CTA clicked",
		lastUpdated = { 26, 1, 16 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.ToastNotification,
					btn = buttonNamesModule.AcceptTrustedConnection
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[eventNamesModule.TCUpsellIsATrustedConnectionNowToastShown] = if fFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell modal 'is a trusted connection now' success toast shown",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end
				}
			}
		}
	} else nil,
	[eventNamesModule.TCUpsellInvalidTrustedFriendState] = if fFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell modal encountered an invalid trusted friend state",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1)
						return p1
					end,
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			}
		}
	} else nil,
	[eventNamesModule.TCUpsellAgePrecheckTriggered] = if fFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell facial age estimation precheck triggered",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			}
		}
	} else nil,
	[eventNamesModule.TCUpsellAgePrecheckSucceeded] = if fFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell facial age estimation precheck succeeded",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			}
		}
	} else nil,
	[eventNamesModule.TCUpsellAgePrecheckFailed] = if fFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell facial age estimation precheck failed",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p1)
						return p1
					end,
					tfActionsEnum = function(p1)
						return p1
					end
				}
			}
		}
	} else nil,
	[eventNamesModule.TCUpsellLearnMoreClicked] = if require(trustedContacts.Flags.FFlagTCLearnMoreLink) then {
		description = "Learn more link clicked",
		lastUpdated = { 12, 3, 26 },
		backendsList = {
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "LearnMoreLink",
					eventContext = contexts.TCUpsellModal
				}
			},
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}