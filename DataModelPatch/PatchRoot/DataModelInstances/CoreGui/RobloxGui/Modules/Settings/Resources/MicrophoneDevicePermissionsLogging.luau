local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AvatarChatService = game:GetService("AvatarChatService")
local MicrophoneDevicePermissionsLoggingEventName = game:DefineFastString("MicrophoneDevicePermissionsLoggingEventName", "microphoneDevicePermissionPrompted")

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
	_init = function(EventPayload, ClientFeatures, DidAuthorize)
		-- upvalues: AvatarChatService (copy)
		EventPayload._initialized = true
		EventPayload.placeId = game.PlaceId
		EventPayload.universeId = game.GameId
		EventPayload.placeVoiceEnabled = AvatarChatService:IsEnabled(ClientFeatures, Enum.AvatarChatServiceFeature.PlaceAudio)
		EventPayload.universeVoiceEnabled = AvatarChatService:IsEnabled(ClientFeatures, Enum.AvatarChatServiceFeature.UniverseAudio)
		EventPayload:logExperienceJoin({ didAuthorize = DidAuthorize })
	end,
	_getEventPayload = function(EventPayload, UiType, EventPayload1)
		return {
			uiType = UiType,
			uiContext = EventPayload1.uiContext,
			didAuthorize = EventPayload1.didAuthorize,
			placeId = EventPayload.placeId,
			universeId = EventPayload.universeId,
			placeVoiceEnabled = EventPayload.placeVoiceEnabled,
			universeVoiceEnabled = EventPayload.universeVoiceEnabled,
			clientSessionId = EventPayload.clientSessionId
		}
	end,
	_isReady = function(p1)
		return p1._initialized
	end,
	init = function(p1, DidAuthorize)
		-- upvalues: AvatarChatService (copy)
		if AvatarChatService.ClientFeaturesInitialized then
			p1:_init(AvatarChatService.ClientFeatures, DidAuthorize)
			
			return
		else
			local Connection = nil
			Connection = AvatarChatService:GetPropertyChangedSignal("ClientFeatures"):Connect(function()
				-- upvalues: p1 (copy), AvatarChatService (upval), DidAuthorize (copy), Connection (ref)
				p1:_init(AvatarChatService.ClientFeatures, DidAuthorize)
				Connection:Disconnect()
			end)
		end
	end,
	logExperienceJoin = function(p1, p2)
		-- upvalues: RbxAnalyticsService (copy), MicrophoneDevicePermissionsLoggingEventName (copy)
		if p1:_isReady() then
			RbxAnalyticsService:SendEventDeferred("client", "voice", MicrophoneDevicePermissionsLoggingEventName, p1:_getEventPayload(p1.UIType.EXPERIENCE_JOIN, p2))
			
			return
		end
	end,
	logPromptImpression = function(p1, p2)
		-- upvalues: RbxAnalyticsService (copy), MicrophoneDevicePermissionsLoggingEventName (copy)
		if p1:_isReady() then
			RbxAnalyticsService:SendEventDeferred("client", "voice", MicrophoneDevicePermissionsLoggingEventName, p1:_getEventPayload(p1.UIType.PROMPT_IMPRESSION, p2))
			
			return
		end
	end,
	logPromptInteraction = function(p1, p2)
		-- upvalues: RbxAnalyticsService (copy), MicrophoneDevicePermissionsLoggingEventName (copy)
		if p1:_isReady() then
			RbxAnalyticsService:SendEventDeferred("client", "voice", MicrophoneDevicePermissionsLoggingEventName, p1:_getEventPayload(p1.UIType.PROMPT_INTERACTION, p2))
			
			return
		end
	end,
	setClientSessionId = function(p1, ClientSessionId)
		if p1:_isReady() and p1.clientSessionId ~= ClientSessionId then
			p1.clientSessionId = ClientSessionId
			
			return
		end
	end
}