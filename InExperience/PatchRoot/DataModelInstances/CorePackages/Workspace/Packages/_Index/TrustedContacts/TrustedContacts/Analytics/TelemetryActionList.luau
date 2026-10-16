local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local SocialLuaAnalyticsModule = require(TrustedContacts.Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local EventNamesModule = require(script.Parent.EventNames)
local ButtonNamesModule = require(script.Parent.ButtonNames)
local FFlagTCLearnMoreLinkModule = require(TrustedContacts.Flags.FFlagTCLearnMoreLink)
local FFlagTFUpdateAnalyticsModule = require(TrustedContacts.Flags.FFlagTFUpdateAnalytics)

return {
	defaults = {
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/trusted_connections.proto",
		throttlingThousandths = game:DefineFastInt("TrustedContactsAnalyticsThrottlingThousandths", 10000)
	},
	[EventNamesModule.FriendsRenameInfoModalSeen] = {
		description = "Friends rename info modal mounted",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 25 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.FriendsRenameInfoModal }
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCUpsellModalSeen] = {
		description = "TC Upsell modal mounted",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 43 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 50 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 53 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 61 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 64 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.TCEducationModalSeen] = {
		description = "TC Education modal mounted",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 77 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.TCEducationModal }
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FriendsRenameLearnMoreClicked] = {
		description = "Friends rename info modal learn more text clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 95 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.FriendsRenameInfoModal,
					btn = ButtonNamesModule.LearnMore
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TrustedFriendsModalOkClicked] = {
		description = "Trusted friends info modal ok button clicked",
		lastUpdated = { 26, 3, 20 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 114 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCUpsellModal,
					btn = ButtonNamesModule.Ok
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCUpsellCloseClicked] = {
		description = "TC Upsell modal close button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 133 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCUpsellModal,
					btn = ButtonNamesModule.Close
				},
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 141 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 144 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 152 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 155 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.TCUpsellAcceptTrustedConnectionClicked] = {
		description = "TC Upsell modal accept trusted connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 168 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCUpsellModal,
					btn = ButtonNamesModule.AcceptTrustedConnection
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCUpsellAddTrustedConnectionClicked] = {
		description = "TC Upsell modal add trusted connection button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 187 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCUpsellModal,
					btn = ButtonNamesModule.AddTrustedConnection
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCEducationGotItClicked] = {
		description = "TC Education modal got it button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 206 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCEducationModal,
					btn = ButtonNamesModule.GotIt
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCEducationCloseClicked] = {
		description = "TC Education modal close button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 225 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCEducationModal,
					btn = ButtonNamesModule.Close
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCUpsellCancelClicked] = {
		description = "TC Upsell modal cancel button clicked",
		lastUpdated = { 25, 9, 17 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 244 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCUpsellModal,
					btn = ButtonNamesModule.Cancel
				},
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 252 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 255 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 263 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 266 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.TCUpsellAddViaLinkClicked] = {
		description = "TC Upsell modal 'Add via link' button clicked",
		lastUpdated = { 26, 1, 28 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 279 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCUpsellModal,
					btn = ButtonNamesModule.AddViaLink
				},
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 287 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 290 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 298 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 301 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.TrustedFriendsVPCPrologueOpened] = {
		description = "Trusted Friends VPC Prologue open button clicked in TC modal",
		lastUpdated = { 26, 2, 26 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 314 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCUpsellModal,
					btn = ButtonNamesModule.OpenVPCPrologue
				},
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 322 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 325 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 333 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 336 ]]
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.TrustedFriendsVPCAskClicked] = {
		description = "Trusted Friends VPC Prologue Ask button clicked",
		lastUpdated = { 26, 2, 26 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 349 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TrustedFriendsVPCPrologue,
					btn = ButtonNamesModule.Ask
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TrustedFriendsVPCCancelClicked] = {
		description = "Trusted Friends VPC Prologue Cancel button clicked",
		lastUpdated = { 26, 2, 26 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 368 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TrustedFriendsVPCPrologue,
					btn = ButtonNamesModule.Cancel
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCEducationManageConnectionsClicked] = {
		description = "TC Education modal manage connections button clicked",
		lastUpdated = { 25, 6, 4 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 387 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.TCEducationModal,
					btn = ButtonNamesModule.ManageConnections
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCStreamNotificationAcceptClicked] = {
		description = "TC stream notification accept CTA clicked",
		lastUpdated = { 26, 1, 16 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 406 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.StreamNotification,
					btn = ButtonNamesModule.AcceptTrustedConnection
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCToastNotificationAcceptClicked] = {
		description = "TC toast notification accept CTA clicked",
		lastUpdated = { 26, 1, 16 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 425 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = Contexts.ToastNotification,
					btn = ButtonNamesModule.AcceptTrustedConnection
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TCUpsellIsATrustedConnectionNowToastShown] = if FFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell modal 'is a trusted connection now' success toast shown",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 445 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 452 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 455 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 463 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 466 ]]
						return p1
					end
				}
			}
		}
	} else nil,
	[EventNamesModule.TCUpsellInvalidTrustedFriendState] = if FFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell modal encountered an invalid trusted friend state",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 481 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 488 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 491 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 494 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p1) --[[ Line: 502 ]]
						return p1
					end,
					source = function(p1) --[[ Line: 505 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 508 ]]
						return p1
					end
				}
			}
		}
	} else nil,
	[EventNamesModule.TCUpsellAgePrecheckTriggered] = if FFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell facial age estimation precheck triggered",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 523 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p1) --[[ Line: 530 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 533 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p1) --[[ Line: 541 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 544 ]]
						return p1
					end
				}
			}
		}
	} else nil,
	[EventNamesModule.TCUpsellAgePrecheckSucceeded] = if FFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell facial age estimation precheck succeeded",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 559 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p1) --[[ Line: 566 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 569 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p1) --[[ Line: 577 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 580 ]]
						return p1
					end
				}
			}
		}
	} else nil,
	[EventNamesModule.TCUpsellAgePrecheckFailed] = if FFlagTFUpdateAnalyticsModule then {
		description = "TC Upsell facial age estimation precheck failed",
		lastUpdated = { 26, 6, 5 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 595 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = Contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p1) --[[ Line: 602 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 605 ]]
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p1) --[[ Line: 613 ]]
						return p1
					end,
					tfActionsEnum = function(p1) --[[ Line: 616 ]]
						return p1
					end
				}
			}
		}
	} else nil,
	[EventNamesModule.TCUpsellLearnMoreClicked] = if FFlagTCLearnMoreLinkModule then {
		description = "Learn more link clicked",
		lastUpdated = { 12, 3, 26 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 631 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "LearnMoreLink",
					eventContext = Contexts.TCUpsellModal
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil
}