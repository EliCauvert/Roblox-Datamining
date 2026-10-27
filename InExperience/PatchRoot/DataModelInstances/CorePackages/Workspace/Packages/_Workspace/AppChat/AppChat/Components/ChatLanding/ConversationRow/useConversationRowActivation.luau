local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ConstantsModule = require(AppChat.Constants)
local ConversationModule = require(AppChat.Models.Conversation)
local EnumScreensModule = require(AppChat.EnumScreens)
local GetOverlayStoreModule = require(AppChat.Stores.GetOverlayStore)
local OverlayTypesModule = require(AppChat.Stores.GetOverlayStore.OverlayTypes)
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationConsentUpdateModule = require(script.Parent.getConversationConsentUpdate)
local FFlagAppChatEnableU13ChatOptIn = require(Parent.SharedFlags).FFlagAppChatEnableU13ChatOptIn
local FFlagFriendsChatEnableConversationConsent = require(Parent.SharedFlags).FFlagFriendsChatEnableConversationConsent
local NormalizeConversationForTelemetryModule = require(script.Parent.normalizeConversationForTelemetry)

local function _(p1, p2)
	-- upvalues: ConstantsModule (copy)
	return if p1 then ConstantsModule.OptInVariant.ChatOptInInfoCard elseif p2 then ConstantsModule.OptInVariant.OsaContextCard else nil
end

local _ = function(p1, p2, MULTIUSERCONVERSATION)
	-- upvalues: ConstantsModule (copy), FFlagAppChatEnableU13ChatOptIn (copy), ConversationModule (copy)
	return if p1 then ConstantsModule.OptInVariant.OsaContextCard elseif FFlagAppChatEnableU13ChatOptIn and p2 and MULTIUSERCONVERSATION == ConversationModule.Type.MULTI_USER_CONVERSATION then ConstantsModule.OptInVariant.ChatOptInInfoCard else nil
end

local function showOsaOverlay(ConversationId, ImpressionId, ModalVariant, ConversationType, Callback1, Callback, p1)
	-- upvalues: GetOverlayStoreModule (copy), OverlayTypesModule (copy), FFlagFriendsChatEnableConversationConsent (copy), GetConversationConsentUpdateModule (copy), GetConversationStoreModule (copy), CryoModule (copy), EnumScreensModule (copy), ConversationModule (copy), RemovedConversationModule (copy)
	local OverlayStoreModule = GetOverlayStoreModule(false)
	OverlayStoreModule.showOverlay(OverlayTypesModule.GroupOSADialog, {
		conversationId = ConversationId,
		impressionId = ImpressionId,
		modalVariant = ModalVariant,
		onJoin = function()
			-- upvalues: FFlagFriendsChatEnableConversationConsent (upval), GetConversationConsentUpdateModule (upval), ModalVariant (copy), GetConversationStoreModule (upval), ConversationId (copy), CryoModule (upval), OverlayStoreModule (copy), Callback1 (copy), p1 (copy), EnumScreensModule (upval)
			if FFlagFriendsChatEnableConversationConsent then
				local ConversationConsentUpdateModule = GetConversationConsentUpdateModule(ModalVariant)
				
				if ConversationConsentUpdateModule then
					local Conversation = GetConversationStoreModule(false).getConversation(ConversationId, false)
					
					if Conversation then
						GetConversationStoreModule(false).upsertConversation(CryoModule.Dictionary.join(Conversation, {
							[ConversationConsentUpdateModule.field] = ConversationConsentUpdateModule.value
						}), false)
					end
				end
			end
			OverlayStoreModule.dismissOverlay()
			
			if Callback1 then
				Callback1(ConversationId)
				
				return
			else
				p1.navigate(EnumScreensModule.ChatConversation, {
					isNavigatedFromGroupOSAJoin = true,
					conversationId = ConversationId
				})
			end
		end,
		onDecline = function()
			-- upvalues: ConversationId (copy), ConversationType (copy), ConversationModule (upval), GetConversationStoreModule (upval), Callback (copy), RemovedConversationModule (upval), OverlayStoreModule (copy)
			if ConversationId and ConversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
				GetConversationStoreModule(false).removeConversation(ConversationId)
				Callback(RemovedConversationModule(ConversationId))
			end
			OverlayStoreModule.dismissOverlay()
		end
	})
end

local function activateConversation(p1, p2, p3, p4, Current)
	-- upvalues: ConstantsModule (copy), HttpService (copy), showOsaOverlay (copy), NormalizeConversationForTelemetryModule (copy)
	if not p1.hasConversation then return end
	local ConversationId = p1.conversationId
	local Conversation = p2.getConversation(ConversationId, false)
	
	if Conversation == nil then return end
	local Guid = nil
	local ShouldShowOSA = p1.shouldShowOSA
	local ChatOptInInfoCard = if p1.shouldShowU13ChatOptIn then ConstantsModule.OptInVariant.ChatOptInInfoCard elseif ShouldShowOSA then ConstantsModule.OptInVariant.OsaContextCard else nil
	
	if ChatOptInInfoCard then
		Guid = HttpService:GenerateGUID(false)
		showOsaOverlay(ConversationId, Guid, ChatOptInInfoCard, p1.conversationType, if p1.onActivated then function(p5)
			-- upvalues: p2 (copy), p1 (copy)
			local Conversation = p2.getConversation(p5, false)
			
			if Conversation then
				p1.onActivated(Conversation)
			end
		end else nil, p3, p4)
	elseif p1.onActivated then
		p1.onActivated(Conversation)
	end
	if p1.fireClickEvent then
		p1.fireClickEvent(NormalizeConversationForTelemetryModule(Conversation), Current, Guid)
	end
