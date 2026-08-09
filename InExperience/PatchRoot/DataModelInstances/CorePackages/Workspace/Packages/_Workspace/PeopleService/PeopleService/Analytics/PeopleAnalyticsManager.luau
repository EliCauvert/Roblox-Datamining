local telemetryService = game:GetService("TelemetryService")
local peopleService = script:FindFirstAncestor("PeopleService")
local gameInviteModule = require(peopleService.Parent.GameInvite)
local flagsModule = require(peopleService.Flags)
local getFIntInspectButtonThrottleHundredthsPercent = flagsModule.GetFIntInspectButtonThrottleHundredthsPercent
local getFIntGameInviteEntryPointThrottleHundredthsPercent = flagsModule.GetFIntGameInviteEntryPointThrottleHundredthsPercent
local getFIntMuteAllThrottleHundredthsPercent = flagsModule.GetFIntMuteAllThrottleHundredthsPercent
local getFIntUnmuteAllThrottleHundredthsPercent = flagsModule.GetFIntUnmuteAllThrottleHundredthsPercent
local getFIntMutePlayerThrottleHundredthsPercent = flagsModule.GetFIntMutePlayerThrottleHundredthsPercent
local getFIntUnmutePlayerThrottleHundredthsPercent = flagsModule.GetFIntUnmutePlayerThrottleHundredthsPercent
local getFIntRequestFriendshipThrottleHundredthsPercent = flagsModule.GetFIntRequestFriendshipThrottleHundredthsPercent
local getFIntMuteSelfThrottleHundredthsPercent = flagsModule.GetFIntMuteSelfThrottleHundredthsPercent
local getFIntUnmuteSelfThrottleHundredthsPercent = flagsModule.GetFIntUnmuteSelfThrottleHundredthsPercent
local getFIntBlockUserButtonClickThrottleHundredthsPercent = flagsModule.GetFIntBlockUserButtonClickThrottleHundredthsPercent
local getFIntBlockUserThrottleHundredthsPercent = flagsModule.GetFIntBlockUserThrottleHundredthsPercent
local getFIntUnblockUserThrottleHundredthsPercent = flagsModule.GetFIntUnblockUserThrottleHundredthsPercent
local getFIntPeoplePageLayoutChangedThrottleHundredthsPercent = flagsModule.GetFIntPeoplePageLayoutChangedThrottleHundredthsPercent
local getFIntPersonCardMenuToggledThrottleHundredthsPercent = flagsModule.GetFIntPersonCardMenuToggledThrottleHundredthsPercent
local getFFlagAddPeoplePageCardLayout = flagsModule.GetFFlagAddPeoplePageCardLayout
local t = {
	ButtonName = { SettingsHub = "settingsHub" },
	EventName = {
		GameInviteEntryPoint = "inputShareGameEntryPoint",
		InspectButton = "ingame_menu_action",
		MuteAll = "mute_all",
		UnmuteAll = "unmute_all",
		MutePlayer = "mute_player",
		UnmutePlayer = "unmute_player",
		MuteSelf = "mute_self",
		UnmuteSelf = "unmute_self",
		PlayersMenu = "PlayersMenu",
		RequestFriendship = "RequestFriendship",
		BlockUserButtonClick = "blockUserButtonClick",
		BlockUser = "blockUser",
		UnblockUser = "unblockUser",
		PeoplePageLayoutChanged = "people_page_layout_changed",
		PersonCardMenuToggled = "person_card_menu_toggled",
		GameInviteEntryPointCounter = settings():GetFVariable("LuaShareGameSettingsHubEntryCounter")
	}
}
local t_1 = {
	GameInviteEntryPoint = {
		eventConfig = {
			description = "Event to track game invite entry point from people tab.",
			eventName = t.EventName.GameInviteEntryPoint,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntGameInviteEntryPointThrottleHundredthsPercent(),
			lastUpdated = { 2025, 6, 25 }
		},
		counterConfig = {
			description = "Counter to track game invite entry point clicks from people tab.",
			eventName = t.EventName.GameInviteEntryPointCounter,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = getFIntGameInviteEntryPointThrottleHundredthsPercent(),
			lastUpdated = { 2025, 6, 25 }
		}
	},
	InspectButton = {
		eventConfig = {
			description = "Event to track inspect button click from people tab.",
			eventName = t.EventName.InspectButton,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntInspectButtonThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 14 }
		}
	},
	MuteAll = {
		eventConfig = {
			description = "Event to track mute all button click.",
			eventName = t.EventName.MuteAll,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntMuteAllThrottleHundredthsPercent(),
			lastUpdated = { 2025, 6, 26 }
		}
	},
	UnmuteAll = {
		eventConfig = {
			description = "Event to track unmute all button click.",
			eventName = t.EventName.UnmuteAll,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntUnmuteAllThrottleHundredthsPercent(),
			lastUpdated = { 2025, 6, 26 }
		}
	},
	MutePlayer = {
		eventConfig = {
			description = "Event to track individual player mute button click.",
			eventName = t.EventName.MutePlayer,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntMutePlayerThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 9 }
		}
	},
	UnmutePlayer = {
		eventConfig = {
			description = "Event to track individual player unmute button click.",
			eventName = t.EventName.UnmutePlayer,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntUnmutePlayerThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 9 }
		}
	},
	MuteSelf = {
		eventConfig = {
			description = "Event to track mute self button click.",
			eventName = t.EventName.MuteSelf,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntMuteSelfThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 23 }
		}
	},
	UnmuteSelf = {
		eventConfig = {
			description = "Event to track unmute self button click.",
			eventName = t.EventName.UnmuteSelf,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntUnmuteSelfThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 23 }
		}
	},
	RequestFriendship = {
		eventConfig = {
			description = "Event to track players menu actions.",
			eventName = if getFFlagAddPeoplePageCardLayout() then t.EventName.RequestFriendship else t.EventName.PlayersMenu,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntRequestFriendshipThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 9 }
		},
		counterConfig = {
			description = "Counter to track players menu actions.",
			eventName = t.EventName.PlayersMenu,
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2025, 7, 9 }
		}
	},
	BlockUserButtonClick = {
		eventConfig = {
			description = "Event to track block user button clicks from people tab.",
			eventName = t.EventName.BlockUserButtonClick,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntBlockUserButtonClickThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 22 }
		}
	},
	BlockUser = {
		eventConfig = {
			description = "Event to track successful user blocking from people tab.",
			eventName = t.EventName.BlockUser,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntBlockUserThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 22 }
		}
	},
	UnblockUser = {
		eventConfig = {
			description = "Event to track user unblocking from people tab.",
			eventName = t.EventName.UnblockUser,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntUnblockUserThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 22 }
		}
	},
	PeoplePageLayoutChanged = {
		eventConfig = {
			description = "Event to track people page layout change.",
			eventName = t.EventName.PeoplePageLayoutChanged,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntPeoplePageLayoutChangedThrottleHundredthsPercent(),
			lastUpdated = { 2025, 9, 2 }
		}
	},
	PersonCardMenuToggled = {
		eventConfig = {
			description = "Event to track person card menu toggle.",
			eventName = t.EventName.PersonCardMenuToggled,
			backends = { "EventIngest" },
			throttlingPercentage = getFIntPersonCardMenuToggledThrottleHundredthsPercent(),
			lastUpdated = { 2025, 9, 2 }
		}
	}
}
t.TelemetryConfigs = t_1
local gameInviteAnalyticsManager = gameInviteModule.GameInviteAnalyticsManager

