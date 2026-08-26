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

return function(p1)
	-- upvalues: fFlagAppChatShowOSAOnPageEntry (ref), fetchLatestConversationDetailsModule (ref), shouldShowU13ChatOptInForConversationModule (ref), conversationModule (ref), constantsModule (ref), shouldShowOSAForConversationModule (ref), getOverlayStoreModule (ref), loggerModule (ref), overlayTypesModule (ref), httpService (ref), removedConversationModule (ref)
	local conversationId = p1.conversationId
	local dispatch = p1.dispatch
	local onAccepted = p1.onAccepted
	local onDeclined = p1.onDeclined
	
	if not fFlagAppChatShowOSAOnPageEntry then
		onAccepted()
		
		return
	elseif conversationId and conversationId ~= "" then
		dispatch(fetchLatestConversationDetailsModule(conversationId)):andThen(function()
			-- upvalues: dispatch (ref), conversationId (ref), shouldShowU13ChatOptInForConversationModule (copy), p1 (ref), conversationModule (copy), constantsModule (copy), shouldShowOSAForConversationModule (copy), onAccepted (ref), getOverlayStoreModule (copy), loggerModule (copy), overlayTypesModule (copy), httpService (copy), removedConversationModule (copy), onDeclined (ref)
			local var1 = nil
			dispatch(function(p2)
				-- upvalues: var1 (write), conversationId (copy)
				var1 = p2:getState().ChatAppReducer.Conversations[conversationId]
			end)
			local osaContextCard = nil
			local var2 = shouldShowU13ChatOptInForConversationModule(var1)
			
			if var2 and p1.requireMultiUserForU13 then
				var2 = var1 and var1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
			end
			if var2 then
				osaContextCard = constantsModule.OptInVariant.ChatOptInInfoCard
			elseif shouldShowOSAForConversationModule(var1) then
				osaContextCard = constantsModule.OptInVariant.OsaContextCard
			end
			if osaContextCard then
				local var3 = getOverlayStoreModule(false)
				loggerModule:debug("[OSA Gate] Showing overlay variant={} for conversation {}", osaContextCard, conversationId)
				var3.showOverlay(overlayTypesModule.GroupOSADialog, {
					conversationId = conversationId,
					impressionId = httpService:GenerateGUID(false),
					modalVariant = osaContextCard,
					onJoin = function()
						-- upvalues: var3 (ref), onAccepted (copy)
						var3.dismissOverlay()
						onAccepted()
					end,
					onDecline = function()
						-- upvalues: conversationId (copy), var1 (write), conversationModule (copy), dispatch (copy), removedConversationModule (copy), var3 (ref), onDeclined (copy)
						if conversationId and var1 and var1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
							dispatch(removedConversationModule(conversationId))
						end
						var3.dismissOverlay()
						
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
		end):catch(function(p2)
			-- upvalues: loggerModule (copy), conversationId (ref), p1 (ref)
			loggerModule:warning("[OSA Gate] Error fetching conversation details for {}: {}", conversationId, tostring(p2))
			
			if p1.onError then
				p1.onError(p2)
			end
		end)
		
		return
	end
	onAccepted()
end