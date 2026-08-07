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
local t = {}

local function _(p0, p1) --[[ line: 50 | named "getConversationMessages" ]]
	-- upvalues: getDeepValueModule (ref)
	if p1 == nil then
		return nil
	end
	local var14 = getDeepValueModule(p0, `ChatAppReducer.Conversations.{p1}`)
	
	return if var14 == nil or var14.messages == nil then nil else var14.messages
end

local function getLatestUserMessageId(p2, p3) --[[ line: 63 ]]
	-- upvalues: getDeepValueModule (ref), orderedMap (ref), messageModelModule (ref)
	local var15
	if p3 == nil then
		var15 = nil
	else
		local var16 = getDeepValueModule(p2, `ChatAppReducer.Conversations.{p3}`)
		var15 = if var16 == nil or var16.messages == nil then nil else var16.messages
	end
	if var15 == nil or var15.keys == nil or var15.values == nil then
		return nil
	end
	for i = orderedMap.Length(var15), 1, -1 do
		local byIndex = orderedMap.GetByIndex(var15, i)
		
		if not byIndex or byIndex.senderType ~= messageModelModule.SenderTypes.User then
			continue
		end
		return byIndex.id
	end
	return nil
end

local _ = function(p4, p5, p6) --[[ line: 79 | named "isMessageCommitted" ]]
	-- upvalues: getDeepValueModule (ref), orderedMap (ref)
	local var18, var19
	if p5 == nil then
		var18 = nil
	else
		var19 = getDeepValueModule(p4, `ChatAppReducer.Conversations.{p5}`)
		var18 = if var19 == nil or var19.messages == nil then nil else var19.messages
	end
	var19 = var18 ~= nil and (var18.values ~= nil and orderedMap.Get(var18, p6) ~= nil)
	
	return var19
end

