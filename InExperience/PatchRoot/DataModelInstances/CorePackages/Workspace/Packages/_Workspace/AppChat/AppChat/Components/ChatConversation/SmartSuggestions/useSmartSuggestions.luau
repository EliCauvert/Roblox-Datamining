local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local OrderedMap = require(Parent.AppCommonLib).OrderedMap
local UseCanAccessPartyModule = require(Parent.Squads.useCanAccessParty)
local RoactRodux = require(Parent.RoactUtils).Hooks.RoactRodux
local UseSelectorFunction = RoactRodux.useSelector
local UseStoreFunction = RoactRodux.useStore
local ConstantsModule = require(AppChat.Components.EventReceivers.Constants)
local _ = require(AppChat.Components.EventReceivers.PlatformChatConversationTypes)
local UseRealtimePlatformChatConversationModule = require(AppChat.Components.EventReceivers.useRealtimePlatformChatConversation)
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local MessageModelModule = require(AppChat.Models.MessageModel)
local FetchSmartSuggestionsModule = require(script.Parent.fetchSmartSuggestions)
local UseStartPartySuggestionModule = require(script.Parent.useStartPartySuggestion)
local CreateSmartSuggestionActionHandlerFunction = require(script.Parent.SmartSuggestionActionHandler).createSmartSuggestionActionHandler
local SuggestionType = require(script.Parent.Types).SuggestionType

local function _(p1, p2) --[[ Line: 48 | Named "getConversationMessages" ]]
	-- upvalues: GetDeepValueModule (copy)
	if p2 == nil then
		return nil
	else
		local DeepValueModule = GetDeepValueModule(p1, `ChatAppReducer.Conversations.{p2}`)
		
		return if DeepValueModule == nil or DeepValueModule.messages == nil then nil else DeepValueModule.messages
	end
end

local function getLatestUserMessageId(State, ConversationId) --[[ Line: 61 ]]
	-- upvalues: GetDeepValueModule (copy), OrderedMap (copy), MessageModelModule (copy)
	local Messages = nil
	if ConversationId == nil then
		Messages = nil
	else
		local DeepValueModule = GetDeepValueModule(State, `ChatAppReducer.Conversations.{ConversationId}`)
		Messages = if DeepValueModule == nil or DeepValueModule.messages == nil then nil else DeepValueModule.messages
	end
	if Messages == nil or Messages.keys == nil or Messages.values == nil then
		return nil
	end
	local ByIndex = nil
	for i = OrderedMap.Length(Messages), 1, -1 do
		ByIndex = OrderedMap.GetByIndex(Messages, i)
		
		if ByIndex and ByIndex.senderType == MessageModelModule.SenderTypes.User then
			return ByIndex.id
		end
	end
	return nil
end

local _ = function(p1, p2, p3): boolean --[[ Line: 77 | Named "isMessageCommitted" ]]
	-- upvalues: GetDeepValueModule (copy), OrderedMap (copy)
	local Messages = nil
	if p2 == nil then
		Messages = nil
	else
		local DeepValueModule = GetDeepValueModule(p1, `ChatAppReducer.Conversations.{p2}`)
		Messages = if DeepValueModule == nil or DeepValueModule.messages == nil then nil else DeepValueModule.messages
	end
	return Messages ~= nil and (Messages.values ~= nil and OrderedMap.Get(Messages, p3) ~= nil)
end

