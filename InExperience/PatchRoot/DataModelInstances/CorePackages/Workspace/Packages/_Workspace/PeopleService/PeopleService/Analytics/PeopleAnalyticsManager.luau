local telemetryService = game:GetService("TelemetryService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local peopleService = script:FindFirstAncestor("PeopleService")
local gameInviteModule = require(peopleService.Parent.GameInvite)
local flagsModule = require(peopleService.Flags)
local constantsModule = require(peopleService.Constants)
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
local fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = flagsModule.FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local fFlagVoiceVolumeControlsPerUserPlayerListButton = flagsModule.FFlagVoiceVolumeControlsPerUserPlayerListButton
local fFlagVoiceVolumeControlsPerUserPlayerGridMenu = flagsModule.FFlagVoiceVolumeControlsPerUserPlayerGridMenu
local fIntPerUserVoiceVolumeChangedThrottleHundredthsPercent = flagsModule.FIntPerUserVoiceVolumeChangedThrottleHundredthsPercent
local fIntPerUserVoiceVolumeSessionThrottleHundredthsPercent = flagsModule.FIntPerUserVoiceVolumeSessionThrottleHundredthsPercent
local fIntPerUserVoiceVolumeSliderTouchThrottleHundredthsPercent = flagsModule.FIntPerUserVoiceVolumeSliderTouchThrottleHundredthsPercent
local fIntPerUserVoiceVolumeMutedViaSliderThrottleHundredthsPercent = flagsModule.FIntPerUserVoiceVolumeMutedViaSliderThrottleHundredthsPercent
local fIntPerUserVoiceVolumeUnmutedViaSliderThrottleHundredthsPercent = flagsModule.FIntPerUserVoiceVolumeUnmutedViaSliderThrottleHundredthsPercent
local fFlagVoiceChatVolumePerUserMuteVolumeSync = flagsModule.FFlagVoiceChatVolumePerUserMuteVolumeSync
local fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted = flagsModule.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted
local VOICE_VOLUME = constantsModule.VOICE_CHAT.VOICE_VOLUME
local ENTRY_POINT = constantsModule.ANALYTICS.ENTRY_POINT
local uXVARIANT = constantsModule.ANALYTICS.UX_VARIANT
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
		PerUserVoiceVolumeChanged = "PerUserVoiceVolumeChanged",
		PerUserVoiceVolumeSession = "PerUserVoiceVolumeSession",
		PerUserVoiceVolumeSliderTouch = "PerUserVoiceVolumeSliderTouch",
		PerUserVoiceVolumeMutedViaSlider = "PerUserVoiceVolumeMutedViaSlider",
		PerUserVoiceVolumeUnmutedViaSlider = "PerUserVoiceVolumeUnmutedViaSlider",
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
	},
	PerUserVoiceVolumeChanged = {
		eventConfig = {
			description = "Per-user voice volume slider drag on People List / People Cards.",
			links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/voice/per_user_voice_volume_changed.proto",
			eventName = t.EventName.PerUserVoiceVolumeChanged,
			backends = { "EventIngest" },
			throttlingPercentage = fIntPerUserVoiceVolumeChangedThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeSession = {
		eventConfig = {
			description = "Session info for per-user voice volume UI open/change on People List / People Cards.",
			links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/voice/per_user_voice_volume_session.proto",
			eventName = t.EventName.PerUserVoiceVolumeSession,
			backends = { "EventIngest" },
			throttlingPercentage = fIntPerUserVoiceVolumeSessionThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeSliderTouch = {
		counterConfig = {
			description = "Counter for per-user voice volume slider drag starts.",
			eventName = t.EventName.PerUserVoiceVolumeSliderTouch,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = fIntPerUserVoiceVolumeSliderTouchThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeMutedViaSlider = {
		counterConfig = {
			description = "Counter for muting a player by dragging per-user volume to MIN.",
			eventName = t.EventName.PerUserVoiceVolumeMutedViaSlider,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = fIntPerUserVoiceVolumeMutedViaSliderThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	},
	PerUserVoiceVolumeUnmutedViaSlider = {
		counterConfig = {
			description = "Counter for unmuting a player by raising per-user volume above MIN.",
			eventName = t.EventName.PerUserVoiceVolumeUnmutedViaSlider,
			backends = { "RobloxTelemetryCounter" },
			throttlingPercentage = fIntPerUserVoiceVolumeUnmutedViaSliderThrottleHundredthsPercent,
			lastUpdated = { 2026, 7, 27 }
		}
	}
}
t.TelemetryConfigs = t_1
local gameInviteAnalyticsManager = gameInviteModule.GameInviteAnalyticsManager

function t.trackGameInviteEntryPoint(_) --[[ line: 286 ]]
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

function t.trackToggleMuteSelf(_, p0) --[[ line: 300 ]]
	-- upvalues: telemetryService (ref), t_1 (ref)
	if p0 then
		telemetryService:LogEvent(t_1.UnmuteSelf.eventConfig, {})
		
		return
	end
	telemetryService:LogEvent(t_1.MuteSelf.eventConfig, {})
end

function t.trackInspectButton(_, p1, p2, p3) --[[ line: 308 ]]
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

function t.trackToggleMuteAll(_, p4) --[[ line: 324 ]]
	-- upvalues: telemetryService (ref), t_1 (ref)
	if p4 then
		telemetryService:LogEvent(t_1.UnmuteAll.eventConfig, {})
		
		return
	end
	telemetryService:LogEvent(t_1.MuteAll.eventConfig, {})
end

function t.trackToggleMutePlayer(_, p5, p6, p7) --[[ line: 332 ]]
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

function t.trackRequestFriendship(_, p8) --[[ line: 350 ]]
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

function t.trackBlockUserButtonClick(_, p9, p10, p11) --[[ line: 365 ]]
	-- upvalues: t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.BlockUserButtonClick.eventConfig, {
		customFields = { blockeeUserId = p9, blockerUserId = p10, source = p11 }
	})
end

function t.trackBlockUser(_, p12, p13, p14) --[[ line: 376 ]]
	-- upvalues: t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.BlockUser.eventConfig, {
		customFields = { blockeeUserId = p12, blockerUserId = p13, source = p14 }
	})
end

function t.trackUnblockUser(_, p15, p16, p17) --[[ line: 387 ]]
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
	function t.trackPeoplePageLayoutChanged(_, p18) --[[ line: 399 ]]
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
	
	function t.trackPersonCardMenuToggled(_, p19) --[[ line: 411 ]]
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
local t_2 = {
	openedVolumeUiList = false,
	openedVolumeUiCard = false,
	changedPerUserVolume = false,
	reported = false
}

local function _() --[[ line: 442 | named "getPerUserVoiceVolumeUxVariant" ]]
	-- upvalues: fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref)
	return if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
end

local _ = function() --[[ line: 452 | named "resetPerUserVoiceVolumeSessionState" ]]
	-- upvalues: t_2 (ref)
	t_2.openedVolumeUiList = false
	t_2.openedVolumeUiCard = false
	t_2.changedPerUserVolume = false
	t_2.reported = false
end

function t.getPerUserVoiceVolumeUxVariant() --[[ line: 459 ]]
	-- upvalues: fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref)
	return if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
end

function t.recordPerUserVoiceVolumeUiOpened(_, p20) --[[ line: 463 ]]
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), ENTRY_POINT (ref), t_2 (ref)
	if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if p20 == ENTRY_POINT.PEOPLE_LIST then
		t_2.openedVolumeUiList = true
		
		return
	elseif p20 == ENTRY_POINT.PEOPLE_CARD then
		t_2.openedVolumeUiCard = true
	end
end

function t.trackPerUserVoiceVolumeSliderTouch(_, p21) --[[ line: 475 ]]
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref), telemetryService (ref), t_1 (ref)
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		telemetryService:LogCounter(t_1.PerUserVoiceVolumeSliderTouch.counterConfig, {
			customFields = {
				entryPoint = p21,
				uxVariant = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
			}
		}, 1)
		
		return
	end
