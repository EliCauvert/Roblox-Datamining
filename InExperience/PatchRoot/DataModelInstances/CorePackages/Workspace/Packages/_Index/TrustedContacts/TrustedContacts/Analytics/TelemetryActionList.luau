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
				overrideName = function() --[[ line: 27 ]]
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
				overrideName = function() --[[ line: 45 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p0) --[[ line: 52 ]]
						return p0
					end,
					source = function(p1) --[[ line: 55 ]]
						return p1
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p2) --[[ line: 63 ]]
						return p2
					end,
					source = function(p3) --[[ line: 66 ]]
						return p3
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
				overrideName = function() --[[ line: 79 ]]
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
				overrideName = function() --[[ line: 97 ]]
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
				overrideName = function() --[[ line: 116 ]]
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
				overrideName = function() --[[ line: 135 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.Close
				},
				dynamicCustomFields = {
					modalVariant = function(p4) --[[ line: 143 ]]
						return p4
					end,
					source = function(p5) --[[ line: 146 ]]
						return p5
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p6) --[[ line: 154 ]]
						return p6
					end,
					source = function(p7) --[[ line: 157 ]]
						return p7
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
				overrideName = function() --[[ line: 170 ]]
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
				overrideName = function() --[[ line: 189 ]]
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
				overrideName = function() --[[ line: 208 ]]
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
				overrideName = function() --[[ line: 227 ]]
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
				overrideName = function() --[[ line: 246 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.Cancel
				},
				dynamicCustomFields = {
					modalVariant = function(p8) --[[ line: 254 ]]
						return p8
					end,
					source = function(p9) --[[ line: 257 ]]
						return p9
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p10) --[[ line: 265 ]]
						return p10
					end,
					source = function(p11) --[[ line: 268 ]]
						return p11
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
				overrideName = function() --[[ line: 281 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.AddViaLink
				},
				dynamicCustomFields = {
					modalVariant = function(p12) --[[ line: 289 ]]
						return p12
					end,
					source = function(p13) --[[ line: 292 ]]
						return p13
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p14) --[[ line: 300 ]]
						return p14
					end,
					source = function(p15) --[[ line: 303 ]]
						return p15
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
				overrideName = function() --[[ line: 316 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					eventContext = contexts.TCUpsellModal,
					btn = buttonNamesModule.OpenVPCPrologue
				},
				dynamicCustomFields = {
					modalVariant = function(p16) --[[ line: 324 ]]
						return p16
					end,
					source = function(p17) --[[ line: 327 ]]
						return p17
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p18) --[[ line: 335 ]]
						return p18
					end,
					source = function(p19) --[[ line: 338 ]]
						return p19
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
				overrideName = function() --[[ line: 351 ]]
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
				overrideName = function() --[[ line: 370 ]]
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
				overrideName = function() --[[ line: 389 ]]
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
				overrideName = function() --[[ line: 409 ]]
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
				overrideName = function() --[[ line: 429 ]]
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
				overrideName = function() --[[ line: 449 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p20) --[[ line: 456 ]]
						return p20
					end,
					source = function(p21) --[[ line: 459 ]]
						return p21
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p22) --[[ line: 467 ]]
						return p22
					end,
					source = function(p23) --[[ line: 470 ]]
						return p23
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
				overrideName = function() --[[ line: 485 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					modalVariant = function(p24) --[[ line: 492 ]]
						return p24
					end,
					source = function(p25) --[[ line: 495 ]]
						return p25
					end,
					tfActionsEnum = function(p26) --[[ line: 498 ]]
						return p26
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					modalVariant = function(p27) --[[ line: 506 ]]
						return p27
					end,
					source = function(p28) --[[ line: 509 ]]
						return p28
					end,
					tfActionsEnum = function(p29) --[[ line: 512 ]]
						return p29
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
				overrideName = function() --[[ line: 527 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p30) --[[ line: 534 ]]
						return p30
					end,
					tfActionsEnum = function(p31) --[[ line: 537 ]]
						return p31
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p32) --[[ line: 545 ]]
						return p32
					end,
					tfActionsEnum = function(p33) --[[ line: 548 ]]
						return p33
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
				overrideName = function() --[[ line: 563 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p34) --[[ line: 570 ]]
						return p34
					end,
					tfActionsEnum = function(p35) --[[ line: 573 ]]
						return p35
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p36) --[[ line: 581 ]]
						return p36
					end,
					tfActionsEnum = function(p37) --[[ line: 584 ]]
						return p37
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
				overrideName = function() --[[ line: 599 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = { eventContext = contexts.TCUpsellModal },
				dynamicCustomFields = {
					source = function(p38) --[[ line: 606 ]]
						return p38
					end,
					tfActionsEnum = function(p39) --[[ line: 609 ]]
						return p39
					end
				}
			},
			{
				type = supportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					source = function(p40) --[[ line: 617 ]]
						return p40
					end,
					tfActionsEnum = function(p41) --[[ line: 620 ]]
						return p41
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
				overrideName = function() --[[ line: 635 ]]
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