local TelemetryService = game:GetService("TelemetryService")
local PeopleService = script:FindFirstAncestor("PeopleService")
local GameInviteModule = require(PeopleService.Parent.GameInvite)
local FlagsModule = require(PeopleService.Flags)
local GetFIntGameInviteEntryPointThrottleHundredthsPercentFunction = FlagsModule.GetFIntGameInviteEntryPointThrottleHundredthsPercent
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsModule.GetFFlagAddPeoplePageCardLayout
local PeopleAnalyticsManager = {
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
local TelemetryConfigs = {
	GameInviteEntryPoint = {
		eventConfig = {
			description = "Event to track game invite entry point from people tab.",
			eventName = PeopleAnalyticsManager.EventName.GameInviteEntryPoint,
			backends = { "EventIngest" },
			throttlingPercentage = GetFIntGameInviteEntryPointThrottleHundredthsPercentFunction(),
			lastUpdated = { 2025, 6, 25 }
		},
		counterConfig = {
			description = "Counter to track game invite entry point clicks from people tab.",
			eventName = PeopleAnalyticsManager.EventName.GameInviteEntryPointCounter,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = GetFIntGameInviteEntryPointThrottleHundredthsPercentFunction(),
			lastUpdated = { 2025, 6, 25 }
		}
	},
	InspectButton = {
		eventConfig = {
			description = "Event to track inspect button click from people tab.",
			eventName = PeopleAnalyticsManager.EventName.InspectButton,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntInspectButtonThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 14 }
		}
	},
	MuteAll = {
		eventConfig = {
			description = "Event to track mute all button click.",
			eventName = PeopleAnalyticsManager.EventName.MuteAll,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntMuteAllThrottleHundredthsPercent(),
			lastUpdated = { 2025, 6, 26 }
		}
	},
	UnmuteAll = {
		eventConfig = {
			description = "Event to track unmute all button click.",
			eventName = PeopleAnalyticsManager.EventName.UnmuteAll,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntUnmuteAllThrottleHundredthsPercent(),
			lastUpdated = { 2025, 6, 26 }
		}
	},
	MutePlayer = {
		eventConfig = {
			description = "Event to track individual player mute button click.",
			eventName = PeopleAnalyticsManager.EventName.MutePlayer,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntMutePlayerThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 9 }
		}
	},
	UnmutePlayer = {
		eventConfig = {
			description = "Event to track individual player unmute button click.",
			eventName = PeopleAnalyticsManager.EventName.UnmutePlayer,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntUnmutePlayerThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 9 }
		}
	},
	MuteSelf = {
		eventConfig = {
			description = "Event to track mute self button click.",
			eventName = PeopleAnalyticsManager.EventName.MuteSelf,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntMuteSelfThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 23 }
		}
	},
	UnmuteSelf = {
		eventConfig = {
			description = "Event to track unmute self button click.",
			eventName = PeopleAnalyticsManager.EventName.UnmuteSelf,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntUnmuteSelfThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 23 }
		}
	},
	RequestFriendship = {
		eventConfig = {
			description = "Event to track players menu actions.",
			eventName = if GetFFlagAddPeoplePageCardLayoutFunction() then PeopleAnalyticsManager.EventName.RequestFriendship else PeopleAnalyticsManager.EventName.PlayersMenu,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntRequestFriendshipThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 9 }
		},
		counterConfig = {
			description = "Counter to track players menu actions.",
			eventName = PeopleAnalyticsManager.EventName.PlayersMenu,
			backends = { "RobloxTelemetryCounter" },
			lastUpdated = { 2025, 7, 9 }
		}
	},
	BlockUserButtonClick = {
		eventConfig = {
			description = "Event to track block user button clicks from people tab.",
			eventName = PeopleAnalyticsManager.EventName.BlockUserButtonClick,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntBlockUserButtonClickThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 22 }
		}
	},
	BlockUser = {
		eventConfig = {
			description = "Event to track successful user blocking from people tab.",
			eventName = PeopleAnalyticsManager.EventName.BlockUser,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntBlockUserThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 22 }
		}
	},
	UnblockUser = {
		eventConfig = {
			description = "Event to track user unblocking from people tab.",
			eventName = PeopleAnalyticsManager.EventName.UnblockUser,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntUnblockUserThrottleHundredthsPercent(),
			lastUpdated = { 2025, 7, 22 }
		}
	},
	PeoplePageLayoutChanged = {
		eventConfig = {
			description = "Event to track people page layout change.",
			eventName = PeopleAnalyticsManager.EventName.PeoplePageLayoutChanged,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntPeoplePageLayoutChangedThrottleHundredthsPercent(),
			lastUpdated = { 2025, 9, 2 }
		}
	},
	PersonCardMenuToggled = {
		eventConfig = {
			description = "Event to track person card menu toggle.",
			eventName = PeopleAnalyticsManager.EventName.PersonCardMenuToggled,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.GetFIntPersonCardMenuToggledThrottleHundredthsPercent(),
			lastUpdated = { 2025, 9, 2 }
		}
	}
}
PeopleAnalyticsManager.TelemetryConfigs = TelemetryConfigs
local GameInviteAnalyticsManager = GameInviteModule.GameInviteAnalyticsManager

function PeopleAnalyticsManager:trackGameInviteEntryPoint()
	-- upvalues: PeopleAnalyticsManager (copy), TelemetryConfigs (copy), TelemetryService (copy), GameInviteAnalyticsManager (copy)
	local GameInviteEntryPoint = TelemetryConfigs.GameInviteEntryPoint
	TelemetryService:LogEvent(GameInviteEntryPoint.eventConfig, {
		customFields = {
			btn = PeopleAnalyticsManager.ButtonName.SettingsHub,
			placeId = tostring(game.PlaceId),
			gameId = tostring(game.GameId)
		}
	})
	TelemetryService:LogCounter(GameInviteEntryPoint.counterConfig, {}, 1)
	GameInviteAnalyticsManager:withButtonName(PeopleAnalyticsManager.ButtonName.SettingsHub)
