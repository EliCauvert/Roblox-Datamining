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
	_init = function(p1, p2, p3)
		-- upvalues: avatarChatService (ref)
		p1._initialized = true
		p1.placeId = game.PlaceId
		p1.universeId = game.GameId
		p1.placeVoiceEnabled = avatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.PlaceAudio)
		p1.universeVoiceEnabled = avatarChatService:IsEnabled(p2, Enum.AvatarChatServiceFeature.UniverseAudio)
		p1:logExperienceJoin({ didAuthorize = p3 })
	end,
	_getEventPayload = function(p1, p2, p3)
		return {
			uiType = p2,
			uiContext = p3.uiContext,
			didAuthorize = p3.didAuthorize,
			placeId = p1.placeId,
			universeId = p1.universeId,
			placeVoiceEnabled = p1.placeVoiceEnabled,
			universeVoiceEnabled = p1.universeVoiceEnabled,
			clientSessionId = p1.clientSessionId
		}
	end,
	_isReady = function(p1)
		return p1._initialized
	end,
	init = function(p1, p2)
		-- upvalues: avatarChatService (ref)
		if avatarChatService.ClientFeaturesInitialized then
			p1:_init(avatarChatService.ClientFeatures, p2)
			
			return
		end
		local var1 = nil
		var1 = avatarChatService:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
			-- upvalues: p1 (ref), avatarChatService (copy), p2 (ref), var1 (write)
			p1:_init(avatarChatService.ClientFeatures, p2)
			var1:Disconnect()
		end)
	end,
	logExperienceJoin = function(p1, p2)
		-- upvalues: rbxAnalyticsService (ref), microphoneDevicePermissionsLoggingEventName (ref)
		if p1:_isReady() then
			rbxAnalyticsService:SendEventDeferred("client", "voice", microphoneDevicePermissionsLoggingEventName, p1:_getEventPayload(p1.UIType.EXPERIENCE_JOIN, p2))
			
			return
		end
	end,
	logPromptImpression = function(p1, p2)
		-- upvalues: rbxAnalyticsService (ref), microphoneDevicePermissionsLoggingEventName (ref)
		if p1:_isReady() then
			rbxAnalyticsService:SendEventDeferred("client", "voice", microphoneDevicePermissionsLoggingEventName, p1:_getEventPayload(p1.UIType.PROMPT_IMPRESSION, p2))
			
			return
		end
	end,
	logPromptInteraction = function(p1, p2)
		-- upvalues: rbxAnalyticsService (ref), microphoneDevicePermissionsLoggingEventName (ref)
		if p1:_isReady() then
			rbxAnalyticsService:SendEventDeferred("client", "voice", microphoneDevicePermissionsLoggingEventName, p1:_getEventPayload(p1.UIType.PROMPT_INTERACTION, p2))
			
			return
		end
	end,
	setClientSessionId = function(value, p1)
		if value:_isReady() and value.clientSessionId ~= p1 then
			value.clientSessionId = p1
			
			return
		end
	end
}