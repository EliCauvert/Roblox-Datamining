local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local constantsModule = require(appChat.Constants)
local conversationModule = require(appChat.Models.Conversation)
local enumScreensModule = require(appChat.EnumScreens)
local getOverlayStoreModule = require(appChat.Stores.GetOverlayStore)
local overlayTypesModule = require(appChat.Stores.GetOverlayStore.OverlayTypes)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getConversationConsentUpdateModule = require(script.Parent.getConversationConsentUpdate)
local fFlagAppChatSquadJoinButtonU13OSAModule = require(appChat.Flags.FFlagAppChatSquadJoinButtonU13OSA)
local fFlagFriendsChatEnableConversationConsent = require(parent.SharedFlags).FFlagFriendsChatEnableConversationConsent
local normalizeConversationForTelemetryModule = require(script.Parent.normalizeConversationForTelemetry)

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	return if p1 then constantsModule.OptInVariant.ChatOptInInfoCard elseif p2 then constantsModule.OptInVariant.OsaContextCard else nil
end

local _ = function(p1, p2, p3)
	-- upvalues: constantsModule (ref), fFlagAppChatSquadJoinButtonU13OSAModule (ref), conversationModule (ref)
	return if p1 then constantsModule.OptInVariant.OsaContextCard elseif fFlagAppChatSquadJoinButtonU13OSAModule and p2 and p3 == conversationModule.Type.MULTI_USER_CONVERSATION then constantsModule.OptInVariant.ChatOptInInfoCard else nil
end

