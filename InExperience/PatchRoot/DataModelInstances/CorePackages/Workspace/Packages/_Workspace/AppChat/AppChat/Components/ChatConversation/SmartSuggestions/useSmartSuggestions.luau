local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local orderedMap = require(parent.AppCommonLib).OrderedMap
local useCanAccessPartyModule = require(parent.Squads.useCanAccessParty)
local roactRodux = require(parent.RoactUtils).Hooks.RoactRodux
local useSelector = roactRodux.useSelector
local useStore = roactRodux.useStore
local constantsModule = require(appChat.Components.EventReceivers.Constants)
local _ = require(appChat.Components.EventReceivers.PlatformChatConversationTypes)
local useRealtimePlatformChatConversationModule = require(appChat.Components.EventReceivers.useRealtimePlatformChatConversation)
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local messageModelModule = require(appChat.Models.MessageModel)
local typesModule = require(script.Parent.Types)
local smartSuggestionActionHandlerModule = require(script.Parent.SmartSuggestionActionHandler)
local fetchSmartSuggestionsModule = require(script.Parent.fetchSmartSuggestions)
local useStartPartySuggestionModule = require(script.Parent.useStartPartySuggestion)
local createSmartSuggestionActionHandler = smartSuggestionActionHandlerModule.createSmartSuggestionActionHandler
local suggestionType = typesModule.SuggestionType

local function _(p1, p2)
	-- upvalues: getDeepValueModule (ref)
	if p2 == nil then
		return nil
	end
	local var1 = getDeepValueModule(p1, `ChatAppReducer.Conversations.{p2}`)
	
	return if var1 == nil or var1.messages == nil then nil else var1.messages
end

local function getLatestUserMessageId(p1, p2)
	-- upvalues: getDeepValueModule (ref), orderedMap (ref), messageModelModule (ref)
	local var1
	if p2 == nil then
		var1 = nil
	else
		local var2 = getDeepValueModule(p1, `ChatAppReducer.Conversations.{p2}`)
		var1 = if var2 == nil or var2.messages == nil then nil else var2.messages
	end
	if var1 == nil or var1.keys == nil or var1.values == nil then
		return nil
	end
	for i = orderedMap.Length(var1), 1, -1 do
		local byIndex = orderedMap.GetByIndex(var1, i)
		
		if not byIndex or byIndex.senderType ~= messageModelModule.SenderTypes.User then
			continue
		end
		return byIndex.id
	end
	return nil
end

local _ = function(p3, p4, p5)
	-- upvalues: getDeepValueModule (ref), orderedMap (ref)
	local var3, var4
	if p4 == nil then
		var3 = nil
	else
		var4 = getDeepValueModule(p3, `ChatAppReducer.Conversations.{p4}`)
		var3 = if var4 == nil or var4.messages == nil then nil else var4.messages
	end
	var4 = var3 ~= nil and (var3.values ~= nil and orderedMap.Get(var3, p5) ~= nil)
	
	return var4
end

