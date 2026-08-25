local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local sharedFlagsModule = require(appChat.Parent.SharedFlags)
local constantsModule = require(appChat.Constants)
local getOverlayStoreModule = require(appChat.Stores.GetOverlayStore)
local overlayTypesModule = require(appChat.Stores.GetOverlayStore.OverlayTypes)
local loggerModule = require(appChat.Logger)
local fetchLatestConversationDetailsModule = require(appChat.Conversations.Thunks.fetchLatestConversationDetails)
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local conversationModule = require(appChat.Models.Conversation)
local fFlagAppChatShowOSAOnPageEntry = sharedFlagsModule.FFlagAppChatShowOSAOnPageEntry

return function(p0)
	-- upvalues: fFlagAppChatShowOSAOnPageEntry (ref), fetchLatestConversationDetailsModule (ref), shouldShowU13ChatOptInForConversationModule (ref), conversationModule (ref), constantsModule (ref), shouldShowOSAForConversationModule (ref), getOverlayStoreModule (ref), loggerModule (ref), overlayTypesModule (ref), httpService (ref), removedConversationModule (ref)
	local conversationId = p0.conversationId
	local dispatch = p0.dispatch
	local onAccepted = p0.onAccepted
	local onDeclined = p0.onDeclined
	
	if not fFlagAppChatShowOSAOnPageEntry then
		onAccepted()
		
		return
	elseif conversationId and conversationId ~= "" then
		dispatch(fetchLatestConversationDetailsModule(conversationId)):andThen(function()
			-- upvalues: dispatch (ref), conversationId (ref), shouldShowU13ChatOptInForConversationModule (copy), p0 (ref), conversationModule (copy), constantsModule (copy), shouldShowOSAForConversationModule (copy), onAccepted (ref), getOverlayStoreModule (copy), loggerModule (copy), overlayTypesModule (copy), httpService (copy), removedConversationModule (copy), onDeclined (ref)
			local var12 = nil
			dispatch(function(p2)
				-- upvalues: var12 (write), conversationId (copy)
				var12 = p2:getState().ChatAppReducer.Conversations[conversationId]
			end)
			local osaContextCard = nil
			local var13 = shouldShowU13ChatOptInForConversationModule(var12)
			
			if var13 and p0.requireMultiUserForU13 then
				var13 = var12 and var12.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
			end
			if var13 then
				osaContextCard = constantsModule.OptInVariant.ChatOptInInfoCard
			elseif shouldShowOSAForConversationModule(var12) then
				osaContextCard = constantsModule.OptInVariant.OsaContextCard
			end
			if osaContextCard then
				local var14 = getOverlayStoreModule(false)
				loggerModule:debug("[OSA Gate] Showing overlay variant={} for conversation {}", osaContextCard, conversationId)
				var14.showOverlay(overlayTypesModule.GroupOSADialog, {
					conversationId = conversationId,
					impressionId = httpService:GenerateGUID(false),
					modalVariant = osaContextCard,
					onJoin = function()
						-- upvalues: var14 (ref), onAccepted (copy)
						var14.dismissOverlay()
						onAccepted()
					end,
					onDecline = function()
						-- upvalues: conversationId (copy), var12 (write), conversationModule (copy), dispatch (copy), removedConversationModule (copy), var14 (ref), onDeclined (copy)
						if conversationId and var12 and var12.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
							dispatch(removedConversationModule(conversationId))
						end
						var14.dismissOverlay()
						
						if onDeclined then
							onDeclined()
						end
					end,
					onClose = function()
						-- upvalues: onDeclined (copy)
						if onDeclined then
							onDeclined()
						end
					end
				})
				
				return
			end
			onAccepted()
		end):catch(function(p1)
			-- upvalues: loggerModule (copy), conversationId (ref), p0 (ref)
			loggerModule:warning("[OSA Gate] Error fetching conversation details for {}: {}", conversationId, tostring(p1))
			
			if p0.onError then
				p0.onError(p1)
			end
		end)
		
		return
	end
	onAccepted()
end