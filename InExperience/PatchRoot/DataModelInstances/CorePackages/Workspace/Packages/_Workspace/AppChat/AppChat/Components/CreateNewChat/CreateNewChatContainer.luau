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

function CreateNewChatContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useState (ref), fFlagAppIaScrollAway (ref), fFlagAppIaScrollAwayFixSocial (ref), useIsInExperienceModule (ref), useIsGroupChatEnabledModule (ref), useDispatch (ref), useCallback (ref), useAnalyticsModule (ref), promiseModule (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), eventNamesModule (ref), createConversationErrorModule (ref), useEffect (ref), reactModule (ref), fFlagFixPaginatedChatMembersCutoffModule (ref), appNavBarModule (ref), responseIndicator (ref), selectChatMembersContainerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useRef({})
	local var3 = useRef(false)
	local var4, var5 = useState(false)
	local var6 = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial then useIsInExperienceModule() else nil
	local maxSelections = var1.maxSelections
	local maxConversationSize = var1.maxConversationSize
	local var7 = false
	
	if not useIsGroupChatEnabledModule() then
		maxSelections = 1
		maxConversationSize = 1
		var7 = true
	end
	local var8 = useDispatch()
	local var9 = useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1.navigateToToast({ toastProps = { toastContent = { toastTitle = p2 } } })
	end, { var1.navigateToToast })
	
	local var10 = function(p2, p3)
		-- upvalues: var2 (ref), cryoModule (copy), var3 (ref), var1 (ref)
		var2.current = cryoModule.List.map(p2, function(p4)
			return p4.id
		end)
		local var11 = p3 <= #p2
		
		if var3.current ~= var11 then
			var3.current = var11
			var1.setSystemButtonEnabled(var11)
		end
	end
	
	local var11 = useAnalyticsModule()
	local var12 = useCallback(function(p2)
		-- upvalues: var4 (ref), var2 (ref), promiseModule (copy), var5 (ref), var8 (ref), createConversationModule (copy), var11 (ref), var1 (ref), parseCreateConversationErrorsModule (copy), var9 (ref), eventNamesModule (copy), createConversationErrorModule (copy)
		if var4 or not var2.current then
			return promiseModule.resolve()
		end
		var5(true)
		
		return var8(createConversationModule(if #var2.current == 1 then "one_to_one" else "group", var2.current, var11, "userCreatedNewConversation")):andThen(function(p3)
			-- upvalues: var1 (copy)
			var1.navigateToConversation(p3.id)
		end):catch(function(p3)
			-- upvalues: parseCreateConversationErrorsModule (copy), p2 (ref), var9 (copy), var5 (copy), var11 (copy), eventNamesModule (copy), createConversationErrorModule (copy)
			var9(if parseCreateConversationErrorsModule(p3) == "participant_chat_disabled" then p2.invalidParticipantText else p2.networkErrorText)
			var5(false)
			
			if var11 then
				var11.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
					createConversationResult = createConversationErrorModule.FetchConversationError
				})
			end
		end)
	end, {
		var8, var4, var5, var2, var1.navigateToConversation, var9, var11
	})
	useEffect(function()
		-- upvalues: var1 (ref), var12 (ref)
		var1.setSystemButtonActivated(var12)
	end, { var1.setSystemButtonActivated, var12 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0),
		Selectable = if fFlagFixPaginatedChatMembersCutoffModule then false else nil
	}, {
		UIPadding = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial and (not var6 and appNavBarModule.getScrollAwayEnabled()) and var1.topBarHeight ~= nil then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var1.topBarHeight) }) else nil,
		responseIndicator = var4 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = reactModule.createElement(selectChatMembersContainerModule, cryoModule.Dictionary.join(var1, {
			selectedUsersChanged = var10,
			maxSelections = maxSelections,
			maxConversationSize = maxConversationSize,
			canOnlyCreateOneToOneChat = var7
		}))
	})
end

return memo(CreateNewChatContainer)