end

function t.trackPerUserVoiceVolumeChanged(_, p22) --[[ line: 490 ]]
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref), VOICE_VOLUME (ref), userGameSettingsService (ref), telemetryService (ref), t_1 (ref), t_2 (ref)
	if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if p22.newVolume == p22.oldVolume then return end
	local var11
	local var10 = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
	local wasMutedAtStart = p22.wasMutedAtStart
	
	if var10 == uXVARIANT.SYNC then
		local var12
		var11 = false
		
		if wasMutedAtStart == false then
			local _ = p22.newVolume == VOICE_VOLUME.MIN
		end
	else
		var11 = nil
	end
	if var10 == uXVARIANT.SYNC then
		var12 = false
		
		if wasMutedAtStart == true then
			local _ = VOICE_VOLUME.MIN < p22.newVolume
		end
	else
		var12 = nil
	end
	telemetryService:LogEvent(t_1.PerUserVoiceVolumeChanged.eventConfig, {
		customFields = {
			playSessionId = p22.playSessionId,
			voiceSessionId = p22.voiceSessionId,
			entryPoint = p22.entryPoint,
			targetUserId = p22.targetUserId,
			oldVolume = p22.oldVolume,
			newVolume = p22.newVolume,
			wasMutedAtStart = if var10 == uXVARIANT.DISABLE_WHEN_MUTED then nil else wasMutedAtStart,
			mutedViaSlider = var11,
			unmutedViaSlider = var12,
			uxVariant = var10,
			masterVolume = userGameSettingsService.MasterVolume,
			voiceChatVolume = userGameSettingsService.VoiceChatVolume,
			dragDurationMs = p22.dragDurationMs
		},
		standardizedFields = { "addPlaceId", "addUniverseId" }
	})
	t_2.changedPerUserVolume = true
	
	if var11 then
		telemetryService:LogCounter(t_1.PerUserVoiceVolumeMutedViaSlider.counterConfig, {
			customFields = { entryPoint = p22.entryPoint, uxVariant = var10 }
		}, 1)
	end
	if var12 then
		telemetryService:LogCounter(t_1.PerUserVoiceVolumeUnmutedViaSlider.counterConfig, {
			customFields = { entryPoint = p22.entryPoint, uxVariant = var10 }
		}, 1)
	end
