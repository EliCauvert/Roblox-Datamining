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

return function(p1)
	-- upvalues: reactModule (ref), useNavigation (ref), useDispatch (ref), getConversationStoreModule (ref), constantsModule (ref), httpService (ref), showOsaOverlay (ref), normalizeConversationForTelemetryModule (ref), fFlagAppChatSquadJoinButtonU13OSAModule (ref), conversationModule (ref)
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
	
	return {
		onActivated = reactModule.useCallback(function()
			-- upvalues: hasConversation (ref), var4 (ref), conversationId (ref), shouldShowU13ChatOptIn (ref), shouldShowOSA (ref), constantsModule (copy), httpService (copy), showOsaOverlay (copy), conversationType (ref), onActivated (ref), var3 (ref), var2 (ref), fireClickEvent (ref), normalizeConversationForTelemetryModule (copy), var1 (ref)
			if not hasConversation then return end
			local conversation = var4.getConversation(conversationId, false)
			
			if conversation == nil then return end
			local var5 = nil
			local var6 = if shouldShowU13ChatOptIn then constantsModule.OptInVariant.ChatOptInInfoCard elseif shouldShowOSA then constantsModule.OptInVariant.OsaContextCard else nil
			
			if var6 then
				var5 = httpService:GenerateGUID(false)
				showOsaOverlay(conversationId, var5, var6, conversationType, if onActivated then function(p2)
					-- upvalues: var4 (copy), onActivated (copy)
					local conversation = var4.getConversation(p2, false)
					
					if conversation then
						onActivated(conversation)
					end
				end else nil, var3, var2)
			elseif onActivated then
				onActivated(conversation)
			end
			if fireClickEvent then
				fireClickEvent(normalizeConversationForTelemetryModule(conversation), var1.current, var5)
			end
		end, {
			hasConversation, conversationId, conversationType, shouldShowOSA,
			shouldShowU13ChatOptIn, onActivated, fireClickEvent, var3, var2, var4
		}),
		onSquadActivated = reactModule.useCallback(function(p2)
			-- upvalues: hasConversation (ref), onSquadJoinButtonActivated (ref), shouldShowOSA (ref), shouldShowU13ChatOptIn (ref), conversationType (ref), constantsModule (copy), fFlagAppChatSquadJoinButtonU13OSAModule (copy), conversationModule (copy), httpService (copy), showOsaOverlay (copy), var3 (ref), var2 (ref)
			if hasConversation then
				local var5 = if shouldShowOSA then constantsModule.OptInVariant.OsaContextCard elseif fFlagAppChatSquadJoinButtonU13OSAModule and shouldShowU13ChatOptIn and conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then constantsModule.OptInVariant.ChatOptInInfoCard else nil
				
				if var5 then
					showOsaOverlay(p2, httpService:GenerateGUID(false), var5, conversationType, onSquadJoinButtonActivated, var3, var2)
					
					return
				elseif onSquadJoinButtonActivated then
					onSquadJoinButtonActivated(p2)
				end
				return
			elseif onSquadJoinButtonActivated then
				onSquadJoinButtonActivated(p2)
			end
		end, {
			hasConversation, conversationId, conversationType, shouldShowOSA,
			shouldShowU13ChatOptIn, onSquadJoinButtonActivated, var3, var2,
			var4.getConversation
		})
	}
end