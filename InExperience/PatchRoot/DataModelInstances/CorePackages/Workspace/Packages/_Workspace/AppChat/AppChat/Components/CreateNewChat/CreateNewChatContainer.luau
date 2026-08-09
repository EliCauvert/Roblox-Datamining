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
	pageHeaderText = if getFFlagIsSquadEnabled() then if require(parent.SocialExperiments).ArgoPartyExperimentation.getIsRenameEnabled() then "Feature.Chat.Heading.ChatWithFriends" elseif sharedFlagsModule.FFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections",
	conversation = conversationModule.empty(),
	setSystemButtonActivated = function(_) --[[ line: 81 ]] end,
	setSystemButtonEnabled = function(_) --[[ line: 82 ]] end
}

function CreateNewChatContainer(p0) --[[ line: 86 ]]
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useState (ref), fFlagAppIaScrollAway (ref), fFlagAppIaScrollAwayFixSocial (ref), useIsInExperienceModule (ref), useIsGroupChatEnabledModule (ref), useDispatch (ref), useCallback (ref), useAnalyticsModule (ref), promiseModule (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), eventNamesModule (ref), createConversationErrorModule (ref), useEffect (ref), reactModule (ref), appNavBarModule (ref), responseIndicator (ref), selectChatMembersContainerModule (ref)
	local var16 = cryoModule.Dictionary.join(t, p0)
	local var17 = useRef({})
	local var18 = useRef(false)
	local var19, var20 = useState(false)
	local var21 = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial then useIsInExperienceModule() else nil
	local maxSelections = var16.maxSelections
	local maxConversationSize = var16.maxConversationSize
	local var22 = false
	
	if not useIsGroupChatEnabledModule() then
		maxSelections = 1
		maxConversationSize = 1
		var22 = true
	end
	local var23 = useDispatch()
	local var24 = useCallback(function(p1) --[[ line: 107 ]]
		-- upvalues: var16 (ref)
		var16.navigateToToast({ toastProps = { toastContent = { toastTitle = p1 } } })
	end, { var16.navigateToToast })
	
	local var25 = function(p2, p3) --[[ line: 117 ]]
		-- upvalues: var17 (ref), cryoModule (copy), var18 (ref), var16 (ref)
		var17.current = cryoModule.List.map(p2, function(p4) --[[ line: 118 ]]
			return p4.id
		end)
		local var28 = p3 <= #p2
		
		if var18.current ~= var28 then
			var18.current = var28
			var16.setSystemButtonEnabled(var28)
		end
	end
	
	local var26 = useAnalyticsModule()
	local var27 = useCallback(function(p5) --[[ line: 131 ]]
		-- upvalues: var19 (ref), var17 (ref), promiseModule (copy), var20 (ref), var23 (ref), createConversationModule (copy), var26 (ref), var16 (ref), parseCreateConversationErrorsModule (copy), var24 (ref), eventNamesModule (copy), createConversationErrorModule (copy)
		if var19 or not var17.current then
			return promiseModule.resolve()
		end
		var20(true)
		
		return var23(createConversationModule(if #var17.current == 1 then "one_to_one" else "group", var17.current, var26, "userCreatedNewConversation")):andThen(function(p7) --[[ line: 152 ]]
			-- upvalues: var16 (copy)
			var16.navigateToConversation(p7.id)
		end):catch(function(p6) --[[ line: 156 ]]
			-- upvalues: parseCreateConversationErrorsModule (copy), p5 (ref), var24 (copy), var20 (copy), var26 (copy), eventNamesModule (copy), createConversationErrorModule (copy)
			var24(if parseCreateConversationErrorsModule(p6) == "participant_chat_disabled" then p5.invalidParticipantText else p5.networkErrorText)
			var20(false)
			
			if var26 then
				var26.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
					createConversationResult = createConversationErrorModule.FetchConversationError
				})
			end
		end)
	end, {
		var23, var19, var20, var17, var16.navigateToConversation, var24, var26
	})
	useEffect(function() --[[ line: 186 ]]
		-- upvalues: var16 (ref), var27 (ref)
		var16.setSystemButtonActivated(var27)
	end, { var16.setSystemButtonActivated, var27 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIPadding = if fFlagAppIaScrollAway and not fFlagAppIaScrollAwayFixSocial and (not var21 and appNavBarModule.getScrollAwayEnabled()) and var16.topBarHeight ~= nil then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var16.topBarHeight) }) else nil,
		responseIndicator = var19 and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = reactModule.createElement(selectChatMembersContainerModule, cryoModule.Dictionary.join(var16, {
			selectedUsersChanged = var25,
			maxSelections = maxSelections,
			maxConversationSize = maxConversationSize,
			canOnlyCreateOneToOneChat = var22
		}))
	})
end

return memo(CreateNewChatContainer)