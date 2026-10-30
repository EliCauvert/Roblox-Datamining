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
local ReceivedConversationModule = require(AppChat.Conversations.Actions.ReceivedConversation)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationRoduxSeedModule = require(AppChat.Utils.ConversationRoduxSeed)
local IsFriendsPlaceholderConversationFunction = ConversationRoduxSeedModule.isFriendsPlaceholderConversation
local FFlagAppChatShowOSAOnPageEntry = require(AppChat.Parent.SharedFlags).FFlagAppChatShowOSAOnPageEntry

local function evaluateAndShowGate(p1, p2)
	-- upvalues: ShouldShowU13ChatOptInForConversationModule (copy), ConversationModule (copy), ConstantsModule (copy), ShouldShowOSAForConversationModule (copy), GetOverlayStoreModule (copy), LoggerModule (copy), OverlayTypesModule (copy), HttpService (copy), RemovedConversationModule (copy)
	local ConversationId = p1.conversationId
	local DispatchFunction = p1.dispatch
	local OnAcceptedFunction: () -> () = p1.onAccepted
	local OnDeclinedFunction = p1.onDeclined
	local ChatOptInInfoCard = nil
	local ShouldShowU13ChatOptInForConversationModule1 = ShouldShowU13ChatOptInForConversationModule(p2)
	
	if ShouldShowU13ChatOptInForConversationModule1 and p1.requireMultiUserForU13 then
		ShouldShowU13ChatOptInForConversationModule1 = p2 and p2.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
	end
	if ShouldShowU13ChatOptInForConversationModule1 then
		ChatOptInInfoCard = ConstantsModule.OptInVariant.ChatOptInInfoCard
	elseif ShouldShowOSAForConversationModule(p2) then
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
				-- upvalues: OverlayStoreModule (copy), OnAcceptedFunction (copy)
				OverlayStoreModule.dismissOverlay()
				OnAcceptedFunction()
			end,
			onDecline = function()
				-- upvalues: ConversationId (copy), p2 (copy), ConversationModule (upval), DispatchFunction (copy), RemovedConversationModule (upval), OverlayStoreModule (copy), OnDeclinedFunction (copy)
				if ConversationId and p2 and p2.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
					DispatchFunction(RemovedConversationModule(ConversationId))
				end
				OverlayStoreModule.dismissOverlay()
				
				if OnDeclinedFunction then
					OnDeclinedFunction()
				end
			end,
			onClose = function()
				-- upvalues: OnDeclinedFunction (copy)
				if OnDeclinedFunction then
					OnDeclinedFunction()
				end
			end
		})
		
		return
	else
		OnAcceptedFunction()
	end
end

local function _(Callback: (any) -> (), p1)
	local Conversation = nil
	Callback(function(p2)
		-- upvalues: Conversation (ref), p1 (copy)
		Conversation = p2:getState().ChatAppReducer.Conversations[p1]
	end)
	
	return Conversation
end

local _ = function(Callback: (any) -> (), p1)
	-- upvalues: GetConversationStoreModule (copy), ConversationRoduxSeedModule (copy), ReceivedConversationModule (copy)
	local Conversation = GetConversationStoreModule(false).getConversation(p1, false)
	
	if Conversation == nil then
		return nil
	else
		local NormalizeStoreConversationForRoduxResult = ConversationRoduxSeedModule.normalizeStoreConversationForRodux(Conversation)
		Callback(ReceivedConversationModule(NormalizeStoreConversationForRoduxResult))
		
		return NormalizeStoreConversationForRoduxResult
	end
end

return function(p1)
	-- upvalues: FFlagAppChatShowOSAOnPageEntry (copy), GetConversationStoreModule (copy), ConversationRoduxSeedModule (copy), ReceivedConversationModule (copy), IsFriendsPlaceholderConversationFunction (copy), evaluateAndShowGate (copy), FetchLatestConversationDetailsModule (copy), LoggerModule (copy)
	local ConversationId = p1.conversationId
	local DispatchFunction = p1.dispatch
	local OnAcceptedFunction: () -> () = p1.onAccepted
	
	if not FFlagAppChatShowOSAOnPageEntry then
		OnAcceptedFunction()
		
		return
	end
	if not ConversationId or ConversationId == "" then
		OnAcceptedFunction()
		
		return
	end
	local Conversation = nil
	DispatchFunction(function(p2)
		-- upvalues: Conversation (ref), ConversationId (copy)
		Conversation = p2:getState().ChatAppReducer.Conversations[ConversationId]
	end)
	local Conversation1 = Conversation
	
	if Conversation1 == nil then
		local Conversation2 = GetConversationStoreModule(false).getConversation(ConversationId, false)
		
		if Conversation2 == nil then
			Conversation1 = nil
		else
			local NormalizeStoreConversationForRoduxResult = ConversationRoduxSeedModule.normalizeStoreConversationForRodux(Conversation2)
			DispatchFunction(ReceivedConversationModule(NormalizeStoreConversationForRoduxResult))
			Conversation1 = NormalizeStoreConversationForRoduxResult
		end
	end
	if IsFriendsPlaceholderConversationFunction(ConversationId, Conversation1) then
		evaluateAndShowGate(p1, Conversation1)
		
		return
	else
		DispatchFunction(FetchLatestConversationDetailsModule(ConversationId)):andThen(function()
			-- upvalues: evaluateAndShowGate (upval), p1 (copy), DispatchFunction (copy), ConversationId (copy)
			local Conversation = nil
			DispatchFunction(function(p2)
				-- upvalues: Conversation (ref), ConversationId (copy)
				Conversation = p2:getState().ChatAppReducer.Conversations[ConversationId]
			end)
			evaluateAndShowGate(p1, Conversation)
		end):catch(function(Err)
			-- upvalues: LoggerModule (upval), ConversationId (copy), p1 (copy)
			LoggerModule:warning("[OSA Gate] Error fetching conversation details for {}: {}", ConversationId, (tostring(Err)))
			
			if p1.onError then
				p1.onError(Err)
			end
		end)
	end
end