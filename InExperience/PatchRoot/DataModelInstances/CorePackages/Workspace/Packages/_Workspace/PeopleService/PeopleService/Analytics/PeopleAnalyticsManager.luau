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

function t.trackGameInviteEntryPoint(_)
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

function t.trackToggleMuteSelf(_, p1)
	-- upvalues: telemetryService (ref), t_1 (ref)
	if p1 then
		telemetryService:LogEvent(t_1.UnmuteSelf.eventConfig, {})
		
		return
	end
	telemetryService:LogEvent(t_1.MuteSelf.eventConfig, {})
end

function t.trackInspectButton(_, p1, p2, p3)
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

function t.trackToggleMuteAll(_, p1)
	-- upvalues: telemetryService (ref), t_1 (ref)
	if p1 then
		telemetryService:LogEvent(t_1.UnmuteAll.eventConfig, {})
		
		return
	end
	telemetryService:LogEvent(t_1.MuteAll.eventConfig, {})
end

function t.trackToggleMutePlayer(_, p1, p2, p3)
	-- upvalues: telemetryService (ref), t_1 (ref), getFFlagAddPeoplePageCardLayout (ref)
	if p2 then
		telemetryService:LogEvent(t_1.UnmutePlayer.eventConfig, {
			customFields = {
				mutedUserId = p1,
				entryPoint = if getFFlagAddPeoplePageCardLayout() then p3 else nil
			}
		})
		
		return
	end
	telemetryService:LogEvent(t_1.MutePlayer.eventConfig, {
		customFields = {
			mutedUserId = p1,
			entryPoint = if getFFlagAddPeoplePageCardLayout() then p3 else nil
		}
	})
end

function t.trackRequestFriendship(_, p1)
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), t_1 (ref), telemetryService (ref)
	local requestFriendship = t_1.RequestFriendship
	telemetryService:LogEvent(requestFriendship.eventConfig, {
		eventContext = if getFFlagAddPeoplePageCardLayout() then "PlayersMenu" else nil,
		customFields = {
			selectedItem = "RequestFriendship",
			category = "Game",
			entryPoint = if getFFlagAddPeoplePageCardLayout() then p1 else nil
		}
	})
	telemetryService:LogCounter(requestFriendship.counterConfig, { customFields = { selectedItem = "RequestFriendship" } }, 1)
end

function t.trackBlockUserButtonClick(_, p1, p2, p3)
	-- upvalues: t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.BlockUserButtonClick.eventConfig, {
		customFields = { blockeeUserId = p1, blockerUserId = p2, source = p3 }
	})
end

function t.trackBlockUser(_, p1, p2, p3)
	-- upvalues: t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.BlockUser.eventConfig, {
		customFields = { blockeeUserId = p1, blockerUserId = p2, source = p3 }
	})
end

function t.trackUnblockUser(_, p1, p2, p3)
	-- upvalues: getFFlagAddPeoplePageCardLayout (ref), t_1 (ref), telemetryService (ref)
	telemetryService:LogEvent(t_1.UnblockUser.eventConfig, {
		customFields = {
			blockeeUserId = p1,
			blockerUserId = p2,
			entryPoint = if getFFlagAddPeoplePageCardLayout() then p3 else nil
		}
	})
end

if getFFlagAddPeoplePageCardLayout() then
	function t.trackPeoplePageLayoutChanged(_, p1)
		-- upvalues: t_1 (ref), telemetryService (ref)
		telemetryService:LogEvent(t_1.PeoplePageLayoutChanged.eventConfig, {
			customFields = { layout = p1.Name },
			standardizedFields = {
				"addPlaceId",
				"addUniverseId",
				"addPlaySessionId",
				"addSessionInfo"
			}
		})
	end
	
	function t.trackPersonCardMenuToggled(_, p1)
		-- upvalues: t_1 (ref), telemetryService (ref)
		telemetryService:LogEvent(t_1.PersonCardMenuToggled.eventConfig, {
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
local t_2 = {
	openedVolumeUiList = false,
	openedVolumeUiCard = false,
	changedPerUserVolume = false,
	reported = false
}

local function _()
	-- upvalues: fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref)
	return if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
end

local _ = function()
	-- upvalues: t_2 (ref)
	t_2.openedVolumeUiList = false
	t_2.openedVolumeUiCard = false
	t_2.changedPerUserVolume = false
	t_2.reported = false
end

function t.getPerUserVoiceVolumeUxVariant()
	-- upvalues: fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref)
	return if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
end

