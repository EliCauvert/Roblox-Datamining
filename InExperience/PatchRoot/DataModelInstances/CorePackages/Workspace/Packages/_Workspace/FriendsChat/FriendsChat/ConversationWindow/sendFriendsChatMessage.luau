local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CreateConversationFromFriendPlaceholderModule = require(Parent.AppChat.createConversationFromFriendPlaceholder)
local GetConversationMessageStoreModule = require(Parent.AppChat.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local IngestNewerMessagesModule = require(Parent.AppChat.ingestNewerMessages)
local ChatConversationTelemetryEventsModule = require(Parent.AppChat.ChatConversationTelemetryEvents)
local SendMessageErrorModule = require(Parent.AppChat.SendMessageError)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local GetConversationMessageSentInfoModule = require(script.Parent.Parent.Telemetry.ChatConversation.getConversationMessageSentInfo)
local FFlagFriendsChatMessageSendPerfTrackingModule = require(FriendsChat.Flags.FFlagFriendsChatMessageSendPerfTracking)
local FriendsChatTabNameModule = require(FriendsChat.FriendsChatTabName)
local SerializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.Telemetry.App.serializeParticipantIdsForTelemetry)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)

local function isSendResponseAccepted(p1): boolean
	if p1 == nil or p1.responseBody == nil then
		return false
	elseif p1.responseCode ~= nil and p1.responseCode ~= 200 then
		return false
	elseif p1.StatusCode ~= nil and p1.StatusCode ~= 200 then
		return false
	else
		local Messages = p1.responseBody.messages
		
		if Messages == nil or #Messages == 0 then
			return false
		else
			local Status = Messages[1].status
			
			return Status == nil or (Status == "" or Status == "success")
		end
	end
end

