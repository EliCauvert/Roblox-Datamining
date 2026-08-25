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
local fFlagFixPaginatedChatMembersCutoffModule = require(appChat.Flags.FFlagFixPaginatedChatMembersCutoff)
local t = {
	topBarHeight = nil,
	minSelections = 1,
	maxSelections = 5,
	maxConversationSize = 5,
	systemButtonText = if getFFlagIsSquadEnabled() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends",
	pageHeaderText = if getFFlagIsSquadEnabled() then if require(parent.SocialExperiments).ArgoPartyExperimentation.getIsRenameEnabled() then if universalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then if sharedFlagsModule.FFlagAppChatNewChatFixEnabled then "Feature.Chat.Title.NewChat" else "Feature.Chat.Heading.ChatWithFriends" else "Feature.Chat.Heading.PartyWithFriends" elseif sharedFlagsModule.FFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections",
	conversation = conversationModule.empty(),
	setSystemButtonActivated = function(_) end,
	setSystemButtonEnabled = function(_) end
}

function CreateNewChatContainer(p0)
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useState (ref), fFlagAppIaScrollAway (ref), fFlagAppIaScrollAwayFixSocial (ref), useIsInExperienceModule (ref), useIsGroupChatEnabledModule (ref), useDispatch (ref), useCallback (ref), useAnalyticsModule (ref), promiseModule (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), eventNamesModule (ref), createConversationErrorModule (ref), useEffect (ref), reactModule (ref), fFlagFixPaginatedChatMembersCutoffModule (ref), appNavBarModule (ref), responseIndicator (ref), selectChatMembersContainerModule (ref)
	local var18 = cryoModule.Dictionary.join(t, p0)
	local var19 = useRef({})
	local var20 = useRef(false)
	local var21, var22 = useState(false)
	local var23 = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial then useIsInExperienceModule() else nil
	local maxSelections = var18.maxSelections
	local maxConversationSize = var18.maxConversationSize
	local var24 = false
	
	if not useIsGroupChatEnabledModule() then
		maxSelections = 1
		maxConversationSize = 1
		var24 = true
	end
	local var25 = useDispatch()
	local var26 = useCallback(function(p1)
		-- upvalues: var18 (ref)
		var18.navigateToToast({ toastProps = { toastContent = { toastTitle = p1 } } })
	end, { var18.navigateToToast })
	
	local var27 = function(p2, p3)
		-- upvalues: var19 (ref), cryoModule (copy), var20 (ref), var18 (ref)
		var19.current = cryoModule.List.map(p2, function(p4)
			return p4.id
		end)
		local var30 = p3 <= #p2
		
		if var20.current ~= var30 then
			var20.current = var30
			var18.setSystemButtonEnabled(var30)
		end
	end
	
	local var28 = useAnalyticsModule()
	local var29 = useCallback(function(p5)
		-- upvalues: var21 (ref), var19 (ref), promiseModule (copy), var22 (ref), var25 (ref), createConversationModule (copy), var28 (ref), var18 (ref), parseCreateConversationErrorsModule (copy), var26 (ref), eventNamesModule (copy), createConversationErrorModule (copy)
		if var21 or not var19.current then
			return promiseModule.resolve()
		end
		var22(true)
		
		return var25(createConversationModule(if #var19.current == 1 then "one_to_one" else "group", var19.current, var28, "userCreatedNewConversation")):andThen(function(p7)
			-- upvalues: var18 (copy)
			var18.navigateToConversation(p7.id)
		end):catch(function(p6)
			-- upvalues: parseCreateConversationErrorsModule (copy), p5 (ref), var26 (copy), var22 (copy), var28 (copy), eventNamesModule (copy), createConversationErrorModule (copy)
			var26(if parseCreateConversationErrorsModule(p6) == "participant_chat_disabled" then p5.invalidParticipantText else p5.networkErrorText)
			var22(false)
			
			if var28 then
				var28.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
					createConversationResult = createConversationErrorModule.FetchConversationError
				})
			end
		end)
	end, {
		var25, var21, var22, var19, var18.navigateToConversation, var26, var28
	})
	useEffect(function()
		-- upvalues: var18 (ref), var29 (ref)
		var18.setSystemButtonActivated(var29)
	end, { var18.setSystemButtonActivated, var29 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0),
		Selectable = if fFlagFixPaginatedChatMembersCutoffModule then false else nil
	}, {
		UIPadding = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial and (not var23 and appNavBarModule.getScrollAwayEnabled()) and var18.topBarHeight ~= nil then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var18.topBarHeight) }) else nil,
		responseIndicator = var21 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = reactModule.createElement(selectChatMembersContainerModule, cryoModule.Dictionary.join(var18, {
			selectedUsersChanged = var27,
			maxSelections = maxSelections,
			maxConversationSize = maxConversationSize,
			canOnlyCreateOneToOneChat = var24
		}))
	})
end

return memo(CreateNewChatContainer)