function t.trackGameInviteEntryPoint(_) --[[ line: 211 ]]
	-- upvalues: t (ref), t_1 (ref), telemetryService (ref), gameInviteAnalyticsManager (ref)
	local gameInviteEntryPoint = t_1.GameInviteEntryPoint
	telemetryService:LogEvent(gameInviteEntryPoint.eventConfig, {
		customFields = {
			btn = t.ButtonName.SettingsHub,
			placeId = tostring(game.PlaceId),
			gameId = tostring(game.GameId)
		}
	})
	telemetryService:LogCounter(gameInviteEntryPoint.counterConfig, {}, 1)
	gameInviteAnalyticsManager:withButtonName(t.ButtonName.SettingsHub)
end

function t.trackToggleMuteSelf(_, p0) --[[ line: 225 ]]
	-- upvalues: telemetryService (ref), t_1 (ref)
	if p0 then
		telemetryService:LogEvent(t_1.UnmuteSelf.eventConfig, {})
		
		return
	end
	telemetryService:LogEvent(t_1.MuteSelf.eventConfig, {})
end

function t.trackInspectButton(_, p1, p2, p3) --[[ line: 233 ]]
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), t_1 (ref), telemetryService (ref)
	local t = { playsessionid = p2, universeid = tostring(p1) }
	
	if getFFlagAddPeoplePageCardLayout() then
		t.entrypoint = p3
	end
	telemetryService:LogEvent(t_1.InspectButton.eventConfig, {
		eventContext = if getFFlagAddPeoplePageCardLayout() then "examine_avatar" else nil,
		customFields = t
	})
