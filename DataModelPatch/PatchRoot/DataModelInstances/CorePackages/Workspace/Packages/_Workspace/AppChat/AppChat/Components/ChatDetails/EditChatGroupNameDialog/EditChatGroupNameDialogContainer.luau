local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(Parent.ReactFocusNavigation)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ResponseStatus = AppChatNetworkingModule.Constants.ResponseStatus
local ResponseIndicator = require(AppChat.SocialLibraries).Components.ResponseIndicator
local EditChatGroupNameDialogModule = require(script.Parent.EditChatGroupNameDialog)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local LoggerModule = require(AppChat.Logger)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local config = {
	Success = function()
		return { visible = false, isLoading = false, warningTextKey = nil }
	end,
	Moderated = function()
		-- upvalues: GetFFlagIsSquadEnabledFunction (copy)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Response.ChatNameFullyModerated.V2" else "Feature.Chat.Response.ChatNameFullyModerated"
		}
	end,
	Default = function(ConversationTitle, InputBox)
		-- upvalues: GetFFlagIsSquadEnabledFunction (copy)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = {
				if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.FailedToRenameConversation.V2" else "Feature.Chat.Message.FailedToRenameConversation",
				EXISTING_NAME = ConversationTitle,
				NEW_NAME = InputBox
			}
		}
	end,
	Waiting = function()
		return { visible = true, isLoading = true }
	end
}
local config1 = {
	cancelTitleKey = "Feature.Chat.Action.Cancel",
	confirmationTitleKey = "Feature.Chat.Action.Save",
	onModalClose = function() end,
	titleKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Label.GroupName" else "Feature.Chat.Label.ChatGroupName",
	placeholderTextKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Description.NameGroup" else "Feature.Chat.Description.NameGroupChat"
}

function EditChatGroupNameDialogContainer(p1)
	-- upvalues: CryoModule (copy), config1 (copy), UseStateFunction (copy), UseDispatchFunction (copy), UseCallbackFunction (copy), AppChatNetworkingModule (copy), UseSelectorFunction (copy), LoggerModule (copy), config (copy), ResponseStatus (copy), GetFFlagIsSquadEnabledFunction (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseLocalizationFunction (copy), ResponseIndicator (copy), EditChatGroupNameDialogModule (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p1)
	local UseStateResult, UseStateResult2 = UseStateFunction({ visible = true, isLoading = false })
	local UseDispatchResult = UseDispatchFunction()
	local UseCallbackResult = UseCallbackFunction(function(p2, p3)
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval)
		return UseDispatchResult(AppChatNetworkingModule.rodux.UpdateConversationTitle.API(p2, p3))
	end, { UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: JoinResult (copy)
		local Conversation = p2.ChatAppReducer.Conversations[JoinResult.conversationId]
		
		return if Conversation and not Conversation.isDefaultTitle then Conversation.title else ""
	end)
	local UseCallbackResult1 = UseCallbackFunction(function(p2): boolean
		-- upvalues: JoinResult (copy), UseStateResult2 (copy), UseCallbackResult (copy), LoggerModule (upval), config (upval), UseSelectorResult (copy), ResponseStatus (upval), GetFFlagIsSquadEnabledFunction (upval)
		if JoinResult.conversationId then
			UseStateResult2({ visible = true, isLoading = true })
			UseCallbackResult(JoinResult.conversationId, p2.InputBox):andThen(function(Result)
				-- upvalues: LoggerModule (upval), UseStateResult2 (upval), config (upval), UseSelectorResult (upval), p2 (copy), ResponseStatus (upval), JoinResult (upval), GetFFlagIsSquadEnabledFunction (upval)
				if not Result or not Result.responseBody or not Result.responseBody.conversations or not Result.responseBody.conversations[1] then
					LoggerModule.error("Conversation rename response is invalid.")
					UseStateResult2((config.Default(UseSelectorResult, p2.InputBox)))
					
					return
				end
				if Result.responseBody.conversations[1].status == ResponseStatus.SUCCESS then
					UseStateResult2({ visible = false, isLoading = false, warningTextKey = nil })
					JoinResult.onModalClose()
					
					return
				end
				if Result.responseBody and Result.responseBody.conversations[1].status == ResponseStatus.MODERATED then
					LoggerModule.error("Conversation rename was moderated.")
					UseStateResult2({
						visible = true,
						isLoading = false,
						warningTextKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Response.ChatNameFullyModerated.V2" else "Feature.Chat.Response.ChatNameFullyModerated"
					})
					
					return
				else
					LoggerModule.error("Conversation rename request failed.")
					UseStateResult2((config.Default(UseSelectorResult, p2.InputBox)))
				end
			end):catch(function(_)
				-- upvalues: UseStateResult2 (upval), config (upval), UseSelectorResult (upval), p2 (copy)
				UseStateResult2((config.Default(UseSelectorResult, p2.InputBox)))
			end)
		end
		return true
	end, { JoinResult.conversationId, UseSelectorResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), JoinResult (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: JoinResult (upval)
					JoinResult.onModalClose()
					p2:cancel()
				end)
			}
		}
	end, { JoinResult.onModalClose })
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = JoinResult.titleKey,
		placeholderText = JoinResult.placeholderTextKey,
		cancelText = JoinResult.cancelTitleKey,
		confirmText = JoinResult.confirmationTitleKey,
		warningText = UseStateResult.warningTextKey
	})
	
	return ReactModule.createElement(AppFocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		isFocusable = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = UseMemoResult
	}, (ReactModule.createElement(ReactModule.Fragment, nil, {
		responseIndicator = UseStateResult.isLoading and ReactModule.createElement(ResponseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		dialog = UseStateResult.visible and ReactModule.createElement(EditChatGroupNameDialogModule, CryoModule.Dictionary.join(JoinResult, UseLocalizationResult, {
			onActivated = UseCallbackResult1,
			inputText = UseSelectorResult,
			conversationTitle = UseSelectorResult
		}))
	})))
end

return MemoFunction(EditChatGroupNameDialogContainer)