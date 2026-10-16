local TelemetryService = game:GetService("TelemetryService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local PeopleService = script:FindFirstAncestor("PeopleService")
local GameInviteModule = require(PeopleService.Parent.GameInvite)
local FlagsModule = require(PeopleService.Flags)
local ConstantsModule = require(PeopleService.Constants)
local GetFIntGameInviteEntryPointThrottleHundredthsPercentFunction = FlagsModule.GetFIntGameInviteEntryPointThrottleHundredthsPercent
local GetFFlagAddPeoplePageCardLayoutFunction = FlagsModule.GetFFlagAddPeoplePageCardLayout
local FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = FlagsModule.FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local FFlagVoiceVolumeControlsPerUserPlayerListButton = FlagsModule.FFlagVoiceVolumeControlsPerUserPlayerListButton
local FFlagVoiceVolumeControlsPerUserPlayerGridMenu = FlagsModule.FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local FFlagVoiceChatVolumePerUserMuteVolumeSync = FlagsModule.FFlagVoiceChatVolumePerUserMuteVolumeSync
local FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted = FlagsModule.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted
local VOICEVOLUME = ConstantsModule.VOICE_CHAT.VOICE_VOLUME
local ENTRYPOINT = ConstantsModule.ANALYTICS.ENTRY_POINT
local UXVARIANT = ConstantsModule.ANALYTICS.UX_VARIANT
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
		PerUserVoiceVolumeChanged = "PerUserVoiceVolumeChanged",
		PerUserVoiceVolumeSession = "PerUserVoiceVolumeSession",
		PerUserVoiceVolumeSliderTouch = "PerUserVoiceVolumeSliderTouch",
		PerUserVoiceVolumeMutedViaSlider = "PerUserVoiceVolumeMutedViaSlider",
		PerUserVoiceVolumeUnmutedViaSlider = "PerUserVoiceVolumeUnmutedViaSlider",
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
	},
	PerUserVoiceVolumeChanged = {
		eventConfig = {
			description = "Per-user voice volume slider drag on People List / People Cards.",
			links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/voice/per_user_voice_volume_changed.proto",
			eventName = PeopleAnalyticsManager.EventName.PerUserVoiceVolumeChanged,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.FIntPerUserVoiceVolumeChangedThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeSession = {
		eventConfig = {
			description = "Session info for per-user voice volume UI open/change on People List / People Cards.",
			links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/voice/per_user_voice_volume_session.proto",
			eventName = PeopleAnalyticsManager.EventName.PerUserVoiceVolumeSession,
			backends = { "EventIngest" },
			throttlingPercentage = FlagsModule.FIntPerUserVoiceVolumeSessionThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeSliderTouch = {
		counterConfig = {
			description = "Counter for per-user voice volume slider drag starts.",
			eventName = PeopleAnalyticsManager.EventName.PerUserVoiceVolumeSliderTouch,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = FlagsModule.FIntPerUserVoiceVolumeSliderTouchThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeMutedViaSlider = {
		counterConfig = {
			description = "Counter for muting a player by dragging per-user volume to MIN.",
			eventName = PeopleAnalyticsManager.EventName.PerUserVoiceVolumeMutedViaSlider,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = FlagsModule.FIntPerUserVoiceVolumeMutedViaSliderThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeUnmutedViaSlider = {
		counterConfig = {
			description = "Counter for unmuting a player by raising per-user volume above MIN.",
			eventName = PeopleAnalyticsManager.EventName.PerUserVoiceVolumeUnmutedViaSlider,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = FlagsModule.FIntPerUserVoiceVolumeUnmutedViaSliderThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	}
}
PeopleAnalyticsManager.TelemetryConfigs = TelemetryConfigs
local GameInviteAnalyticsManager = GameInviteModule.GameInviteAnalyticsManager

function PeopleAnalyticsManager:trackGameInviteEntryPoint() --[[ Line: 286 ]]
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

function PeopleAnalyticsManager:trackToggleMuteSelf(p1) --[[ Line: 300 ]]
	-- upvalues: TelemetryService (copy), TelemetryConfigs (copy)
	if p1 then
		TelemetryService:LogEvent(TelemetryConfigs.UnmuteSelf.eventConfig, {})
		
		return
	else
		TelemetryService:LogEvent(TelemetryConfigs.MuteSelf.eventConfig, {})
	end
end

function PeopleAnalyticsManager:trackInspectButton(p1, Playsessionid, Entrypoint) --[[ Line: 308 ]]
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

function PeopleAnalyticsManager:trackToggleMuteAll(p1) --[[ Line: 324 ]]
	-- upvalues: TelemetryService (copy), TelemetryConfigs (copy)
	if p1 then
		TelemetryService:LogEvent(TelemetryConfigs.UnmuteAll.eventConfig, {})
		
		return
	else
		TelemetryService:LogEvent(TelemetryConfigs.MuteAll.eventConfig, {})
	end
end

function PeopleAnalyticsManager:trackToggleMutePlayer(MutedUserId, p1, p2) --[[ Line: 332 ]]
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

function PeopleAnalyticsManager:trackRequestFriendship(p1) --[[ Line: 350 ]]
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

function PeopleAnalyticsManager:trackBlockUserButtonClick(BlockeeUserId, BlockerUserId, Source) --[[ Line: 365 ]]
	-- upvalues: TelemetryConfigs (copy), TelemetryService (copy)
	TelemetryService:LogEvent(TelemetryConfigs.BlockUserButtonClick.eventConfig, {
		customFields = {
			blockeeUserId = BlockeeUserId,
			blockerUserId = BlockerUserId,
			source = Source
		}
	})
end

function PeopleAnalyticsManager:trackBlockUser(BlockeeUserId, BlockerUserId, Source) --[[ Line: 376 ]]
	-- upvalues: TelemetryConfigs (copy), TelemetryService (copy)
	TelemetryService:LogEvent(TelemetryConfigs.BlockUser.eventConfig, {
		customFields = {
			blockeeUserId = BlockeeUserId,
			blockerUserId = BlockerUserId,
			source = Source
		}
	})
end

function PeopleAnalyticsManager:trackUnblockUser(BlockeeUserId, BlockerUserId, p1) --[[ Line: 387 ]]
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
	function PeopleAnalyticsManager:trackPeoplePageLayoutChanged(p1) --[[ Line: 399 ]]
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
	
	function PeopleAnalyticsManager:trackPersonCardMenuToggled(p1) --[[ Line: 411 ]]
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
local config = {
	openedVolumeUiList = false,
	openedVolumeUiCard = false,
	changedPerUserVolume = false,
	reported = false
}

local function _() --[[ Line: 442 | Named "getPerUserVoiceVolumeUxVariant" ]]
	-- upvalues: FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (copy), UXVARIANT (copy), FFlagVoiceChatVolumePerUserMuteVolumeSync (copy)
	return if FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then UXVARIANT.DISABLE_WHEN_MUTED elseif FFlagVoiceChatVolumePerUserMuteVolumeSync then UXVARIANT.SYNC else UXVARIANT.INDEPENDENT
end

local _ = function() --[[ Line: 452 | Named "resetPerUserVoiceVolumeSessionState" ]]
	-- upvalues: config (copy)
	config.openedVolumeUiList = false
	config.openedVolumeUiCard = false
	config.changedPerUserVolume = false
	config.reported = false
end

function PeopleAnalyticsManager.getPerUserVoiceVolumeUxVariant() --[[ Line: 459 ]]
	-- upvalues: FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (copy), UXVARIANT (copy), FFlagVoiceChatVolumePerUserMuteVolumeSync (copy)
	return if FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then UXVARIANT.DISABLE_WHEN_MUTED elseif FFlagVoiceChatVolumePerUserMuteVolumeSync then UXVARIANT.SYNC else UXVARIANT.INDEPENDENT
end

function PeopleAnalyticsManager:recordPerUserVoiceVolumeUiOpened(PEOPLECARD) --[[ Line: 463 ]]
	-- upvalues: FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), ENTRYPOINT (copy), config (copy)
	if not FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if PEOPLECARD == ENTRYPOINT.PEOPLE_LIST then
		config.openedVolumeUiList = true
		
		return
	end
	if PEOPLECARD == ENTRYPOINT.PEOPLE_CARD then
		config.openedVolumeUiCard = true
	end
end

function PeopleAnalyticsManager:trackPerUserVoiceVolumeSliderTouch(EntryPoint) --[[ Line: 475 ]]
	-- upvalues: FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (copy), UXVARIANT (copy), FFlagVoiceChatVolumePerUserMuteVolumeSync (copy), TelemetryService (copy), TelemetryConfigs (copy)
	if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		TelemetryService:LogCounter(TelemetryConfigs.PerUserVoiceVolumeSliderTouch.counterConfig, {
			customFields = {
				entryPoint = EntryPoint,
				uxVariant = if FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then UXVARIANT.DISABLE_WHEN_MUTED elseif FFlagVoiceChatVolumePerUserMuteVolumeSync then UXVARIANT.SYNC else UXVARIANT.INDEPENDENT
			}
		}, 1)
		
		return
	end
end

function PeopleAnalyticsManager:trackPerUserVoiceVolumeChanged(p1) --[[ Line: 490 ]]
	-- upvalues: FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (copy), UXVARIANT (copy), FFlagVoiceChatVolumePerUserMuteVolumeSync (copy), VOICEVOLUME (copy), UserGameSettings (copy), TelemetryService (copy), TelemetryConfigs (copy), config (copy)
	if not FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if p1.newVolume == p1.oldVolume then return end
	local DISABLEWHENMUTED = if FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then UXVARIANT.DISABLE_WHEN_MUTED elseif FFlagVoiceChatVolumePerUserMuteVolumeSync then UXVARIANT.SYNC else UXVARIANT.INDEPENDENT
	local WasMutedAtStart = p1.wasMutedAtStart
	local IsNewVolumeMatch = if DISABLEWHENMUTED == UXVARIANT.SYNC then WasMutedAtStart == false and p1.newVolume == VOICEVOLUME.MIN else nil
	local IsMINBelow = if DISABLEWHENMUTED == UXVARIANT.SYNC then WasMutedAtStart == true and VOICEVOLUME.MIN < p1.newVolume else nil
	TelemetryService:LogEvent(TelemetryConfigs.PerUserVoiceVolumeChanged.eventConfig, {
		customFields = {
			playSessionId = p1.playSessionId,
			voiceSessionId = p1.voiceSessionId,
			entryPoint = p1.entryPoint,
			targetUserId = p1.targetUserId,
			oldVolume = p1.oldVolume,
			newVolume = p1.newVolume,
			wasMutedAtStart = if DISABLEWHENMUTED == UXVARIANT.DISABLE_WHEN_MUTED then nil else WasMutedAtStart,
			mutedViaSlider = IsNewVolumeMatch,
			unmutedViaSlider = IsMINBelow,
			uxVariant = DISABLEWHENMUTED,
			masterVolume = UserGameSettings.MasterVolume,
			voiceChatVolume = UserGameSettings.VoiceChatVolume,
			dragDurationMs = p1.dragDurationMs
		},
		standardizedFields = { "addPlaceId", "addUniverseId" }
	})
	config.changedPerUserVolume = true
	
	if IsNewVolumeMatch then
		TelemetryService:LogCounter(TelemetryConfigs.PerUserVoiceVolumeMutedViaSlider.counterConfig, {
			customFields = {
				entryPoint = p1.entryPoint,
				uxVariant = DISABLEWHENMUTED
			}
		}, 1)
	end
	if IsMINBelow then
		TelemetryService:LogCounter(TelemetryConfigs.PerUserVoiceVolumeUnmutedViaSlider.counterConfig, {
			customFields = {
				entryPoint = p1.entryPoint,
				uxVariant = DISABLEWHENMUTED
			}
		}, 1)
	end
end

function PeopleAnalyticsManager:flushPerUserVoiceVolumeSession(PlaySessionId, VoiceSessionId) --[[ Line: 552 ]]
	-- upvalues: FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), config (copy), FFlagVoiceVolumeControlsPerUserPlayerListButton (copy), FFlagVoiceVolumeControlsPerUserPlayerGridMenu (copy), FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (copy), UXVARIANT (copy), FFlagVoiceChatVolumePerUserMuteVolumeSync (copy), TelemetryService (copy), TelemetryConfigs (copy)
	if not FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if not config.reported then
		config.reported = true
		local OpenedVolumeUiList = if FFlagVoiceVolumeControlsPerUserPlayerListButton then config.openedVolumeUiList else nil
		local OpenedVolumeUiCard = if FFlagVoiceVolumeControlsPerUserPlayerGridMenu then config.openedVolumeUiCard else nil
		TelemetryService:LogEvent(TelemetryConfigs.PerUserVoiceVolumeSession.eventConfig, {
			customFields = {
				playSessionId = PlaySessionId,
				voiceSessionId = VoiceSessionId,
				openedVolumeUi = OpenedVolumeUiList == true or OpenedVolumeUiCard == true,
				openedVolumeUiList = OpenedVolumeUiList,
				openedVolumeUiCard = OpenedVolumeUiCard,
				changedPerUserVolume = config.changedPerUserVolume,
				uxVariant = if FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then UXVARIANT.DISABLE_WHEN_MUTED elseif FFlagVoiceChatVolumePerUserMuteVolumeSync then UXVARIANT.SYNC else UXVARIANT.INDEPENDENT
			},
			standardizedFields = { "addPlaceId", "addUniverseId" }
		})
		config.openedVolumeUiList = false
		config.openedVolumeUiCard = false
		config.changedPerUserVolume = false
		
		return
	end
end

function PeopleAnalyticsManager:resetPerUserVoiceVolumeSession() --[[ Line: 590 ]]
	-- upvalues: FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), config (copy)
	if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		config.openedVolumeUiList = false
		config.openedVolumeUiCard = false
		config.changedPerUserVolume = false
		config.reported = false
		
		return
	end
end

return PeopleAnalyticsManager