return function(p1)
	-- upvalues: HttpService (copy), FFlagFriendsChatMessageSendPerfTrackingModule (copy), ExpChatPerfTracker (copy), FriendsChatTabNameModule (copy), Players (copy), ExpChatConversationListAdapterModule (copy), NewResult (copy), CreateConversationFromFriendPlaceholderModule (copy), GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), SerializeParticipantIdsForTelemetryModule (copy), AppChatNetworkingModule (copy), ChatConversationTelemetryEventsModule (copy), GetConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), SignalsExperimentalModule (copy), IngestNewerMessagesModule (copy), SendMessageErrorModule (copy)
	local Text = p1.text
	local ConversationId = p1.conversationId
	local IsFriendPlaceholder = p1.isFriendPlaceholder
	local HasRealConversation = p1.hasRealConversation
	local EmitFunction = p1.emit
	local Text1 = "sending-friends-message-" .. HttpService:GenerateGUID(false)
	local StartResult = if FFlagFriendsChatMessageSendPerfTrackingModule then ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = Text1 }, { tabName = FriendsChatTabNameModule }) else false
	task.spawn(function()
		-- upvalues: ConversationId (copy), Players (upval), IsFriendPlaceholder (copy), StartResult (ref), ExpChatPerfTracker (upval), Text1 (copy), ExpChatConversationListAdapterModule (upval), NewResult (upval), CreateConversationFromFriendPlaceholderModule (upval), p1 (copy), HasRealConversation (copy), GetConversationMessageStoreModule (upval), GetConversationMessageListStoreModule (upval), Text (copy), SerializeParticipantIdsForTelemetryModule (upval), AppChatNetworkingModule (upval), EmitFunction (copy), ChatConversationTelemetryEventsModule (upval), GetConversationMessageSentInfoModule (upval), isSendResponseAccepted (upval), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval), SendMessageErrorModule (upval)
		local ConversationId1 = ConversationId or ""
		local LocalPlayer = Players.LocalPlayer
		
		if IsFriendPlaceholder and ConversationId ~= nil then
			if StartResult then
				ExpChatPerfTracker.cancel(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = Text1 })
			end
			local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ConversationId, false)
			
			if Conversation == nil then
				NewResult:warning(`Unable to find friend placeholder {ConversationId}`)
				
				return
			end
			local ConversationFromFriendPlaceholderModule = CreateConversationFromFriendPlaceholderModule(Conversation, if LocalPlayer then LocalPlayer.UserId else 0)
			
			if ConversationFromFriendPlaceholderModule == nil then
				NewResult:warning(`Unable to create conversation for friend placeholder {ConversationId}`)
				
				return
			end
			local v1, v2 = ConversationFromFriendPlaceholderModule:await()
			
			if not v1 or v2 == nil then
				NewResult:warning(`Failed to create conversation for friend placeholder {ConversationId}`)
				
				return
			end
			ConversationId1 = v2.id
			
			if p1.onFriendPlaceholderConversationCreated ~= nil then
				p1.onFriendPlaceholderConversationCreated(ConversationId1)
			end
		elseif not HasRealConversation then
			if StartResult then
				ExpChatPerfTracker.cancel(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = Text1 })
			end
			return
		end
		local ConversationMessageStoreModule = GetConversationMessageStoreModule(false)
		local ConversationMessageListStoreModule = GetConversationMessageListStoreModule(false)
		ConversationMessageStoreModule.upsertMessages({
			[Text1] = {
				type = "user",
				status = "Pending",
				id = Text1,
				content = Text,
				created_at = tostring(os.time()),
				sender_user_id = if LocalPlayer then LocalPlayer.UserId else nil,
				conversationId = ConversationId1
			}
		})
		ConversationMessageListStoreModule.prependMessages(ConversationId1, { Text1 })
		local Repeated = string.rep("#", utf8.len(Text) or #Text)
		local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ConversationId1, false)
		local SerializeParticipantIdsForTelemetryModuleResult = SerializeParticipantIdsForTelemetryModule(if Conversation then Conversation.participants else nil, if LocalPlayer then LocalPlayer.UserId else 0)
		AppChatNetworkingModule.http.SendChatTextMessage(nil, ConversationId1, Text):andThen(function(Result)
			-- upvalues: EmitFunction (upval), ChatConversationTelemetryEventsModule (upval), GetConversationMessageSentInfoModule (upval), SerializeParticipantIdsForTelemetryModuleResult (copy), isSendResponseAccepted (upval), ConversationMessageStoreModule (copy), Text1 (upval), Repeated (copy), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval), ConversationId1 (ref), ExpChatConversationListAdapterModule (upval), LocalPlayer (copy), ConversationMessageListStoreModule (copy)
			EmitFunction(ChatConversationTelemetryEventsModule.ConversationMessageSent, GetConversationMessageSentInfoModule(Result, SerializeParticipantIdsForTelemetryModuleResult))
			
			if isSendResponseAccepted(Result) then
				local Messages = Result.responseBody.messages or {}
				SignalsExperimentalModule.batch(function()
					-- upvalues: IngestNewerMessagesModule (upval), ConversationId1 (upval), Messages (copy), ConversationMessageStoreModule (upval), Text1 (upval), Repeated (upval), ExpChatConversationListAdapterModule (upval), LocalPlayer (upval), ConversationMessageListStoreModule (upval)
					if #IngestNewerMessagesModule(ConversationId1, Messages) == 0 then
						ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
						
						return
					else
						ExpChatConversationListAdapterModule.updateConversationPreviewFromMessages(ConversationId1, Messages, {
							hasUnreadMessages = false,
							localUserId = if LocalPlayer then LocalPlayer.UserId else 0
						})
						ConversationMessageListStoreModule.removeMessage(ConversationId1, Text1)
						ConversationMessageStoreModule.removeMessage(Text1)
					end
				end)
				
				return
			else
				ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
			end
		end):catch(function(Err)
			-- upvalues: NewResult (upval), ConversationId1 (ref), EmitFunction (upval), ChatConversationTelemetryEventsModule (upval), SendMessageErrorModule (upval), SerializeParticipantIdsForTelemetryModuleResult (copy), ConversationMessageStoreModule (copy), Text1 (upval), Repeated (copy)
			NewResult:warning(`Failed to send message to {ConversationId1}: {tostring(Err)}`)
			EmitFunction(ChatConversationTelemetryEventsModule.ConversationMessageSent, {
				messageSentResult = SendMessageErrorModule.OtherFailure,
				recipientIds = SerializeParticipantIdsForTelemetryModuleResult
			})
			ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
		end)
	end)
end