local function showOsaOverlay(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: getOverlayStoreModule (ref), overlayTypesModule (ref), fFlagFriendsChatEnableConversationConsent (ref), getConversationConsentUpdateModule (ref), getConversationStoreModule (ref), cryoModule (ref), enumScreensModule (ref), conversationModule (ref), removedConversationModule (ref)
	local var1 = getOverlayStoreModule(false)
	var1.showOverlay(overlayTypesModule.GroupOSADialog, {
		conversationId = p1,
		impressionId = p2,
		modalVariant = p3,
		onJoin = function()
			-- upvalues: fFlagFriendsChatEnableConversationConsent (copy), getConversationConsentUpdateModule (copy), p3 (ref), getConversationStoreModule (copy), p1 (ref), cryoModule (copy), var1 (ref), p5 (ref), p7 (ref), enumScreensModule (copy)
			if fFlagFriendsChatEnableConversationConsent then
				local var2 = getConversationConsentUpdateModule(p3)
				
				if var2 then
					local conversation = getConversationStoreModule(false).getConversation(p1, false)
					
					if conversation then
						getConversationStoreModule(false).upsertConversation(cryoModule.Dictionary.join(conversation, { [var2.field] = var2.value }), false)
					end
				end
			end
			var1.dismissOverlay()
			
			if p5 then
				p5(p1)
				
				return
			end
			p7.navigate(enumScreensModule.ChatConversation, { isNavigatedFromGroupOSAJoin = true, conversationId = p1 })
		end,
		onDecline = function()
			-- upvalues: p1 (ref), p4 (ref), conversationModule (copy), getConversationStoreModule (copy), p6 (ref), removedConversationModule (copy), var1 (ref)
			if p1 and p4 == conversationModule.Type.MULTI_USER_CONVERSATION then
				getConversationStoreModule(false).removeConversation(p1)
				p6(removedConversationModule(p1))
			end
			var1.dismissOverlay()
		end
	})
end

local function activateConversation(p1, p2, p3, p4, p5)
	-- upvalues: constantsModule (ref), httpService (ref), showOsaOverlay (ref), normalizeConversationForTelemetryModule (ref)
	if not p1.hasConversation then return end
	local conversationId = p1.conversationId
	local conversation = p2.getConversation(conversationId, false)
	
	if conversation == nil then return end
	local var1 = nil
	local var2 = if p1.shouldShowU13ChatOptIn then constantsModule.OptInVariant.ChatOptInInfoCard elseif p1.shouldShowOSA then constantsModule.OptInVariant.OsaContextCard else nil
	
	if var2 then
		var1 = httpService:GenerateGUID(false)
		showOsaOverlay(conversationId, var1, var2, p1.conversationType, if p1.onActivated then function(p6)
			-- upvalues: p2 (ref), p1 (ref)
			local conversation = p2.getConversation(p6, false)
			
			if conversation then
				p1.onActivated(conversation)
			end
		end else nil, p3, p4)
	elseif p1.onActivated then
		p1.onActivated(conversation)
	end
	if p1.fireClickEvent then
		p1.fireClickEvent(normalizeConversationForTelemetryModule(conversation), p5, var1)
	end
end

local function activateSquad(p1, p2, p3, p4, p5)
	-- upvalues: constantsModule (ref), fFlagAppChatSquadJoinButtonU13OSAModule (ref), conversationModule (ref), httpService (ref), showOsaOverlay (ref)
	local var1 = if p3 then p1.conversationId else p2
	
	if p1.hasConversation then
		local var2 = if p1.shouldShowOSA then constantsModule.OptInVariant.OsaContextCard elseif fFlagAppChatSquadJoinButtonU13OSAModule and p1.shouldShowU13ChatOptIn and p1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then constantsModule.OptInVariant.ChatOptInInfoCard else nil
		
		if var2 then
			showOsaOverlay(var1, httpService:GenerateGUID(false), var2, p1.conversationType, p1.onSquadJoinButtonActivated, p4, p5)
			
			return
		elseif p1.onSquadJoinButtonActivated then
			p1.onSquadJoinButtonActivated(var1)
		end
		return
	elseif p1.onSquadJoinButtonActivated then
		p1.onSquadJoinButtonActivated(var1)
	end
end

return function(p1)
	-- upvalues: reactModule (ref), useNavigation (ref), useDispatch (ref), getConversationStoreModule (ref), activateConversation (ref), activateSquad (ref)
	local getCurrentOptions = p1.getCurrentOptions
	local conversationId = p1.conversationId
	local hasConversation = p1.hasConversation
	local shouldShowOSA = p1.shouldShowOSA
	local shouldShowU13ChatOptIn = p1.shouldShowU13ChatOptIn
	local conversationType = p1.conversationType
	local onActivated = p1.onActivated
	local onSquadJoinButtonActivated = p1.onSquadJoinButtonActivated
	local fireClickEvent = p1.fireClickEvent
	local telemetry = p1.telemetry
	local var1 = reactModule.useRef(telemetry)
	var1.current = telemetry
	local var2 = useNavigation()
	local var3 = useDispatch()
	local var4 = getConversationStoreModule(false)
	
	return if getCurrentOptions == nil then {
		onActivated = reactModule.useCallback(function()
			-- upvalues: activateConversation (copy), conversationId (ref), hasConversation (ref), shouldShowOSA (ref), shouldShowU13ChatOptIn (ref), conversationType (ref), onActivated (ref), fireClickEvent (ref), var4 (ref), var3 (ref), var2 (ref), var1 (ref)
			activateConversation({
				conversationId = conversationId,
				hasConversation = hasConversation,
				shouldShowOSA = shouldShowOSA,
				shouldShowU13ChatOptIn = shouldShowU13ChatOptIn,
				conversationType = conversationType,
				onActivated = onActivated,
				fireClickEvent = fireClickEvent
			}, var4, var3, var2, var1.current)
		end, {
			hasConversation, conversationId, conversationType, shouldShowOSA,
			shouldShowU13ChatOptIn, onActivated, fireClickEvent, var3, var2, var4
		}),
		onSquadActivated = reactModule.useCallback(function(p2)
			-- upvalues: activateSquad (copy), conversationId (ref), hasConversation (ref), shouldShowOSA (ref), shouldShowU13ChatOptIn (ref), conversationType (ref), onSquadJoinButtonActivated (ref), var3 (ref), var2 (ref)
			activateSquad({
				conversationId = conversationId,
				hasConversation = hasConversation,
				shouldShowOSA = shouldShowOSA,
				shouldShowU13ChatOptIn = shouldShowU13ChatOptIn,
				conversationType = conversationType,
				onSquadJoinButtonActivated = onSquadJoinButtonActivated
			}, p2, false, var3, var2)
		end, {
			hasConversation, conversationId, conversationType, shouldShowOSA,
			shouldShowU13ChatOptIn, onSquadJoinButtonActivated, var3, var2,
			var4.getConversation
		})
	} else {
		onActivated = reactModule.useCallback(function()
			-- upvalues: getCurrentOptions (ref), activateConversation (copy), var4 (ref), var3 (ref), var2 (ref), var1 (ref)
			if getCurrentOptions == nil then
				return
			end
			activateConversation(getCurrentOptions(), var4, var3, var2, var1.current)
		end, { var3, var2, var4, getCurrentOptions }),
		onSquadActivated = reactModule.useCallback(function(p2)
			-- upvalues: getCurrentOptions (ref), activateSquad (copy), var3 (ref), var2 (ref)
			if getCurrentOptions == nil then
				return
			end
			activateSquad(getCurrentOptions(), p2, true, var3, var2)
		end, { var3, var2, getCurrentOptions })
	}
end