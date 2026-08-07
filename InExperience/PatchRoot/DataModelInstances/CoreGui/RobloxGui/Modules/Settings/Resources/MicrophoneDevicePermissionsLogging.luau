local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local avatarChatService = game:GetService("AvatarChatService")
local microphoneDevicePermissionsLoggingEventName = game:DefineFastString("MicrophoneDevicePermissionsLoggingEventName", "microphoneDevicePermissionPrompted")

return {
	_initialized = false,
	placeId = 0,
	universeId = 0,
	placeVoiceEnabled = false,
	universeVoiceEnabled = false,
	clientSessionId = "",
	UIType = {
		EXPERIENCE_JOIN = 0,
		PROMPT_IMPRESSION = 1,
		PROMPT_INTERACTION = 2
	},
	_init = function(p0, p1, p2) --[[ line: 56 ]]
		-- upvalues: avatarChatService (ref)
		p0._initialized = true
		p0.placeId = game.PlaceId
		p0.universeId = game.GameId
		p0.placeVoiceEnabled = avatarChatService:IsEnabled(p1, Enum.AvatarChatServiceFeature.PlaceAudio)
		p0.universeVoiceEnabled = avatarChatService:IsEnabled(p1, Enum.AvatarChatServiceFeature.UniverseAudio)
		p0:logExperienceJoin({ didAuthorize = p2 })
	end,
	_getEventPayload = function(p3, p4, p5) --[[ line: 68 ]]
		return {
			uiType = p4,
			uiContext = p5.uiContext,
			didAuthorize = p5.didAuthorize,
			placeId = p3.placeId,
			universeId = p3.universeId,
			placeVoiceEnabled = p3.placeVoiceEnabled,
			universeVoiceEnabled = p3.universeVoiceEnabled,
			clientSessionId = p3.clientSessionId
		}
	end,
	_isReady = function(p6) --[[ line: 81 ]]
		return p6._initialized
	end,
	init = function(p7, p8) --[[ line: 85 ]]
		-- upvalues: avatarChatService (ref)
		if avatarChatService.ClientFeaturesInitialized then
			p7:_init(avatarChatService.ClientFeatures, p8)
			
			return
		end
		local var3 = nil
		var3 = avatarChatService:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ line: 90 ]]
			-- upvalues: p7 (ref), avatarChatService (copy), p8 (ref), var3 (write)
			p7:_init(avatarChatService.ClientFeatures, p8)
			var3:Disconnect()
		end)
	end,
	logExperienceJoin = function(p9, p10) --[[ line: 97 ]]
		-- upvalues: rbxAnalyticsService (ref), microphoneDevicePermissionsLoggingEventName (ref)
		if p9:_isReady() then
			rbxAnalyticsService:SendEventDeferred("client", "voice", microphoneDevicePermissionsLoggingEventName, p9:_getEventPayload(p9.UIType.EXPERIENCE_JOIN, p10))
			
			return
		end
	end,
	logPromptImpression = function(p11, p12) --[[ line: 110 ]]
		-- upvalues: rbxAnalyticsService (ref), microphoneDevicePermissionsLoggingEventName (ref)
		if p11:_isReady() then
			rbxAnalyticsService:SendEventDeferred("client", "voice", microphoneDevicePermissionsLoggingEventName, p11:_getEventPayload(p11.UIType.PROMPT_IMPRESSION, p12))
			
			return
		end
	end,
	logPromptInteraction = function(p13, p14) --[[ line: 123 ]]
		-- upvalues: rbxAnalyticsService (ref), microphoneDevicePermissionsLoggingEventName (ref)
		if p13:_isReady() then
			rbxAnalyticsService:SendEventDeferred("client", "voice", microphoneDevicePermissionsLoggingEventName, p13:_getEventPayload(p13.UIType.PROMPT_INTERACTION, p14))
			
			return
		end
	end,
	setClientSessionId = function(value, p15) --[[ line: 136 ]]
		if value:_isReady() and value.clientSessionId ~= p15 then
			value.clientSessionId = p15
			
			return
		end
	end
}