local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local responseIndicator = require(appChat.SocialLibraries).Components.ResponseIndicator
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local promiseModule = require(parent.Promise)
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useIsGroupChatEnabledModule = require(appChat.Hooks.useIsGroupChatEnabled)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local useState = reactModule.useState
local useRef = reactModule.useRef
local appNavBarModule = require(parent.AppNavBar)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local conversationModule = require(appChat.Models.Conversation)
local _ = require(appChat.Models.ConversationChannels)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local parseCreateConversationErrorsModule = require(appChat.Conversations.Thunks.parseCreateConversationErrors)
local selectChatMembersContainerModule = require(appChat.Components.SelectChatMembers.SelectChatMembersContainer)
local eventNamesModule = require(appChat.Analytics.EventNames)
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local createConversationErrorModule = require(appChat.Analytics.Enums.CreateConversationError)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagAppIaScrollAwayFixSocial = sharedFlagsModule.FFlagAppIaScrollAwayFixSocial
local getFFlagIsSquadEnabled = sharedFlagsModule.GetFFlagIsSquadEnabled
local t = {
	topBarHeight = nil,
	minSelections = 1,
	maxSelections = 5,
	maxConversationSize = 5,
	systemButtonText = if getFFlagIsSquadEnabled() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends",
	pageHeaderText = if getFFlagIsSquadEnabled() then if require(parent.SocialExperiments).ArgoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then if sharedFlagsModule.FFlagAppChatNewChatFixEnabled then "Feature.Chat.Title.NewChat" else "Feature.Chat.Heading.ChatWithFriends" else "Feature.Chat.Heading.PartyWithFriends" elseif sharedFlagsModule.FFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections",
	conversation = conversationModule.empty(),
	setSystemButtonActivated = function(_) --[[ line: 87 ]] end,
	setSystemButtonEnabled = function(_) --[[ line: 88 ]] end
}

function CreateNewChatContainer(p0) --[[ line: 92 ]]
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useState (ref), fFlagAppIaScrollAway (ref), fFlagAppIaScrollAwayFixSocial (ref), useIsInExperienceModule (ref), useIsGroupChatEnabledModule (ref), useDispatch (ref), useCallback (ref), useAnalyticsModule (ref), promiseModule (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), eventNamesModule (ref), createConversationErrorModule (ref), useEffect (ref), reactModule (ref), appNavBarModule (ref), responseIndicator (ref), selectChatMembersContainerModule (ref)
	local var17 = cryoModule.Dictionary.join(t, p0)
	local var18 = useRef({})
	local var19 = useRef(false)
	local var20, var21 = useState(false)
	local var22 = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial then useIsInExperienceModule() else nil
	local maxSelections = var17.maxSelections
	local maxConversationSize = var17.maxConversationSize
	local var23 = false
	
	if not useIsGroupChatEnabledModule() then
		maxSelections = 1
		maxConversationSize = 1
		var23 = true
	end
	local var24 = useDispatch()
	local var25 = useCallback(function(p1) --[[ line: 113 ]]
		-- upvalues: var17 (ref)
		var17.navigateToToast({ toastProps = { toastContent = { toastTitle = p1 } } })
	end, { var17.navigateToToast })
	
	local var26 = function(p2, p3) --[[ line: 123 ]]
		-- upvalues: var18 (ref), cryoModule (copy), var19 (ref), var17 (ref)
		var18.current = cryoModule.List.map(p2, function(p4) --[[ line: 124 ]]
			return p4.id
		end)
		local var29 = p3 <= #p2
		
		if var19.current ~= var29 then
			var19.current = var29
			var17.setSystemButtonEnabled(var29)
		end
	end
	
	local var27 = useAnalyticsModule()
	local var28 = useCallback(function(p5) --[[ line: 137 ]]
		-- upvalues: var20 (ref), var18 (ref), promiseModule (copy), var21 (ref), var24 (ref), createConversationModule (copy), var27 (ref), var17 (ref), parseCreateConversationErrorsModule (copy), var25 (ref), eventNamesModule (copy), createConversationErrorModule (copy)
		if var20 or not var18.current then
			return promiseModule.resolve()
		end
		var21(true)
		
		return var24(createConversationModule(if #var18.current == 1 then "one_to_one" else "group", var18.current, var27, "userCreatedNewConversation")):andThen(function(p7) --[[ line: 158 ]]
			-- upvalues: var17 (copy)
			var17.navigateToConversation(p7.id)
		end):catch(function(p6) --[[ line: 162 ]]
			-- upvalues: parseCreateConversationErrorsModule (copy), p5 (ref), var25 (copy), var21 (copy), var27 (copy), eventNamesModule (copy), createConversationErrorModule (copy)
			var25(if parseCreateConversationErrorsModule(p6) == "participant_chat_disabled" then p5.invalidParticipantText else p5.networkErrorText)
			var21(false)
			
			if var27 then
				var27.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
					createConversationResult = createConversationErrorModule.FetchConversationError
				})
			end
		end)
	end, {
		var24, var20, var21, var18, var17.navigateToConversation, var25, var27
	})
	useEffect(function() --[[ line: 192 ]]
		-- upvalues: var17 (ref), var28 (ref)
		var17.setSystemButtonActivated(var28)
	end, { var17.setSystemButtonActivated, var28 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIPadding = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial and (not var22 and appNavBarModule.getScrollAwayEnabled()) and var17.topBarHeight ~= nil then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var17.topBarHeight) }) else nil,
		responseIndicator = var20 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = reactModule.createElement(selectChatMembersContainerModule, cryoModule.Dictionary.join(var17, {
			selectedUsersChanged = var26,
			maxSelections = maxSelections,
			maxConversationSize = maxConversationSize,
			canOnlyCreateOneToOneChat = var23
		}))
	})
end

return memo(CreateNewChatContainer)