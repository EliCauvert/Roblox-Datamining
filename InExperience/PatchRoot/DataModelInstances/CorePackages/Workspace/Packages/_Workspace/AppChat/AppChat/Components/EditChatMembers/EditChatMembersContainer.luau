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

return memo(function(p0)
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useState (ref), useAnalyticsModule (ref), useSelector (ref), useCallback (ref), useDispatch (ref), appChatNetworkingModule (ref), createConversationModule (ref), promiseModule (ref), parseCreateConversationErrorsModule (ref), conversationModule (ref), conversationChannelsModule (ref), expandToGroupConversationModule (ref), useEffect (ref), reactModule (ref), responseIndicator (ref), selectChatMembersContainerModule (ref)
	local var14 = cryoModule.Dictionary.join(t, p0)
	local var15 = useRef({})
	local var16 = useRef(false)
	local var17, var18 = useState(false)
	local var19 = useAnalyticsModule()
	local var20 = useSelector(useCallback(function(p1)
		return p1.LocalUserId
	end, {}))
	local var21 = useDispatch()
	local var22 = useCallback(function(p2, p3)
		-- upvalues: var21 (ref), appChatNetworkingModule (copy)
		return var21(appChatNetworkingModule.rodux.AddUserToConversation.API(p3, p2))
	end, { var21 })
	local var23 = useCallback(function(p4)
		-- upvalues: var21 (ref), createConversationModule (copy), var19 (ref)
		return var21(createConversationModule("group", p4, var19, "userAddedParticipantToOneToOne"))
	end, { var21 })
	local var24 = useCallback(function(p5)
		-- upvalues: var14 (ref)
		var14.navigateToToast({ toastProps = { toastContent = { toastTitle = p5 } } })
	end, { var14.navigateToToast })
	
	local var25 = function(p6, p7)
		-- upvalues: var15 (ref), cryoModule (copy), var16 (ref), var14 (ref)
		var15.current = cryoModule.List.map(p6, function(p8)
			return p8.id
		end)
		local var27 = p7 <= #p6
		
		if var16.current ~= var27 then
			var16.current = var27
			var14.setSystemButtonEnabled(var27)
		end
	end
	
	local var26 = useCallback(function(p9)
		-- upvalues: var17 (ref), promiseModule (copy), var14 (ref), parseCreateConversationErrorsModule (copy), var24 (ref), var18 (ref), conversationModule (copy), var22 (ref), var15 (ref), conversationChannelsModule (copy), cryoModule (copy), var20 (ref), var21 (ref), expandToGroupConversationModule (copy), var19 (ref), var23 (ref)
		if var17 then
			return promiseModule.resolve()
		end
		local id = var14.conversation.id
		local conversationType = var14.conversation.conversationType
		
		local var28 = function(p10)
			-- upvalues: parseCreateConversationErrorsModule (copy), p9 (ref), var24 (copy), var18 (copy)
			var24(if parseCreateConversationErrorsModule(p10) == "participant_chat_disabled" then p9.invalidParticipantText else p9.networkErrorText)
			var18(false)
		end
		
		var18(true)
		
		if conversationType == conversationModule.Type.MULTI_USER_CONVERSATION then
			return var22(var15.current, id):andThen(function()
				-- upvalues: var14 (copy), id (ref)
				var14.navigateToConversation(id)
			end, var28)
		elseif conversationType ~= conversationModule.Type.ONE_TO_ONE_CONVERSATION then
			var24(if parseCreateConversationErrorsModule({
				Body = "conversationType not supported",
				StatusCode = 400
			}) == "participant_chat_disabled" then p9.invalidParticipantText else p9.networkErrorText)
			var18(false)
			
			return promiseModule.reject(string.format("conversationType not supported: %q", tostring(conversationType)))
		elseif var14.conversation.hasGroupUp and var14.conversation.moderationType == conversationChannelsModule.ModerationType.TrustedComms then
			var24(p9.cannotExpandToGroupChatActivePartyText)
			var18(false)
			
			return promiseModule.reject("Cannot expand to group chat while there is an active party if the chat has expanded chat features")
		end
		local var29 = cryoModule.List.filter(cryoModule.List.join(var15.current, var14.conversation.participants), function(p11)
			-- upvalues: var20 (copy)
			return p11 ~= var20
		end)
		
		return if var14.conversation.source == "channels" or var14.conversation.source == "chat" then var21(expandToGroupConversationModule(id, var29, var19)):andThen(function(p13)
			-- upvalues: var14 (copy)
			var14.navigateToConversation(p13.id)
		end, var28) else var23(var29):andThen(function(p12)
			-- upvalues: var14 (copy)
			var14.navigateToConversation(p12.id)
		end, var28)
	end, {
		var21, var17, var18, var15, var14.navigateToConversation,
		var14.conversation.id, var14.conversation.conversationType,
		var14.conversation.participants, var14.conversation.source, var24, var19
	})
	useEffect(function()
		-- upvalues: var14 (ref), var26 (ref)
		var14.setSystemButtonActivated(var26)
	end, { var14.setSystemButtonActivated, var26 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		responseIndicator = var17 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = reactModule.createElement(selectChatMembersContainerModule, cryoModule.Dictionary.join(var14, {
			maxSelections = var14.maxSelections - #var14.conversation.participants + 1,
			selectedUsersChanged = var25,
			localUserId = var20
		}))
	})
end)