function t.recordPerUserVoiceVolumeUiOpened(_, p1)
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), ENTRY_POINT (ref), t_2 (ref)
	if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if p1 == ENTRY_POINT.PEOPLE_LIST then
		t_2.openedVolumeUiList = true
		
		return
	elseif p1 == ENTRY_POINT.PEOPLE_CARD then
		t_2.openedVolumeUiCard = true
	end
end

function t.trackPerUserVoiceVolumeSliderTouch(_, p1)
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref), telemetryService (ref), t_1 (ref)
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		telemetryService:LogCounter(t_1.PerUserVoiceVolumeSliderTouch.counterConfig, {
			customFields = {
				entryPoint = p1,
				uxVariant = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
			}
		}, 1)
		
		return
	end
end

function t.trackPerUserVoiceVolumeChanged(_, p1)
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref), VOICE_VOLUME (ref), userGameSettingsService (ref), telemetryService (ref), t_1 (ref), t_2 (ref)
	if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if p1.newVolume == p1.oldVolume then return end
	local var1
	local var2 = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
	local wasMutedAtStart = p1.wasMutedAtStart
	
	if var2 == uXVARIANT.SYNC then
		local var3
		var1 = false
		
		if wasMutedAtStart == false then
			local _ = p1.newVolume == VOICE_VOLUME.MIN
		end
	else
		var1 = nil
	end
	if var2 == uXVARIANT.SYNC then
		var3 = false
		
		if wasMutedAtStart == true then
			local _ = VOICE_VOLUME.MIN < p1.newVolume
		end
	else
		var3 = nil
	end
	telemetryService:LogEvent(t_1.PerUserVoiceVolumeChanged.eventConfig, {
		customFields = {
			playSessionId = p1.playSessionId,
			voiceSessionId = p1.voiceSessionId,
			entryPoint = p1.entryPoint,
			targetUserId = p1.targetUserId,
			oldVolume = p1.oldVolume,
			newVolume = p1.newVolume,
			wasMutedAtStart = if var2 == uXVARIANT.DISABLE_WHEN_MUTED then nil else wasMutedAtStart,
			mutedViaSlider = var1,
			unmutedViaSlider = var3,
			uxVariant = var2,
			masterVolume = userGameSettingsService.MasterVolume,
			voiceChatVolume = userGameSettingsService.VoiceChatVolume,
			dragDurationMs = p1.dragDurationMs
		},
		standardizedFields = { "addPlaceId", "addUniverseId" }
	})
	t_2.changedPerUserVolume = true
	
	if var1 then
		telemetryService:LogCounter(t_1.PerUserVoiceVolumeMutedViaSlider.counterConfig, {
			customFields = { entryPoint = p1.entryPoint, uxVariant = var2 }
		}, 1)
	end
	if var3 then
		telemetryService:LogCounter(t_1.PerUserVoiceVolumeUnmutedViaSlider.counterConfig, {
			customFields = { entryPoint = p1.entryPoint, uxVariant = var2 }
		}, 1)
	end
end

function t.flushPerUserVoiceVolumeSession(_, p1, p2)
	-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), t_2 (ref), fFlagVoiceVolumeControlsPerUserPlayerListButton (ref), fFlagVoiceVolumeControlsPerUserPlayerGridMenu (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted (ref), uXVARIANT (ref), fFlagVoiceChatVolumePerUserMuteVolumeSync (ref), telemetryService (ref), t_1 (ref)
	if not fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then return end
	if t_2.reported then return end
	t_2.reported = true
	local var1 = if fFlagVoiceVolumeControlsPerUserPlayerListButton then t_2.openedVolumeUiList else nil
	local var2 = if fFlagVoiceVolumeControlsPerUserPlayerGridMenu then t_2.openedVolumeUiCard else nil
	telemetryService:LogEvent(t_1.PerUserVoiceVolumeSession.eventConfig, {
		customFields = {
			playSessionId = p1,
			voiceSessionId = p2,
			openedVolumeUi = if var1 ~= true then var2 == true else true,
			openedVolumeUiList = var1,
			openedVolumeUiCard = var2,
			changedPerUserVolume = t_2.changedPerUserVolume,
			uxVariant = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMuted then uXVARIANT.DISABLE_WHEN_MUTED elseif fFlagVoiceChatVolumePerUserMuteVolumeSync then uXVARIANT.SYNC else uXVARIANT.INDEPENDENT
		},
		standardizedFields = { "addPlaceId", "addUniverseId" }
	})
	t_2.openedVolumeUiList = false
	t_2.openedVolumeUiCard = false
	t_2.changedPerUserVolume = false
end

function t.resetPerUserVoiceVolumeSession(_)
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