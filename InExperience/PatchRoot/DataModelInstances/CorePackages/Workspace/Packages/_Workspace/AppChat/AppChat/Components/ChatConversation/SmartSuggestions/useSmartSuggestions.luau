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

local function _(p0, p1)
	-- upvalues: getDeepValueModule (ref)
	if p1 == nil then
		return nil
	end
	local var13 = getDeepValueModule(p0, `ChatAppReducer.Conversations.{p1}`)
	
	return if var13 == nil or var13.messages == nil then nil else var13.messages
end

local function getLatestUserMessageId(p2, p3)
	-- upvalues: getDeepValueModule (ref), orderedMap (ref), messageModelModule (ref)
	local var14
	if p3 == nil then
		var14 = nil
	else
		local var15 = getDeepValueModule(p2, `ChatAppReducer.Conversations.{p3}`)
		var14 = if var15 == nil or var15.messages == nil then nil else var15.messages
	end
	if var14 == nil or var14.keys == nil or var14.values == nil then
		return nil
	end
	for i = orderedMap.Length(var14), 1, -1 do
		local byIndex = orderedMap.GetByIndex(var14, i)
		
		if not byIndex or byIndex.senderType ~= messageModelModule.SenderTypes.User then
			continue
		end
		return byIndex.id
	end
	return nil
end

local _ = function(p4, p5, p6)
	-- upvalues: getDeepValueModule (ref), orderedMap (ref)
	local var17, var18
	if p5 == nil then
		var17 = nil
	else
		var18 = getDeepValueModule(p4, `ChatAppReducer.Conversations.{p5}`)
		var17 = if var18 == nil or var18.messages == nil then nil else var18.messages
	end
	var18 = var17 ~= nil and (var17.values ~= nil and orderedMap.Get(var17, p6) ~= nil)
	
	return var18
end