end

function t.trackToggleMuteAll(_, p4) --[[ line: 249 ]]
	-- upvalues: telemetryService (ref), t_1 (ref)
	if p4 then
		telemetryService:LogEvent(t_1.UnmuteAll.eventConfig, {})
		
		return
	end
	telemetryService:LogEvent(t_1.MuteAll.eventConfig, {})
end

function t.trackToggleMutePlayer(_, p5, p6, p7) --[[ line: 257 ]]
	-- upvalues: telemetryService (ref), t_1 (ref), getFFlagAddPeoplePageCardLayout (ref)
	if p6 then
		telemetryService:LogEvent(t_1.UnmutePlayer.eventConfig, {
			customFields = {
				mutedUserId = p5,
				entryPoint = if getFFlagAddPeoplePageCardLayout() then p7 else nil
			}
		})
		
		return
	end
	telemetryService:LogEvent(t_1.MutePlayer.eventConfig, {
		customFields = {
			mutedUserId = p5,
			entryPoint = if getFFlagAddPeoplePageCardLayout() then p7 else nil
		}
	})
end

function t.trackRequestFriendship(_, p8) --[[ line: 275 ]]
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), t_1 (ref), telemetryService (ref)
	local requestFriendship = t_1.RequestFriendship
	telemetryService:LogEvent(requestFriendship.eventConfig, {
		eventContext = if getFFlagAddPeoplePageCardLayout() then "PlayersMenu" else nil,
		customFields = {
			selectedItem = "RequestFriendship",
			category = "Game",
			entryPoint = if getFFlagAddPeoplePageCardLayout() then p8 else nil
		}
	})
	telemetryService:LogCounter(requestFriendship.counterConfig, { customFields = { selectedItem = "RequestFriendship" } }, 1)
end

function t.trackBlockUserButtonClick(_, p9, p10, p11) --[[ line: 290 ]]
	-- upvalues: t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.BlockUserButtonClick.eventConfig, {
		customFields = { blockeeUserId = p9, blockerUserId = p10, source = p11 }
	})
end

function t.trackBlockUser(_, p12, p13, p14) --[[ line: 301 ]]
	-- upvalues: t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.BlockUser.eventConfig, {
		customFields = { blockeeUserId = p12, blockerUserId = p13, source = p14 }
	})
end

function t.trackUnblockUser(_, p15, p16, p17) --[[ line: 312 ]]
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.UnblockUser.eventConfig, {
		customFields = {
			blockeeUserId = p15,
			blockerUserId = p16,
			entryPoint = if getFFlagAddPeoplePageCardLayout() then p17 else nil
		}
	})
end

if getFFlagAddPeoplePageCardLayout() then
	function t.trackPeoplePageLayoutChanged(_, p18) --[[ line: 324 ]]
		-- upvalues: t_1 (ref), telemetryService (ref)
		telemetryService:LogEvent(t_1.PeoplePageLayoutChanged.eventConfig, {
			customFields = { layout = p18.Name },
			standardizedFields = {
				"addPlaceId",
				"addUniverseId",
				"addPlaySessionId",
				"addSessionInfo"
			}
		})
	end
	
	function t.trackPersonCardMenuToggled(_, p19) --[[ line: 336 ]]
		-- upvalues: t_1 (ref), telemetryService (ref)
		telemetryService:LogEvent(t_1.PersonCardMenuToggled.eventConfig, {
			customFields = { is_toggled_on = tostring(p19) },
			standardizedFields = {
				"addPlaceId",
				"addUniverseId",
				"addPlaySessionId",
				"addSessionInfo"
			}
		})
	end
end
return t