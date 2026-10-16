local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatDetailsTelemetryEventsModule = require(AppChat.Components.ChatDetails.ChatDetailsTelemetryEvents)
local ChatDialogTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatDialogTelemetryLayer)
local ResponseIndicator = require(AppChat.SocialLibraries).Components.ResponseIndicator
local LeaveGroupDialogModule = require(script.Parent.LeaveGroupDialog)
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local config = {
	isRooted = false,
	titleKey = "Feature.Chat.Heading.LeaveGroup",
	cancelKey = "Feature.Chat.Action.Stay",
	confirmKey = "Feature.Chat.Action.Leave",
	failureTitleKey = "Feature.Chat.Heading.FailedToLeaveGroup",
	failureButtonKey = "Feature.Chat.Action.Confirm",
	onModalClose = function() --[[ Line: 48 ]] end,
	onLeaveSuccess = function() --[[ Line: 49 ]] end,
	bodyKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.LeaveGroup.V2" else "Feature.Chat.Message.LeaveGroup",
	failureBodyKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.FailedToLeaveGroup.V2" else "Feature.Chat.Message.FailedToLeaveGroup"
}

function LeaveGroupDialogContainer(p1) --[[ Line: 66 ]]
	-- upvalues: CryoModule (copy), config (copy), UseStateFunction (copy), UseTelemetryModule (copy), ChatDialogTelemetryLayerModule (copy), UseEffectOnMountFunction (copy), ChatDetailsTelemetryEventsModule (copy), UseDispatchFunction (copy), UseCallbackFunction (copy), AppChatNetworkingModule (copy), UseSelectorFunction (copy), GetFFlagIsSquadEnabledFunction (copy), RemovedConversationModule (copy), UseLocalizationFunction (copy), ReactModule (copy), LeaveGroupDialogModule (copy), ResponseIndicator (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStateResult, UseStateResult2 = UseStateFunction(true)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(false)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatDialogTelemetryLayerModule.Context)
	UseEffectOnMountFunction(function() --[[ Line: 73 ]]
		-- upvalues: UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.LeaveGroupDialogRendered, {})
	end)
	local UseDispatchResult = UseDispatchFunction()
	local UseCallbackResult = UseCallbackFunction(function(p2, p3) --[[ Line: 78 ]]
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval)
		return UseDispatchResult(AppChatNetworkingModule.rodux.RemoveUserFromConversation.API(p3, p2))
	end, { UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 82 ]]
		-- upvalues: JoinResult (copy), GetFFlagIsSquadEnabledFunction (upval)
		local Conversation = p2.ChatAppReducer.Conversations[JoinResult.conversationId] or { title = nil, hasGroupUp = nil }
		
		return {
			localUserId = p2.LocalUserId,
			conversationTitle = Conversation.title,
			hasGroupUp = if GetFFlagIsSquadEnabledFunction() then Conversation.hasGroupUp else nil
		}
	end)
	local UseCallbackResult1 = UseCallbackFunction(function(): boolean --[[ Line: 96 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy), UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), JoinResult (copy), UseCallbackResult (copy), UseSelectorResult (copy), UseDispatchResult (copy), RemovedConversationModule (upval), UseStateResult2_2 (copy)
		UseStateResult2_1(true)
		UseStateResult2(false)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.LeaveGroupDialogLeaveClicked, {})
		
		if JoinResult.conversationId then
			UseCallbackResult(UseSelectorResult.localUserId, JoinResult.conversationId):andThen(function() --[[ Line: 103 ]]
				-- upvalues: JoinResult (upval), UseDispatchResult (upval), RemovedConversationModule (upval)
				if JoinResult.isRooted then
					UseDispatchResult(RemovedConversationModule(JoinResult.conversationId))
				end
				JoinResult.onModalClose()
				JoinResult.onLeaveSuccess()
			end):catch(function() --[[ Line: 110 ]]
				-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval), UseStateResult2_2 (upval)
				UseStateResult2_1(false)
				UseStateResult2(true)
				UseStateResult2_2(true)
			end)
		end
		return true
	end, {
		UseSelectorResult.localUserId, UseSelectorResult.hasGroupUp,
		JoinResult.conversationId, JoinResult.isRooted, JoinResult.onModalClose,
		JoinResult.onLeaveSuccess, UseDispatchResult, UseCallbackResult,
		UseTelemetryModuleResult
	})
	local UseCallbackResult2 = UseCallbackFunction(function(...) --[[ Line: 130 ]]
		-- upvalues: UseTelemetryModuleResult (copy), ChatDetailsTelemetryEventsModule (upval), JoinResult (copy)
		UseTelemetryModuleResult.emit(ChatDetailsTelemetryEventsModule.LeaveGroupDialogStayClicked, {})
		JoinResult.onModalClose(...)
	end, {
		JoinResult.onModalClose,
		JoinResult.conversationId,
		UseTelemetryModuleResult
	})
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = JoinResult.titleKey,
		cancelText = JoinResult.cancelKey,
		confirmText = JoinResult.confirmKey,
		bodyText = JoinResult.bodyKey,
		failureTitleText = JoinResult.failureTitleKey,
		failureBodyText = {
			JoinResult.failureBodyKey,
			CONVERSATION_TITLE = UseSelectorResult.conversationTitle
		},
		failureButtonText = JoinResult.failureButtonKey
	})
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		LeaveGroupDialog = UseStateResult and ReactModule.createElement(LeaveGroupDialogModule, CryoModule.Dictionary.join(JoinResult, UseLocalizationResult, UseSelectorResult, {
			onActivated = UseCallbackResult1,
			displayFailed = UseStateResult3,
			onModalClose = UseCallbackResult2
		})),
		ResponseIndicator = UseStateResult1 and ReactModule.createElement(ResponseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		})
	})
end

return MemoFunction(LeaveGroupDialogContainer)