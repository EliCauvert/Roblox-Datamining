local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local ResponseIndicator = require(AppChat.SocialLibraries).Components.ResponseIndicator
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local PromiseModule = require(Parent.Promise)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseIsGroupChatEnabledModule = require(AppChat.Hooks.useIsGroupChatEnabled)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local UseStateFunction = ReactModule.useState
local UseRefFunction = ReactModule.useRef
local AppNavBarModule = require(Parent.AppNavBar)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local _ = require(AppChat.Models.ConversationChannels)
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)
local ParseCreateConversationErrorsModule = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local SelectChatMembersContainerModule = require(AppChat.Components.SelectChatMembers.SelectChatMembersContainer)
local EventNamesModule = require(AppChat.Analytics.EventNames)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local CreateConversationErrorModule = require(AppChat.Analytics.Enums.CreateConversationError)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagAppIaScrollAwayFixSocial = SharedFlagsModule.FFlagAppIaScrollAwayFixSocial
local GetFFlagIsSquadEnabledFunction = SharedFlagsModule.GetFFlagIsSquadEnabled
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local ArgoPartyExperimentation = require(Parent.SocialExperiments).ArgoPartyExperimentation
local config = {
	topBarHeight = nil,
	minSelections = 1,
	maxSelections = 5,
	maxConversationSize = 5,
	systemButtonText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends",
	pageHeaderText = if GetFFlagIsSquadEnabledFunction() then if ArgoPartyExperimentation.getIsRenameEnabled() then if UniversalAppPolicyModule.getAppFeaturePolicies().getCanSeeChatTerminology() then "Feature.Chat.Heading.ChatWithFriends" else "Feature.Chat.Heading.PartyWithFriends" elseif FFlagConnectionsToFriendsRename then "Feature.Chat.Heading.PartyWithFriends" else "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections",
	conversation = require(AppChat.Models.Conversation).empty(),
	setSystemButtonActivated = function(_) end,
	setSystemButtonEnabled = function(_) end
}

function CreateNewChatContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), UseRefFunction (copy), UseStateFunction (copy), FFlagAppIaScrollAway (copy), FFlagAppIaScrollAwayFixSocial (copy), UseIsInExperienceModule (copy), UseIsGroupChatEnabledModule (copy), UseDispatchFunction (copy), UseCallbackFunction (copy), UseAnalyticsModule (copy), PromiseModule (copy), CreateConversationModule (copy), ParseCreateConversationErrorsModule (copy), EventNamesModule (copy), CreateConversationErrorModule (copy), UseEffectFunction (copy), ReactModule (copy), AppNavBarModule (copy), ResponseIndicator (copy), SelectChatMembersContainerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseRefResult = UseRefFunction({})
	local UseRefResult1 = UseRefFunction(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseIsInExperienceModuleResult = if FFlagAppIaScrollAway and not FFlagAppIaScrollAwayFixSocial then UseIsInExperienceModule() else nil
	local MaxSelections = JoinResult.maxSelections
	local MaxConversationSize = JoinResult.maxConversationSize
	local CanOnlyCreateOneToOneChat = false
	
	if not UseIsGroupChatEnabledModule() then
		MaxSelections = 1
		MaxConversationSize = 1
		CanOnlyCreateOneToOneChat = true
	end
	local UseDispatchResult = UseDispatchFunction()
	local UseCallbackResult = UseCallbackFunction(function(ToastTitle)
		-- upvalues: JoinResult (copy)
		JoinResult.navigateToToast({
			toastProps = { toastContent = { toastTitle = ToastTitle } }
		})
	end, { JoinResult.navigateToToast })
	
	local function SelectedUsersChanged(p2, p3)
		-- upvalues: UseRefResult (copy), CryoModule (upval), UseRefResult1 (copy), JoinResult (copy)
		UseRefResult.current = CryoModule.List.map(p2, function(p4)
			return p4.id
		end)
		local Current = p3 <= #p2
		
		if UseRefResult1.current ~= Current then
			UseRefResult1.current = Current
			JoinResult.setSystemButtonEnabled(Current)
		end
	end
	
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult (copy), UseRefResult (copy), PromiseModule (upval), UseStateResult2 (copy), UseDispatchResult (copy), CreateConversationModule (upval), UseAnalyticsModuleResult (copy), JoinResult (copy), ParseCreateConversationErrorsModule (upval), UseCallbackResult (copy), EventNamesModule (upval), CreateConversationErrorModule (upval)
		if UseStateResult or not UseRefResult.current then
			return PromiseModule.resolve()
		else
			UseStateResult2(true)
			
			return UseDispatchResult(CreateConversationModule(if #UseRefResult.current == 1 then "one_to_one" else "group", UseRefResult.current, UseAnalyticsModuleResult, "userCreatedNewConversation")):andThen(function(Result)
				-- upvalues: JoinResult (upval)
				JoinResult.navigateToConversation(Result.id)
			end):catch(function(Err)
				-- upvalues: ParseCreateConversationErrorsModule (upval), p2 (copy), UseCallbackResult (upval), UseStateResult2 (upval), UseAnalyticsModuleResult (upval), EventNamesModule (upval), CreateConversationErrorModule (upval)
				UseCallbackResult(if ParseCreateConversationErrorsModule(Err) == "participant_chat_disabled" then p2.invalidParticipantText else p2.networkErrorText)
				UseStateResult2(false)
				
				if UseAnalyticsModuleResult then
					UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.NewConversationCreated, {
						createConversationResult = CreateConversationErrorModule.FetchConversationError
					})
				end
			end)
		end
	end, {
		UseDispatchResult, UseStateResult, UseStateResult2, UseRefResult,
		JoinResult.navigateToConversation, UseCallbackResult, UseAnalyticsModuleResult
	})
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), UseCallbackResult1 (copy)
		JoinResult.setSystemButtonActivated(UseCallbackResult1)
	end, { JoinResult.setSystemButtonActivated, UseCallbackResult1 })
	
	return ReactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIPadding = if FFlagAppIaScrollAway and not FFlagAppIaScrollAwayFixSocial and not UseIsInExperienceModuleResult and AppNavBarModule.getScrollAwayEnabled() and JoinResult.topBarHeight ~= nil then ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, JoinResult.topBarHeight) }) else nil,
		responseIndicator = UseStateResult and ReactModule.createElement(ResponseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = ReactModule.createElement(SelectChatMembersContainerModule, CryoModule.Dictionary.join(JoinResult, {
			selectedUsersChanged = SelectedUsersChanged,
			maxSelections = MaxSelections,
			maxConversationSize = MaxConversationSize,
			canOnlyCreateOneToOneChat = CanOnlyCreateOneToOneChat
		}))
	})
end

return MemoFunction(CreateNewChatContainer)