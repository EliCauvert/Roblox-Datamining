local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local ConstantsModule = require(AppChat.Constants)
local GetOverlayStoreModule = require(AppChat.Stores.GetOverlayStore)
local OverlayTypesModule = require(AppChat.Stores.GetOverlayStore.OverlayTypes)
local LoggerModule = require(AppChat.Logger)
local FetchLatestConversationDetailsModule = require(AppChat.Conversations.Thunks.fetchLatestConversationDetails)
local ShouldShowOSAForConversationModule = require(AppChat.Utils.shouldShowOSAForConversation)
local ShouldShowU13ChatOptInForConversationModule = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local ConversationModule = require(AppChat.Models.Conversation)
local FFlagAppChatShowOSAOnPageEntry = require(AppChat.Parent.SharedFlags).FFlagAppChatShowOSAOnPageEntry

return function(p1)
	-- upvalues: FFlagAppChatShowOSAOnPageEntry (copy), FetchLatestConversationDetailsModule (copy), ShouldShowU13ChatOptInForConversationModule (copy), ConversationModule (copy), ConstantsModule (copy), ShouldShowOSAForConversationModule (copy), GetOverlayStoreModule (copy), LoggerModule (copy), OverlayTypesModule (copy), HttpService (copy), RemovedConversationModule (copy)
	local ConversationId = p1.conversationId
	local DispatchFunction = p1.dispatch
	local OnAcceptedFunction: () -> () = p1.onAccepted
	local OnDeclinedFunction = p1.onDeclined
	
	if not FFlagAppChatShowOSAOnPageEntry then
		OnAcceptedFunction()
		
		return
	end
	if ConversationId and ConversationId ~= "" then
		DispatchFunction(FetchLatestConversationDetailsModule(ConversationId)):andThen(function()
			-- upvalues: DispatchFunction (copy), ConversationId (copy), ShouldShowU13ChatOptInForConversationModule (upval), p1 (copy), ConversationModule (upval), ConstantsModule (upval), ShouldShowOSAForConversationModule (upval), OnAcceptedFunction (copy), GetOverlayStoreModule (upval), LoggerModule (upval), OverlayTypesModule (upval), HttpService (upval), RemovedConversationModule (upval), OnDeclinedFunction (copy)
			local Conversation = nil
			DispatchFunction(function(p2)
				-- upvalues: Conversation (ref), ConversationId (upval)
				Conversation = p2:getState().ChatAppReducer.Conversations[ConversationId]
			end)
			local ChatOptInInfoCard = nil
			local ShouldShowU13ChatOptInForConversationModule1 = ShouldShowU13ChatOptInForConversationModule(Conversation)
			
			if ShouldShowU13ChatOptInForConversationModule1 and p1.requireMultiUserForU13 then
				ShouldShowU13ChatOptInForConversationModule1 = Conversation and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
			end
			if ShouldShowU13ChatOptInForConversationModule1 then
				ChatOptInInfoCard = ConstantsModule.OptInVariant.ChatOptInInfoCard
			elseif ShouldShowOSAForConversationModule(Conversation) then
				ChatOptInInfoCard = ConstantsModule.OptInVariant.OsaContextCard
			end
			if ChatOptInInfoCard then
				local OverlayStoreModule = GetOverlayStoreModule(false)
				LoggerModule:debug("[OSA Gate] Showing overlay variant={} for conversation {}", ChatOptInInfoCard, ConversationId)
				OverlayStoreModule.showOverlay(OverlayTypesModule.GroupOSADialog, {
					conversationId = ConversationId,
					impressionId = HttpService:GenerateGUID(false),
					modalVariant = ChatOptInInfoCard,
					onJoin = function()
						-- upvalues: OverlayStoreModule (copy), OnAcceptedFunction (upval)
						OverlayStoreModule.dismissOverlay()
						OnAcceptedFunction()
					end,
					onDecline = function()
						-- upvalues: ConversationId (upval), Conversation (ref), ConversationModule (upval), DispatchFunction (upval), RemovedConversationModule (upval), OverlayStoreModule (copy), OnDeclinedFunction (upval)
						if ConversationId and Conversation and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
							DispatchFunction(RemovedConversationModule(ConversationId))
						end
						OverlayStoreModule.dismissOverlay()
						
						if OnDeclinedFunction then
							OnDeclinedFunction()
						end
					end,
					onClose = function()
						-- upvalues: OnDeclinedFunction (upval)
						if OnDeclinedFunction then
							OnDeclinedFunction()
						end
					end
				})
				
				return
			else
				OnAcceptedFunction()
			end
		end):catch(function(Err)
			-- upvalues: LoggerModule (upval), ConversationId (copy), p1 (copy)
			LoggerModule:warning("[OSA Gate] Error fetching conversation details for {}: {}", ConversationId, (tostring(Err)))
			
			if p1.onError then
				p1.onError(Err)
			end
		end)
		
		return
	else
		OnAcceptedFunction()
	end
end