return function(p7, p8, p9) --[[ line: 84 | named "useSmartSuggestions" ]]
	-- upvalues: useCanAccessPartyModule (ref), useStartPartySuggestionModule (ref), useStore (ref), reactModule (ref), getLatestUserMessageId (ref), useSelector (ref), createSmartSuggestionActionHandler (ref), t (ref), cryoModule (ref), suggestionType (ref), fetchSmartSuggestionsModule (ref), constantsModule (ref), getDeepValueModule (ref), orderedMap (ref), useRealtimePlatformChatConversationModule (ref)
	local var20 = useStartPartySuggestionModule(p7, useCanAccessPartyModule())
	local canStartParty = var20.canStartParty
	local startParty = var20.startParty
	local var21 = useStore()
	local var22 = useSelector(reactModule.useCallback(function(p10) --[[ line: 94 ]]
		-- upvalues: getLatestUserMessageId (copy), p7 (ref)
		return getLatestUserMessageId(p10, p7)
	end, { p7 }))
	local var23 = reactModule.useMemo(function() --[[ line: 98 ]]
		-- upvalues: createSmartSuggestionActionHandler (copy), p8 (ref), p9 (ref), startParty (ref)
		return createSmartSuggestionActionHandler({
			sendMessage = p8,
			sendGameLinkChatMessage = p9,
			startParty = startParty
		})
	end, { p8, p9, startParty })
	local var24, var25 = reactModule.useState({})
	local var26, var27 = reactModule.useState(t)
	local var28 = reactModule.useMemo(function() --[[ line: 108 ]]
		-- upvalues: cryoModule (copy), var24 (ref), suggestionType (copy), canStartParty (ref)
		return cryoModule.List.filter(var24, function(p11) --[[ line: 109 ]]
			-- upvalues: suggestionType (copy), canStartParty (copy)
			return if p11.type == suggestionType.StartParty then canStartParty else true
		end)
	end, { var24, canStartParty })
	local var29 = reactModule.useRef({
		requestId = 0,
		pendingRealtimeNotification = nil,
		previousNewestUserMessageId = var22,
		newestMessageConversationId = p7
	})
	local var30 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: p7 (ref), var29 (ref), fetchSmartSuggestionsModule (copy), var25 (ref), var27 (ref), t (copy)
		if p7 == nil then
			return
		end
		var29.current.requestId += 1
		local requestId = var29.current.requestId
		fetchSmartSuggestionsModule(p7):andThen(function(p12) --[[ line: 131 ]]
			-- upvalues: var29 (copy), requestId (ref), var25 (copy), var27 (copy), t (copy)
			if var29.current.requestId == requestId then
				var25(p12)
				var27(t)
				
				return
			end
		end):catch(function() --[[ line: 138 ]] end)
	end, { p7 })
	reactModule.useEffect(function() --[[ line: 145 ]]
		-- upvalues: var25 (ref), var27 (ref), t (copy), var30 (ref), var29 (ref)
		var25({})
		var27(t)
		var30()
		
		return function() --[[ line: 149 ]]
			-- upvalues: var29 (copy)
			var29.current.requestId += 1
			var29.current.pendingRealtimeNotification = nil
		end
	end, { p7, var30 })
	local var31 = reactModule.useCallback(function(p13) --[[ line: 156 ]]
		-- upvalues: constantsModule (copy), p7 (ref), var21 (ref), getLatestUserMessageId (copy), getDeepValueModule (copy), orderedMap (copy), var29 (ref), var30 (ref)
		if p13.Type ~= constantsModule.PlatformChatConversation.Types.ConversationSuggestionsGenerated then return end
		if p7 == nil or p13.ConversationId ~= p7 then return end
		local state = var21:getState()
		
		if p13.MessageId == getLatestUserMessageId(state, p7) then
			if var29.current.newestMessageConversationId == p7 and var29.current.previousNewestUserMessageId == p13.MessageId then
				var30()
				
				return
			end
			var29.current.pendingRealtimeNotification = { conversationId = p7, messageId = p13.MessageId }
			
			return
		else
			local var33
			local messageId = p13.MessageId
			
			if p7 == nil then
				var33 = nil
			else
				local var34 = getDeepValueModule(state, `ChatAppReducer.Conversations.{p7}`)
				var33 = if var34 == nil or var34.messages == nil then nil else var34.messages
			end
			if var33 ~= nil and (var33.values ~= nil and orderedMap.Get(var33, messageId) ~= nil) then
				return
			end
			var29.current.pendingRealtimeNotification = { conversationId = p7, messageId = p13.MessageId }
		end
	end, { p7, var21, var30 })
	useRealtimePlatformChatConversationModule(var31, { var31 })
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: var29 (ref), var22 (ref), p7 (ref), var25 (ref), var27 (ref), t (copy), var30 (ref), var21 (ref), getDeepValueModule (copy), orderedMap (copy)
		local previousNewestUserMessageId = var29.current.previousNewestUserMessageId
		local newestMessageConversationId = var29.current.newestMessageConversationId
		var29.current.previousNewestUserMessageId = var22
		var29.current.newestMessageConversationId = p7
		
		if previousNewestUserMessageId == var22 then return end
		if newestMessageConversationId ~= p7 then return end
		var29.current.requestId += 1
		var25({})
		var27(t)
		local pendingRealtimeNotification = var29.current.pendingRealtimeNotification
		
		if pendingRealtimeNotification == nil or pendingRealtimeNotification.conversationId ~= p7 then return end
		if pendingRealtimeNotification.messageId == var22 then
			var29.current.pendingRealtimeNotification = nil
			var30()
			
			return
		end
		local var36
		local state = var21:getState()
		local messageId = pendingRealtimeNotification.messageId
		
		if p7 == nil then
			var36 = nil
		else
			local var37 = getDeepValueModule(state, `ChatAppReducer.Conversations.{p7}`)
			var36 = if var37 == nil or var37.messages == nil then nil else var37.messages
		end
		if var36 ~= nil and (var36.values ~= nil and orderedMap.Get(var36, messageId) ~= nil) then
			var29.current.pendingRealtimeNotification = nil
		end
	end, { var22, p7, var21, var30 })
	
	return {
		suggestions = var28,
		hiddenSuggestions = var26,
		onActivated = reactModule.useCallback(function(p14) --[[ line: 229 ]]
			-- upvalues: var27 (ref), cryoModule (copy), var23 (ref), p7 (ref)
			var27(function(p15) --[[ line: 231 ]]
				-- upvalues: cryoModule (copy), p14 (ref)
				return cryoModule.Dictionary.join(p15, { [p14] = true })
			end)
			local var38 = var23(p14, p7)
			
			if typeof(var38) == "table" and typeof(var38.catch) == "function" then
				var38:catch(function() --[[ line: 238 ]]
					-- upvalues: var27 (copy), cryoModule (copy), p14 (ref)
					var27(function(p16) --[[ line: 239 ]]
						-- upvalues: cryoModule (copy), p14 (copy)
						return cryoModule.Dictionary.join(p16, { [p14] = cryoModule.None })
					end)
				end)
			end
		end, { var23, p7 })
	}
end