return function(ConversationId, SendMessage, SendGameLinkChatMessage) --[[ Line: 82 | Named "useSmartSuggestions" ]]
	-- upvalues: UseCanAccessPartyModule (copy), UseStartPartySuggestionModule (copy), UseStoreFunction (copy), ReactModule (copy), getLatestUserMessageId (copy), UseSelectorFunction (copy), CreateSmartSuggestionActionHandlerFunction (copy), CryoModule (copy), SuggestionType (copy), FetchSmartSuggestionsModule (copy), ConstantsModule (copy), GetDeepValueModule (copy), OrderedMap (copy), UseRealtimePlatformChatConversationModule (copy)
	local UseStartPartySuggestionModuleResult = UseStartPartySuggestionModule(ConversationId, (UseCanAccessPartyModule()))
	local CanStartParty = UseStartPartySuggestionModuleResult.canStartParty
	local StartParty = UseStartPartySuggestionModuleResult.startParty
	local UseStoreResult = UseStoreFunction()
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p1) --[[ Line: 92 ]]
		-- upvalues: getLatestUserMessageId (upval), ConversationId (copy)
		return (getLatestUserMessageId(p1, ConversationId))
	end, { ConversationId })))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 96 ]]
		-- upvalues: CreateSmartSuggestionActionHandlerFunction (upval), SendMessage (copy), SendGameLinkChatMessage (copy), StartParty (copy)
		return CreateSmartSuggestionActionHandlerFunction({
			sendMessage = SendMessage,
			sendGameLinkChatMessage = SendGameLinkChatMessage,
			startParty = StartParty
		})
	end, { SendMessage, SendGameLinkChatMessage, StartParty })
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 106 ]]
		-- upvalues: CryoModule (upval), UseStateResult (copy), SuggestionType (upval), CanStartParty (copy)
		return CryoModule.List.filter(UseStateResult, function(p1) --[[ Line: 107 ]]
			-- upvalues: SuggestionType (upval), CanStartParty (upval)
			return p1.type ~= SuggestionType.StartParty or CanStartParty
		end)
	end, { UseStateResult, CanStartParty })
	local UseRefResult = ReactModule.useRef({
		requestId = 0,
		pendingRealtimeNotification = nil,
		previousNewestUserMessageId = UseSelectorResult,
		newestMessageConversationId = ConversationId
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 122 ]]
		-- upvalues: ConversationId (copy), UseRefResult (copy), FetchSmartSuggestionsModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if ConversationId ~= nil then
			local Current = UseRefResult.current
			Current.requestId += 1
			local RequestId = UseRefResult.current.requestId
			FetchSmartSuggestionsModule(ConversationId):andThen(function(Result) --[[ Line: 129 ]]
				-- upvalues: UseRefResult (upval), RequestId (copy), UseStateResult2 (upval), UseStateResult2_1 (upval)
				if UseRefResult.current.requestId == RequestId then
					UseStateResult2(Result)
					UseStateResult2_1(false)
					
					return
				end
			end):catch(function() --[[ Line: 136 ]] end)
			
			return
		end
	end, { ConversationId })
	ReactModule.useEffect(function() --[[ Line: 143 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseResult (copy), UseRefResult (copy)
		UseStateResult2({})
		UseStateResult2_1(false)
		UseResult()
		
		return function() --[[ Line: 147 ]]
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			Current.requestId += 1
			UseRefResult.current.pendingRealtimeNotification = nil
		end
	end, { ConversationId, UseResult })
	local UseResult1 = ReactModule.useCallback(function(p1) --[[ Line: 154 ]]
		-- upvalues: ConstantsModule (upval), ConversationId (copy), UseStoreResult (copy), getLatestUserMessageId (upval), GetDeepValueModule (upval), OrderedMap (upval), UseRefResult (copy), UseResult (copy)
		if p1.Type ~= ConstantsModule.PlatformChatConversation.Types.ConversationSuggestionsGenerated then return end
		if ConversationId == nil or p1.ConversationId ~= ConversationId then return end
		local State = UseStoreResult:getState()
		
		if p1.MessageId ~= getLatestUserMessageId(State, ConversationId) then
			local MessageId = p1.MessageId
			local Messages = nil
			
			if ConversationId == nil then
				Messages = nil
			else
				local DeepValueModule = GetDeepValueModule(State, `ChatAppReducer.Conversations.{ConversationId}`)
				Messages = if DeepValueModule == nil or DeepValueModule.messages == nil then nil else DeepValueModule.messages
			end
			if Messages == nil or (Messages.values == nil or OrderedMap.Get(Messages, MessageId) == nil) then
				UseRefResult.current.pendingRealtimeNotification = {
					conversationId = ConversationId,
					messageId = p1.MessageId
				}
				
				return
			end
			return
		elseif UseRefResult.current.newestMessageConversationId == ConversationId and UseRefResult.current.previousNewestUserMessageId == p1.MessageId then
			UseResult()
			
			return
		else
			UseRefResult.current.pendingRealtimeNotification = {
				conversationId = ConversationId,
				messageId = p1.MessageId
			}
		end
	end, { ConversationId, UseStoreResult, UseResult })
	UseRealtimePlatformChatConversationModule(UseResult1, { UseResult1 })
	ReactModule.useEffect(function() --[[ Line: 196 ]]
		-- upvalues: UseRefResult (copy), UseSelectorResult (copy), ConversationId (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseResult (copy), UseStoreResult (copy), GetDeepValueModule (upval), OrderedMap (upval)
		local NewestMessageConversationId = UseRefResult.current.newestMessageConversationId
		UseRefResult.current.previousNewestUserMessageId = UseSelectorResult
		UseRefResult.current.newestMessageConversationId = ConversationId
		
		if UseRefResult.current.previousNewestUserMessageId == UseSelectorResult then return end
		if NewestMessageConversationId ~= ConversationId then return end
		local Current = UseRefResult.current
		Current.requestId += 1
		UseStateResult2({})
		UseStateResult2_1(false)
		local PendingRealtimeNotification = UseRefResult.current.pendingRealtimeNotification
		
		if PendingRealtimeNotification == nil or PendingRealtimeNotification.conversationId ~= ConversationId then return end
		if PendingRealtimeNotification.messageId == UseSelectorResult then
			UseRefResult.current.pendingRealtimeNotification = nil
			UseResult()
			
			return
		end
		local State = UseStoreResult:getState()
		local MessageId = PendingRealtimeNotification.messageId
		local Messages = nil
		
		if ConversationId == nil then
			Messages = nil
		else
			local DeepValueModule = GetDeepValueModule(State, `ChatAppReducer.Conversations.{ConversationId}`)
			Messages = if DeepValueModule == nil or DeepValueModule.messages == nil then nil else DeepValueModule.messages
		end
		if Messages ~= nil and (Messages.values ~= nil and OrderedMap.Get(Messages, MessageId) ~= nil) then
			UseRefResult.current.pendingRealtimeNotification = nil
		end
	end, {
		UseSelectorResult,
		ConversationId,
		UseStoreResult,
		UseResult
	})
	
	return {
		suggestions = UseMemoResult1,
		areSuggestionsDismissed = UseStateResult1,
		onActivated = ReactModule.useCallback(function(p1) --[[ Line: 227 ]]
			-- upvalues: UseStateResult2_1 (copy), UseMemoResult (copy), ConversationId (copy)
			UseStateResult2_1(true)
			local UseMemoResultResult = UseMemoResult(p1, ConversationId)
			
			if typeof(UseMemoResultResult) == "table" and typeof(UseMemoResultResult.catch) == "function" then
				UseMemoResultResult:catch(function() --[[ Line: 232 ]]
					-- upvalues: UseStateResult2_1 (upval)
					UseStateResult2_1(false)
				end)
			end
		end, { UseMemoResult, ConversationId })
	}
end