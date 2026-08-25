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

local function _(p0, p1)
	-- upvalues: constantsModule (ref)
	return if p0 then constantsModule.OptInVariant.ChatOptInInfoCard elseif p1 then constantsModule.OptInVariant.OsaContextCard else nil
end

local _ = function(p2, p3, p4)
	-- upvalues: constantsModule (ref), fFlagAppChatSquadJoinButtonU13OSAModule (ref), conversationModule (ref)
	return if p2 then constantsModule.OptInVariant.OsaContextCard elseif fFlagAppChatSquadJoinButtonU13OSAModule and p3 and p4 == conversationModule.Type.MULTI_USER_CONVERSATION then constantsModule.OptInVariant.ChatOptInInfoCard else nil
end

local function showOsaOverlay(p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: getOverlayStoreModule (ref), overlayTypesModule (ref), fFlagFriendsChatEnableConversationConsent (ref), getConversationConsentUpdateModule (ref), getConversationStoreModule (ref), cryoModule (ref), enumScreensModule (ref), conversationModule (ref), removedConversationModule (ref)
	local var15 = getOverlayStoreModule(false)
	var15.showOverlay(overlayTypesModule.GroupOSADialog, {
		conversationId = p5,
		impressionId = p6,
		modalVariant = p7,
		onJoin = function()
			-- upvalues: fFlagFriendsChatEnableConversationConsent (copy), getConversationConsentUpdateModule (copy), p7 (ref), getConversationStoreModule (copy), p5 (ref), cryoModule (copy), var15 (ref), p9 (ref), p11 (ref), enumScreensModule (copy)
			if fFlagFriendsChatEnableConversationConsent then
				local var16 = getConversationConsentUpdateModule(p7)
				
				if var16 then
					local conversation = getConversationStoreModule(false).getConversation(p5, false)
					
					if conversation then
						getConversationStoreModule(false).upsertConversation(cryoModule.Dictionary.join(conversation, { [var16.field] = var16.value }), false)
					end
				end
			end
			var15.dismissOverlay()
			
			if p9 then
				p9(p5)
				
				return
			end
			p11.navigate(enumScreensModule.ChatConversation, { isNavigatedFromGroupOSAJoin = true, conversationId = p5 })
		end,
		onDecline = function()
			-- upvalues: p5 (ref), p8 (ref), conversationModule (copy), getConversationStoreModule (copy), p10 (ref), removedConversationModule (copy), var15 (ref)
			if p5 and p8 == conversationModule.Type.MULTI_USER_CONVERSATION then
				getConversationStoreModule(false).removeConversation(p5)
				p10(removedConversationModule(p5))
			end
			var15.dismissOverlay()
		end
	})
end

return function(p12)
	-- upvalues: reactModule (ref), useNavigation (ref), useDispatch (ref), getConversationStoreModule (ref), constantsModule (ref), httpService (ref), showOsaOverlay (ref), normalizeConversationForTelemetryModule (ref), fFlagAppChatSquadJoinButtonU13OSAModule (ref), conversationModule (ref)
	local conversationId = p12.conversationId
	local hasConversation = p12.hasConversation
	local shouldShowOSA = p12.shouldShowOSA
	local shouldShowU13ChatOptIn = p12.shouldShowU13ChatOptIn
	local conversationType = p12.conversationType
	local onActivated = p12.onActivated
	local onSquadJoinButtonActivated = p12.onSquadJoinButtonActivated
	local fireClickEvent = p12.fireClickEvent
	local telemetry = p12.telemetry
	local var18 = reactModule.useRef(telemetry)
	var18.current = telemetry
	local var19 = useNavigation()
	local var20 = useDispatch()
	local var21 = getConversationStoreModule(false)
	
	return {
		onActivated = reactModule.useCallback(function()
			-- upvalues: hasConversation (ref), var21 (ref), conversationId (ref), shouldShowU13ChatOptIn (ref), shouldShowOSA (ref), constantsModule (copy), httpService (copy), showOsaOverlay (copy), conversationType (ref), onActivated (ref), var20 (ref), var19 (ref), fireClickEvent (ref), normalizeConversationForTelemetryModule (copy), var18 (ref)
			if not hasConversation then return end
			local conversation = var21.getConversation(conversationId, false)
			
			if conversation == nil then return end
			local var23 = nil
			local var24 = if shouldShowU13ChatOptIn then constantsModule.OptInVariant.ChatOptInInfoCard elseif shouldShowOSA then constantsModule.OptInVariant.OsaContextCard else nil
			
			if var24 then
				var23 = httpService:GenerateGUID(false)
				showOsaOverlay(conversationId, var23, var24, conversationType, if onActivated then function(p13)
					-- upvalues: var21 (copy), onActivated (copy)
					local conversation = var21.getConversation(p13, false)
					
					if conversation then
						onActivated(conversation)
					end
				end else nil, var20, var19)
			elseif onActivated then
				onActivated(conversation)
			end
			if fireClickEvent then
				fireClickEvent(normalizeConversationForTelemetryModule(conversation), var18.current, var23)
			end
		end, {
			hasConversation, conversationId, conversationType, shouldShowOSA,
			shouldShowU13ChatOptIn, onActivated, fireClickEvent, var20, var19, var21
		}),
		onSquadActivated = reactModule.useCallback(function(p14)
			-- upvalues: hasConversation (ref), onSquadJoinButtonActivated (ref), shouldShowOSA (ref), shouldShowU13ChatOptIn (ref), conversationType (ref), constantsModule (copy), fFlagAppChatSquadJoinButtonU13OSAModule (copy), conversationModule (copy), httpService (copy), showOsaOverlay (copy), var20 (ref), var19 (ref)
			if hasConversation then
				local var26 = if shouldShowOSA then constantsModule.OptInVariant.OsaContextCard elseif fFlagAppChatSquadJoinButtonU13OSAModule and shouldShowU13ChatOptIn and conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then constantsModule.OptInVariant.ChatOptInInfoCard else nil
				
				if var26 then
					showOsaOverlay(p14, httpService:GenerateGUID(false), var26, conversationType, onSquadJoinButtonActivated, var20, var19)
					
					return
				elseif onSquadJoinButtonActivated then
					onSquadJoinButtonActivated(p14)
				end
				return
			elseif onSquadJoinButtonActivated then
				onSquadJoinButtonActivated(p14)
			end
		end, {
			hasConversation, conversationId, conversationType, shouldShowOSA,
			shouldShowU13ChatOptIn, onSquadJoinButtonActivated, var20, var19,
			var21.getConversation
		})
	}
end