end

function t.flushPerUserVoiceVolumeSession(_, p23, p24) --[[ line: 552 ]]
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), t_2 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (ref), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref), telemetryService (ref), t_1 (ref)
	if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if t_2.reported then return end
	t_2.reported = true
	local var13 = if fFlagVoiceVolumeControlsPerUserPlayerListButton then t_2.openedVolumeUiList else nil
	local var14 = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then t_2.openedVolumeUiCard else nil
	telemetryService:LogEvent(t_1.PerUserVoiceVolumeSession.eventConfig, {
		customFields = {
			playSessionId = p23,
			voiceSessionId = p24,
			openedVolumeUi = if var13 ~= true then var14 == true else true,
			openedVolumeUiList = var13,
			openedVolumeUiCard = var14,
			changedPerUserVolume = t_2.changedPerUserVolume,
			uxVariant = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
		},
		standardizedFields = { "addPlaceId", "addUniverseId" }
	})
	t_2.openedVolumeUiList = false
	t_2.openedVolumeUiCard = false
	t_2.changedPerUserVolume = false
end

function t.resetPerUserVoiceVolumeSession(_) --[[ line: 590 ]]
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), t_2 (ref)
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		t_2.openedVolumeUiList = false
		t_2.openedVolumeUiCard = false
		t_2.changedPerUserVolume = false
		t_2.reported = false
		
		return
	end
end

return t