return function(p3, p4, p5)
	-- upvalues: useCanAccessPartyModule (ref), useStartPartySuggestionModule (ref), useStore (ref), reactModule (ref), getLatestUserMessageId (ref), useSelector (ref), createSmartSuggestionActionHandler (ref), cryoModule (ref), suggestionType (ref), fetchSmartSuggestionsModule (ref), constantsModule (ref), getDeepValueModule (ref), orderedMap (ref), useRealtimePlatformChatConversationModule (ref)
	local var3 = useStartPartySuggestionModule(p3, useCanAccessPartyModule())
	local canStartParty = var3.canStartParty
	local startParty = var3.startParty
	local var4 = useStore()
	local var5 = useSelector(reactModule.useCallback(function(p6)
		-- upvalues: getLatestUserMessageId (copy), p3 (ref)
		return getLatestUserMessageId(p6, p3)
	end, { p3 }))
	local var6 = reactModule.useMemo(function()
		-- upvalues: createSmartSuggestionActionHandler (copy), p4 (ref), p5 (ref), startParty (ref)
		return createSmartSuggestionActionHandler({
			sendMessage = p4,
			sendGameLinkChatMessage = p5,
			startParty = startParty
		})
	end, { p4, p5, startParty })
	local var7, var8 = reactModule.useState({})
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var7 (ref), suggestionType (copy), canStartParty (ref)
		return cryoModule.List.filter(var7, function(p6)
			-- upvalues: suggestionType (copy), canStartParty (copy)
			return if p6.type == suggestionType.StartParty then canStartParty else true
		end)
	end, { var7, canStartParty })
	local var12 = reactModule.useRef({
		requestId = 0,
		pendingRealtimeNotification = nil,
		previousNewestUserMessageId = var5,
		newestMessageConversationId = p3
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), var12 (ref), fetchSmartSuggestionsModule (copy), var8 (ref), var10 (ref)
		if p3 == nil then
			return
		end
		var12.current.requestId += 1
		local requestId = var12.current.requestId
		fetchSmartSuggestionsModule(p3):andThen(function(p6)
			-- upvalues: var12 (copy), requestId (ref), var8 (copy), var10 (copy)
			if var12.current.requestId == requestId then
				var8(p6)
				var10(false)
				
				return
			end
		end):catch(function() end)
	end, { p3 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var10 (ref), var13 (ref), var12 (ref)
		var8({})
		var10(false)
		var13()
		
		return function()
			-- upvalues: var12 (copy)
			var12.current.requestId += 1
			var12.current.pendingRealtimeNotification = nil
		end
	end, { p3, var13 })
	local var14 = reactModule.useCallback(function(p6)
		-- upvalues: constantsModule (copy), p3 (ref), var4 (ref), getLatestUserMessageId (copy), getDeepValueModule (copy), orderedMap (copy), var12 (ref), var13 (ref)
		if p6.Type ~= constantsModule.PlatformChatConversation.Types.ConversationSuggestionsGenerated then return end
		if p3 == nil or p6.ConversationId ~= p3 then return end
		local state = var4:getState()
		
		if p6.MessageId == getLatestUserMessageId(state, p3) then
			if var12.current.newestMessageConversationId == p3 and var12.current.previousNewestUserMessageId == p6.MessageId then
				var13()
				
				return
			end
			var12.current.pendingRealtimeNotification = { conversationId = p3, messageId = p6.MessageId }
			
			return
		else
			local var15
			local messageId = p6.MessageId
			
			if p3 == nil then
				var15 = nil
			else
				local var16 = getDeepValueModule(state, `ChatAppReducer.Conversations.{p3}`)
				var15 = if var16 == nil or var16.messages == nil then nil else var16.messages
			end
			if var15 ~= nil and (var15.values ~= nil and orderedMap.Get(var15, messageId) ~= nil) then
				return
			end
			var12.current.pendingRealtimeNotification = { conversationId = p3, messageId = p6.MessageId }
		end
	end, { p3, var4, var13 })
	useRealtimePlatformChatConversationModule(var14, { var14 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var5 (ref), p3 (ref), var8 (ref), var10 (ref), var13 (ref), var4 (ref), getDeepValueModule (copy), orderedMap (copy)
		local previousNewestUserMessageId = var12.current.previousNewestUserMessageId
		local newestMessageConversationId = var12.current.newestMessageConversationId
		var12.current.previousNewestUserMessageId = var5
		var12.current.newestMessageConversationId = p3
		
		if previousNewestUserMessageId == var5 then return end
		if newestMessageConversationId ~= p3 then return end
		var12.current.requestId += 1
		var8({})
		var10(false)
		local pendingRealtimeNotification = var12.current.pendingRealtimeNotification
		
		if pendingRealtimeNotification == nil or pendingRealtimeNotification.conversationId ~= p3 then return end
		if pendingRealtimeNotification.messageId == var5 then
			var12.current.pendingRealtimeNotification = nil
			var13()
			
			return
		end
		local var15
		local state = var4:getState()
		local messageId = pendingRealtimeNotification.messageId
		
		if p3 == nil then
			var15 = nil
		else
			local var16 = getDeepValueModule(state, `ChatAppReducer.Conversations.{p3}`)
			var15 = if var16 == nil or var16.messages == nil then nil else var16.messages
		end
		if var15 ~= nil and (var15.values ~= nil and orderedMap.Get(var15, messageId) ~= nil) then
			var12.current.pendingRealtimeNotification = nil
		end
	end, { var5, p3, var4, var13 })
	
	return {
		suggestions = var11,
		areSuggestionsDismissed = var9,
		onActivated = reactModule.useCallback(function(p6)
			-- upvalues: var10 (ref), var6 (ref), p3 (ref)
			var10(true)
			local var15 = var6(p6, p3)
			
			if typeof(var15) == "table" and typeof(var15.catch) == "function" then
				var15:catch(function()
					-- upvalues: var10 (copy)
					var10(false)
				end)
			end
		end, { var6, p3 })
	}
end