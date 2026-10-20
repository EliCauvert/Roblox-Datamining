local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local PromiseModule = require(Parent.Promise)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseRefFunction = ReactModule.useRef
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)
local ParseCreateConversationErrorsModule = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local ExpandToGroupConversationModule = require(AppChat.Conversations.Thunks.expandToGroupConversation)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local ResponseIndicator = require(AppChat.SocialLibraries).Components.ResponseIndicator
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local SelectChatMembersContainerModule = require(AppChat.Components.SelectChatMembers.SelectChatMembersContainer)
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local config = {
	minSelections = 1,
	maxSelections = 5,
	maxConversationSize = 5,
	topBarHeight = nil,
	conversation = nil,
	systemButtonText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Action.Create" else "Feature.Chat.Action.StartChatWithFriends",
	pageHeaderText = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Heading.PartyWithConnections" else "Feature.Chat.Heading.ChatWithConnections",
	setSystemButtonActivated = function(_) end,
	setSystemButtonEnabled = function(_) end
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseRefFunction (copy), UseStateFunction (copy), UseAnalyticsModule (copy), UseSelectorFunction (copy), UseCallbackFunction (copy), UseDispatchFunction (copy), AppChatNetworkingModule (copy), CreateConversationModule (copy), PromiseModule (copy), ParseCreateConversationErrorsModule (copy), ConversationModule (copy), ConversationChannelsModule (copy), ExpandToGroupConversationModule (copy), UseEffectFunction (copy), ReactModule (copy), ResponseIndicator (copy), SelectChatMembersContainerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseRefResult = UseRefFunction({})
	local UseRefResult1 = UseRefFunction(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseSelectorResult = UseSelectorFunction(UseCallbackFunction(function(p2)
		return p2.LocalUserId
	end, {}))
	local UseDispatchResult = UseDispatchFunction()
	local UseCallbackResult = UseCallbackFunction(function(p2, p3)
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval)
		return UseDispatchResult(AppChatNetworkingModule.rodux.AddUserToConversation.API(p3, p2))
	end, { UseDispatchResult })
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: UseDispatchResult (copy), CreateConversationModule (upval), UseAnalyticsModuleResult (copy)
		return UseDispatchResult(CreateConversationModule("group", p2, UseAnalyticsModuleResult, "userAddedParticipantToOneToOne"))
	end, { UseDispatchResult })
	local UseCallbackResult2 = UseCallbackFunction(function(ToastTitle)
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
	
	local UseCallbackResult3 = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult (copy), PromiseModule (upval), JoinResult (copy), ParseCreateConversationErrorsModule (upval), UseCallbackResult2 (copy), UseStateResult2 (copy), ConversationModule (upval), UseCallbackResult (copy), UseRefResult (copy), ConversationChannelsModule (upval), CryoModule (upval), UseSelectorResult (copy), UseDispatchResult (copy), ExpandToGroupConversationModule (upval), UseAnalyticsModuleResult (copy), UseCallbackResult1 (copy)
		if UseStateResult then
			return PromiseModule.resolve()
		end
		local Id = JoinResult.conversation.id
		local ConversationType = JoinResult.conversation.conversationType
		
		local function v32(p3)
			-- upvalues: ParseCreateConversationErrorsModule (upval), p2 (copy), UseCallbackResult2 (upval), UseStateResult2 (upval)
			UseCallbackResult2(if ParseCreateConversationErrorsModule(p3) == "participant_chat_disabled" then p2.invalidParticipantText else p2.networkErrorText)
			UseStateResult2(false)
		end
		
		UseStateResult2(true)
		
		if ConversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
			return UseCallbackResult(UseRefResult.current, Id):andThen(function()
				-- upvalues: JoinResult (upval), Id (copy)
				JoinResult.navigateToConversation(Id)
			end, v32)
		elseif ConversationType ~= ConversationModule.Type.ONE_TO_ONE_CONVERSATION then
			UseCallbackResult2(if ParseCreateConversationErrorsModule({
				Body = "conversationType not supported",
				StatusCode = 400
			}) == "participant_chat_disabled" then p2.invalidParticipantText else p2.networkErrorText)
			UseStateResult2(false)
			
			return PromiseModule.reject(string.format("conversationType not supported: %q", (tostring(ConversationType))))
		elseif JoinResult.conversation.hasGroupUp and JoinResult.conversation.moderationType == ConversationChannelsModule.ModerationType.TrustedComms then
			UseCallbackResult2(p2.cannotExpandToGroupChatActivePartyText)
			UseStateResult2(false)
			
			return PromiseModule.reject("Cannot expand to group chat while there is an active party if the chat has expanded chat features")
		else
			local FilterResult = CryoModule.List.filter(CryoModule.List.join(UseRefResult.current, JoinResult.conversation.participants), function(LocalUserId): boolean
				-- upvalues: UseSelectorResult (upval)
				return LocalUserId ~= UseSelectorResult
			end)
			
			return if JoinResult.conversation.source == "channels" or JoinResult.conversation.source == "chat" then UseDispatchResult(ExpandToGroupConversationModule(Id, FilterResult, UseAnalyticsModuleResult)):andThen(function(Result)
				-- upvalues: JoinResult (upval)
				JoinResult.navigateToConversation(Result.id)
			end, v32) else UseCallbackResult1(FilterResult):andThen(function(Result)
				-- upvalues: JoinResult (upval)
				JoinResult.navigateToConversation(Result.id)
			end, v32)
		end
	end, {
		UseDispatchResult, UseStateResult, UseStateResult2, UseRefResult,
		JoinResult.navigateToConversation, JoinResult.conversation.id,
		JoinResult.conversation.conversationType, JoinResult.conversation.participants,
		JoinResult.conversation.source, UseCallbackResult2, UseAnalyticsModuleResult
	})
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), UseCallbackResult3 (copy)
		JoinResult.setSystemButtonActivated(UseCallbackResult3)
	end, { JoinResult.setSystemButtonActivated, UseCallbackResult3 })
	
	return ReactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Active = true,
		AutoButtonColor = false,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		responseIndicator = UseStateResult and ReactModule.createElement(ResponseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		selectChatMembers = ReactModule.createElement(SelectChatMembersContainerModule, CryoModule.Dictionary.join(JoinResult, {
			maxSelections = JoinResult.maxSelections - #JoinResult.conversation.participants + 1,
			selectedUsersChanged = SelectedUsersChanged,
			localUserId = UseSelectorResult
		}))
	})
end)