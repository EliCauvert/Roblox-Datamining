local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local socialLibrariesModule = require(appChat.SocialLibraries)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useRef = reactModule.useRef
local appChatNetworkingModule = require(parent.AppChatNetworking)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local parseCreateConversationErrorsModule = require(appChat.Conversations.Thunks.parseCreateConversationErrors)
local expandToGroupConversationModule = require(appChat.Conversations.Thunks.expandToGroupConversation)
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local responseIndicator = socialLibrariesModule.Components.ResponseIndicator
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local selectChatMembersContainerModule = require(appChat.Components.SelectChatMembers.SelectChatMembersContainer)
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local t = {
	minSelections = 1,
	maxSelections = 5,
	maxConversationSize = 5,
	topBarHeight = nil,
	conversation = nil,
	systemButtonText = if getFFlagIsSquadEnabled() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends",
	pageHeaderText = if getFFlagIsSquadEnabled() then "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections",
	setSystemButtonActivated = function(_) end,
	setSystemButtonEnabled = function(_) end
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useState (ref), useAnalyticsModule (ref), useSelector (ref), useCallback (ref), useDispatch (ref), appChatNetworkingModule (ref), createConversationModule (ref), promiseModule (ref), parseCreateConversationErrorsModule (ref), conversationModule (ref), conversationChannelsModule (ref), expandToGroupConversationModule (ref), useEffect (ref), reactModule (ref), responseIndicator (ref), selectChatMembersContainerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useRef({})
	local var3 = useRef(false)
	local var4, var5 = useState(false)
	local var6 = useAnalyticsModule()
	local var7 = useSelector(useCallback(function(p2)
		return p2.LocalUserId
	end, {}))
	local var8 = useDispatch()
	local var9 = useCallback(function(p2, p3)
		-- upvalues: var8 (ref), appChatNetworkingModule (copy)
		return var8(appChatNetworkingModule.rodux.AddUserToConversation.API(p3, p2))
	end, { var8 })
	local var10 = useCallback(function(p2)
		-- upvalues: var8 (ref), createConversationModule (copy), var6 (ref)
		return var8(createConversationModule("group", p2, var6, "userAddedParticipantToOneToOne"))
	end, { var8 })
	local var11 = useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1.navigateToToast({ toastProps = { toastContent = { toastTitle = p2 } } })
	end, { var1.navigateToToast })
	
	local var12 = function(p2, p3)
		-- upvalues: var2 (ref), cryoModule (copy), var3 (ref), var1 (ref)
		var2.current = cryoModule.List.map(p2, function(p4)
			return p4.id
		end)
		local var13 = p3 <= #p2
		
		if var3.current ~= var13 then
			var3.current = var13
			var1.setSystemButtonEnabled(var13)
		end
	end
	
	local var13 = useCallback(function(p2)
		-- upvalues: var4 (ref), promiseModule (copy), var1 (ref), parseCreateConversationErrorsModule (copy), var11 (ref), var5 (ref), conversationModule (copy), var9 (ref), var2 (ref), conversationChannelsModule (copy), cryoModule (copy), var7 (ref), var8 (ref), expandToGroupConversationModule (copy), var6 (ref), var10 (ref)
		if var4 then
			return promiseModule.resolve()
		end
		local id = var1.conversation.id
		local conversationType = var1.conversation.conversationType
		
		local var14 = function(p3)
			-- upvalues: parseCreateConversationErrorsModule (copy), p2 (ref), var11 (copy), var5 (copy)
			var11(if parseCreateConversationErrorsModule(p3) == "participant_chat_disabled" then p2.invalidParticipantText else p2.networkErrorText)
			var5(false)
		end
		
		var5(true)
		
		if conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
			return var9(var2.current, id):andThen(function()
				-- upvalues: var1 (copy), id (ref)
				var1.navigateToConversation(id)
			end, var14)
		elseif conversationType ~= conversationModule.Type.ONE_TO_ONE_CONVERSATION then
			var11(if parseCreateConversationErrorsModule({
				Body = "conversationType not supported",
				StatusCode = 400
			}) == "participant_chat_disabled" then p2.invalidParticipantText else p2.networkErrorText)
			var5(false)
			
			return promiseModule.reject(string.format("conversationType not supported: %q", tostring(conversationType)))
		elseif var1.conversation.hasGroupUp and var1.conversation.moderationType == conversationChannelsModule.ModerationType.TrustedComms then
			var11(p2.cannotExpandToGroupChatActivePartyText)
			var5(false)
			
			return promiseModule.reject("Cannot expand to group chat while there is an active party if the chat has expanded chat features")
		end
		local var15 = cryoModule.List.filter(cryoModule.List.join(var2.current, var1.conversation.participants), function(p3)
			-- upvalues: var7 (copy)
			return p3 ~= var7
		end)
		
		return if var1.conversation.source == "channels" or var1.conversation.source == "chat" then var8(expandToGroupConversationModule(id, var15, var6)):andThen(function(p3)
			-- upvalues: var1 (copy)
			var1.navigateToConversation(p3.id)
		end, var14) else var10(var15):andThen(function(p3)
			-- upvalues: var1 (copy)
			var1.navigateToConversation(p3.id)
		end, var14)
	end, {
		var8, var4, var5, var2, var1.navigateToConversation,
		var1.conversation.id, var1.conversation.conversationType,
		var1.conversation.participants, var1.conversation.source, var11, var6
	})
	useEffect(function()
		-- upvalues: var1 (ref), var13 (ref)
		var1.setSystemButtonActivated(var13)
	end, { var1.setSystemButtonActivated, var13 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		responseIndicator = var4 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = reactModule.createElement(selectChatMembersContainerModule, cryoModule.Dictionary.join(var1, {
			maxSelections = var1.maxSelections - #var1.conversation.participants + 1,
			selectedUsersChanged = var12,
			localUserId = var7
		}))
	})
end)