return function(p7, p8, p9)
	-- upvalues: useCanAccessPartyModule (ref), useStartPartySuggestionModule (ref), useStore (ref), reactModule (ref), getLatestUserMessageId (ref), useSelector (ref), createSmartSuggestionActionHandler (ref), cryoModule (ref), suggestionType (ref), fetchSmartSuggestionsModule (ref), constantsModule (ref), getDeepValueModule (ref), orderedMap (ref), useRealtimePlatformChatConversationModule (ref)
	local var19 = useStartPartySuggestionModule(p7, useCanAccessPartyModule())
	local canStartParty = var19.canStartParty
	local startParty = var19.startParty
	local var20 = useStore()
	local var21 = useSelector(reactModule.useCallback(function(p10)
		-- upvalues: getLatestUserMessageId (copy), p7 (ref)
		return getLatestUserMessageId(p10, p7)
	end, { p7 }))
	local var22 = reactModule.useMemo(function()
		-- upvalues: createSmartSuggestionActionHandler (copy), p8 (ref), p9 (ref), startParty (ref)
		return createSmartSuggestionActionHandler({
			sendMessage = p8,
			sendGameLinkChatMessage = p9,
			startParty = startParty
		})
	end, { p8, p9, startParty })
	local var23, var24 = reactModule.useState({})
	local var25, var26 = reactModule.useState(false)
	local var27 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var23 (ref), suggestionType (copy), canStartParty (ref)
		return cryoModule.List.filter(var23, function(p11)
			-- upvalues: suggestionType (copy), canStartParty (copy)
			return if p11.type == suggestionType.StartParty then canStartParty else true
		end)
	end, { var23, canStartParty })
	local var28 = reactModule.useRef({
		requestId = 0,
		pendingRealtimeNotification = nil,
		previousNewestUserMessageId = var21,
		newestMessageConversationId = p7
	})
	local var29 = reactModule.useCallback(function()
		-- upvalues: p7 (ref), var28 (ref), fetchSmartSuggestionsModule (copy), var24 (ref), var26 (ref)
		if p7 == nil then
			return
		end
		var28.current.requestId += 1
		local requestId = var28.current.requestId
		fetchSmartSuggestionsModule(p7):andThen(function(p12)
			-- upvalues: var28 (copy), requestId (ref), var24 (copy), var26 (copy)
			if var28.current.requestId == requestId then
				var24(p12)
				var26(false)
				
				return
			end
		end):catch(function() end)
	end, { p7 })
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var26 (ref), var29 (ref), var28 (ref)
		var24({})
		var26(false)
		var29()
		
		return function()
			-- upvalues: var28 (copy)
			var28.current.requestId += 1
			var28.current.pendingRealtimeNotification = nil
		end
	end, { p7, var29 })
	local var30 = reactModule.useCallback(function(p13)
		-- upvalues: constantsModule (copy), p7 (ref), var20 (ref), getLatestUserMessageId (copy), getDeepValueModule (copy), orderedMap (copy), var28 (ref), var29 (ref)
		if p13.Type ~= constantsModule.PlatformChatConversation.Types.ConversationSuggestionsGenerated then return end
		if p7 == nil or p13.ConversationId ~= p7 then return end
		local state = var20:getState()
		
		if p13.MessageId == getLatestUserMessageId(state, p7) then
			if var28.current.newestMessageConversationId == p7 and var28.current.previousNewestUserMessageId == p13.MessageId then
				var29()
				
				return
			end
			var28.current.pendingRealtimeNotification = { conversationId = p7, messageId = p13.MessageId }
			
			return
		else
			local var32
			local messageId = p13.MessageId
			
			if p7 == nil then
				var32 = nil
			else
				local var33 = getDeepValueModule(state, `ChatAppReducer.Conversations.{p7}`)
				var32 = if var33 == nil or var33.messages == nil then nil else var33.messages
			end
			if var32 ~= nil and (var32.values ~= nil and orderedMap.Get(var32, messageId) ~= nil) then
				return
			end
			var28.current.pendingRealtimeNotification = { conversationId = p7, messageId = p13.MessageId }
		end
	end, { p7, var20, var29 })
	useRealtimePlatformChatConversationModule(var30, { var30 })
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var21 (ref), p7 (ref), var24 (ref), var26 (ref), var29 (ref), var20 (ref), getDeepValueModule (copy), orderedMap (copy)
		local previousNewestUserMessageId = var28.current.previousNewestUserMessageId
		local newestMessageConversationId = var28.current.newestMessageConversationId
		var28.current.previousNewestUserMessageId = var21
		var28.current.newestMessageConversationId = p7
		
		if previousNewestUserMessageId == var21 then return end
		if newestMessageConversationId ~= p7 then return end
		var28.current.requestId += 1
		var24({})
		var26(false)
		local pendingRealtimeNotification = var28.current.pendingRealtimeNotification
		
		if pendingRealtimeNotification == nil or pendingRealtimeNotification.conversationId ~= p7 then return end
		if pendingRealtimeNotification.messageId == var21 then
			var28.current.pendingRealtimeNotification = nil
			var29()
			
			return
		end
		local var35
		local state = var20:getState()
		local messageId = pendingRealtimeNotification.messageId
		
		if p7 == nil then
			var35 = nil
		else
			local var36 = getDeepValueModule(state, `ChatAppReducer.Conversations.{p7}`)
			var35 = if var36 == nil or var36.messages == nil then nil else var36.messages
		end
		if var35 ~= nil and (var35.values ~= nil and orderedMap.Get(var35, messageId) ~= nil) then
			var28.current.pendingRealtimeNotification = nil
		end
	end, { var21, p7, var20, var29 })
	
	return {
		suggestions = var27,
		areSuggestionsDismissed = var25,
		onActivated = reactModule.useCallback(function(p14)
			-- upvalues: var26 (ref), var22 (ref), p7 (ref)
			var26(true)
			local var37 = var22(p14, p7)
			
			if typeof(var37) == "table" and typeof(var37.catch) == "function" then
				var37:catch(function()
					-- upvalues: var26 (copy)
					var26(false)
				end)
			end
		end, { var22, p7 })
	}
end