end

function PeopleAnalyticsManager:trackToggleMuteSelf(p1)
	-- upvalues: TelemetryService (copy), TelemetryConfigs (copy)
	if p1 then
		TelemetryService:LogEvent(TelemetryConfigs.UnmuteSelf.eventConfig, {})
		
		return
	else
		TelemetryService:LogEvent(TelemetryConfigs.MuteSelf.eventConfig, {})
	end
end

function PeopleAnalyticsManager:trackInspectButton(p1, Playsessionid, Entrypoint)
	-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (copy), TelemetryConfigs (copy), TelemetryService (copy)
	local CustomFields = { playsessionid = Playsessionid, universeid = tostring(p1) }
	
	if GetFFlagAddPeoplePageCardLayoutFunction() then
		CustomFields.entrypoint = Entrypoint
	end
	TelemetryService:LogEvent(TelemetryConfigs.InspectButton.eventConfig, {
		eventContext = if GetFFlagAddPeoplePageCardLayoutFunction() then "examine_avatar" else nil,
		customFields = CustomFields
	})
end

function PeopleAnalyticsManager:trackToggleMuteAll(p1)
	-- upvalues: TelemetryService (copy), TelemetryConfigs (copy)
	if p1 then
		TelemetryService:LogEvent(TelemetryConfigs.UnmuteAll.eventConfig, {})
		
		return
	else
		TelemetryService:LogEvent(TelemetryConfigs.MuteAll.eventConfig, {})
	end
end

function PeopleAnalyticsManager:trackToggleMutePlayer(MutedUserId, p1, p2)
	-- upvalues: TelemetryService (copy), TelemetryConfigs (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy)
	if p1 then
		TelemetryService:LogEvent(TelemetryConfigs.UnmutePlayer.eventConfig, {
			customFields = {
				mutedUserId = MutedUserId,
				entryPoint = if GetFFlagAddPeoplePageCardLayoutFunction() then p2 else nil
			}
		})
		
		return
	else
		TelemetryService:LogEvent(TelemetryConfigs.MutePlayer.eventConfig, {
			customFields = {
				mutedUserId = MutedUserId,
				entryPoint = if GetFFlagAddPeoplePageCardLayoutFunction() then p2 else nil
			}
		})
	end
end

function PeopleAnalyticsManager:trackRequestFriendship(p1)
	-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (copy), TelemetryConfigs (copy), TelemetryService (copy)
	local RequestFriendship = TelemetryConfigs.RequestFriendship
	TelemetryService:LogEvent(RequestFriendship.eventConfig, {
		eventContext = if GetFFlagAddPeoplePageCardLayoutFunction() then "PlayersMenu" else nil,
		customFields = {
			selectedItem = "RequestFriendship",
			category = "Game",
			entryPoint = if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else nil
		}
	})
	TelemetryService:LogCounter(RequestFriendship.counterConfig, { customFields = { selectedItem = "RequestFriendship" } }, 1)
end

function PeopleAnalyticsManager:trackBlockUserButtonClick(BlockeeUserId, BlockerUserId, Source)
	-- upvalues: TelemetryConfigs (copy), TelemetryService (copy)
	TelemetryService:LogEvent(TelemetryConfigs.BlockUserButtonClick.eventConfig, {
		customFields = {
			blockeeUserId = BlockeeUserId,
			blockerUserId = BlockerUserId,
			source = Source
		}
	})
end

function PeopleAnalyticsManager:trackBlockUser(BlockeeUserId, BlockerUserId, Source)
	-- upvalues: TelemetryConfigs (copy), TelemetryService (copy)
	TelemetryService:LogEvent(TelemetryConfigs.BlockUser.eventConfig, {
		customFields = {
			blockeeUserId = BlockeeUserId,
			blockerUserId = BlockerUserId,
			source = Source
		}
	})
end

function PeopleAnalyticsManager:trackUnblockUser(BlockeeUserId, BlockerUserId, p1)
	-- upvalues: GetFFlagAddPeoplePageCardLayoutFunction (copy), TelemetryConfigs (copy), TelemetryService (copy)
	TelemetryService:LogEvent(TelemetryConfigs.UnblockUser.eventConfig, {
		customFields = {
			blockeeUserId = BlockeeUserId,
			blockerUserId = BlockerUserId,
			entryPoint = if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else nil
		}
	})
end

if GetFFlagAddPeoplePageCardLayoutFunction() then
	function PeopleAnalyticsManager:trackPeoplePageLayoutChanged(p1)
		-- upvalues: TelemetryConfigs (copy), TelemetryService (copy)
		TelemetryService:LogEvent(TelemetryConfigs.PeoplePageLayoutChanged.eventConfig, {
			customFields = { layout = p1.Name },
			standardizedFields = {
				"addPlaceId",
				"addUniverseId",
				"addPlaySessionId",
				"addSessionInfo"
			}
		})
	end
	
	function PeopleAnalyticsManager:trackPersonCardMenuToggled(p1)
		-- upvalues: TelemetryConfigs (copy), TelemetryService (copy)
		TelemetryService:LogEvent(TelemetryConfigs.PersonCardMenuToggled.eventConfig, {
			customFields = { is_toggled_on = tostring(p1) },
			standardizedFields = {
				"addPlaceId",
				"addUniverseId",
				"addPlaySessionId",
				"addSessionInfo"
			}
		})
	end
end
return PeopleAnalyticsManager