end

local function activateSquad(p1, p2, p3, p4, p5)
	-- upvalues: ConstantsModule (copy), FFlagAppChatEnableU13ChatOptIn (copy), ConversationModule (copy), HttpService (copy), showOsaOverlay (copy)
	local ConversationId = if p3 then p1.conversationId else p2
	
	if p1.hasConversation then
		local ShouldShowU13ChatOptIn = p1.shouldShowU13ChatOptIn
		local ConversationType = p1.conversationType
		local OsaContextCard = if p1.shouldShowOSA then ConstantsModule.OptInVariant.OsaContextCard elseif FFlagAppChatEnableU13ChatOptIn and ShouldShowU13ChatOptIn and ConversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then ConstantsModule.OptInVariant.ChatOptInInfoCard else nil
		
		if OsaContextCard then
			showOsaOverlay(ConversationId, HttpService:GenerateGUID(false), OsaContextCard, p1.conversationType, p1.onSquadJoinButtonActivated, p4, p5)
			
			return
		end
		if p1.onSquadJoinButtonActivated then
			p1.onSquadJoinButtonActivated(ConversationId)
		end
		return
	elseif p1.onSquadJoinButtonActivated then
		p1.onSquadJoinButtonActivated(ConversationId)
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), GetConversationStoreModule (copy), activateConversation (copy), activateSquad (copy)
	local GetCurrentOptionsFunction = p1.getCurrentOptions
	local ConversationId = p1.conversationId
	local HasConversation = p1.hasConversation
	local ShouldShowOSA = p1.shouldShowOSA
	local ShouldShowU13ChatOptIn = p1.shouldShowU13ChatOptIn
	local ConversationType = p1.conversationType
	local OnActivated = p1.onActivated
	local OnSquadJoinButtonActivated = p1.onSquadJoinButtonActivated
	local FireClickEvent = p1.fireClickEvent
	local Telemetry = p1.telemetry
	local UseRefResult = ReactModule.useRef(Telemetry)
	UseRefResult.current = Telemetry
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local ConversationStoreModule = GetConversationStoreModule(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: activateConversation (upval), ConversationId (copy), HasConversation (copy), ShouldShowOSA (copy), ShouldShowU13ChatOptIn (copy), ConversationType (copy), OnActivated (copy), FireClickEvent (copy), ConversationStoreModule (copy), UseDispatchResult (copy), UseNavigationResult (copy), UseRefResult (copy)
		activateConversation({
			conversationId = ConversationId,
			hasConversation = HasConversation,
			shouldShowOSA = ShouldShowOSA,
			shouldShowU13ChatOptIn = ShouldShowU13ChatOptIn,
			conversationType = ConversationType,
			onActivated = OnActivated,
			fireClickEvent = FireClickEvent
		}, ConversationStoreModule, UseDispatchResult, UseNavigationResult, UseRefResult.current)
	end, {
		HasConversation, ConversationId, ConversationType, ShouldShowOSA,
		ShouldShowU13ChatOptIn, OnActivated, FireClickEvent, UseDispatchResult,
		UseNavigationResult, ConversationStoreModule
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: activateSquad (upval), ConversationId (copy), HasConversation (copy), ShouldShowOSA (copy), ShouldShowU13ChatOptIn (copy), ConversationType (copy), OnSquadJoinButtonActivated (copy), UseDispatchResult (copy), UseNavigationResult (copy)
		activateSquad({
			conversationId = ConversationId,
			hasConversation = HasConversation,
			shouldShowOSA = ShouldShowOSA,
			shouldShowU13ChatOptIn = ShouldShowU13ChatOptIn,
			conversationType = ConversationType,
			onSquadJoinButtonActivated = OnSquadJoinButtonActivated
		}, p2, false, UseDispatchResult, UseNavigationResult)
	end, {
		HasConversation, ConversationId, ConversationType, ShouldShowOSA,
		ShouldShowU13ChatOptIn, OnSquadJoinButtonActivated, UseDispatchResult,
		UseNavigationResult, ConversationStoreModule.getConversation
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: GetCurrentOptionsFunction (copy), activateConversation (upval), ConversationStoreModule (copy), UseDispatchResult (copy), UseNavigationResult (copy), UseRefResult (copy)
		if GetCurrentOptionsFunction ~= nil then
			activateConversation(GetCurrentOptionsFunction(), ConversationStoreModule, UseDispatchResult, UseNavigationResult, UseRefResult.current)
			
			return
		end
	end, {
		UseDispatchResult,
		UseNavigationResult,
		ConversationStoreModule,
		GetCurrentOptionsFunction
	})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: GetCurrentOptionsFunction (copy), activateSquad (upval), UseDispatchResult (copy), UseNavigationResult (copy)
		if GetCurrentOptionsFunction ~= nil then
			activateSquad(GetCurrentOptionsFunction(), p2, true, UseDispatchResult, UseNavigationResult)
			
			return
		end
	end, {
		UseDispatchResult,
		UseNavigationResult,
		GetCurrentOptionsFunction
	})
	
	return if GetCurrentOptionsFunction == nil then { onActivated = UseResult, onSquadActivated = UseResult1 } else { onActivated = UseResult2, onSquadActivated = UseResult3 }
end