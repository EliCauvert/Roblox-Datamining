local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local socialLibrariesModule = require(appChat.SocialLibraries)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(parent.ReactFocusNavigation)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local responseStatus = appChatNetworkingModule.Constants.ResponseStatus
local responseIndicator = socialLibrariesModule.Components.ResponseIndicator
local editChatGroupNameDialogModule = require(script.Parent.EditChatGroupNameDialog)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local loggerModule = require(appChat.Logger)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local t = {
	Success = function() --[[ line: 42 ]]
		return { visible = false, isLoading = false, warningTextKey = nil }
	end,
	Moderated = function() --[[ line: 51 ]]
		-- upvalues: getFFlagIsSquadEnabled (ref)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Response.ChatNameFullyModerated.V2" else "Feature.Chat.Response.ChatNameFullyModerated"
		}
	end,
	Default = function(p0, p1) --[[ line: 60 ]]
		-- upvalues: getFFlagIsSquadEnabled (ref)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = {
				if getFFlagIsSquadEnabled() then "Feature.Chat.Message.FailedToRenameConversation.V2" else "Feature.Chat.Message.FailedToRenameConversation",
				EXISTING_NAME = p0,
				NEW_NAME = p1
			}
		}
	end,
	Waiting = function() --[[ line: 73 ]]
		return { visible = true, isLoading = true }
	end
}
local t_1 = {
	cancelTitleKey = "Feature.Chat.Action.Cancel",
	confirmationTitleKey = "Feature.Chat.Action.Save",
	onModalClose = function() --[[ line: 92 ]] end,
	titleKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Label.GroupName" else "Feature.Chat.Label.ChatGroupName",
	placeholderTextKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Description.NameGroup" else "Feature.Chat.Description.NameGroupChat"
}

function EditChatGroupNameDialogContainer(p2) --[[ line: 103 ]]
	-- upvalues: cryoModule (ref), t_1 (ref), useState (ref), useDispatch (ref), useCallback (ref), appChatNetworkingModule (ref), useSelector (ref), t (ref), loggerModule (ref), responseStatus (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useLocalization (ref), responseIndicator (ref), editChatGroupNameDialogModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var11 = cryoModule.Dictionary.join(t_1, p2)
	local var12, var13 = useState({ visible = true, isLoading = false })
	local var14 = useDispatch()
	local var15 = useCallback(function(p3, p4) --[[ line: 111 ]]
		-- upvalues: var14 (ref), appChatNetworkingModule (copy)
		return var14(appChatNetworkingModule.rodux.UpdateConversationTitle.API(p3, p4))
	end, { var14 })
	local var16 = useSelector(function(p5) --[[ line: 115 ]]
		-- upvalues: var11 (ref)
		local conversationId = p5.ChatAppReducer.Conversations[var11.conversationId]
		
		return if conversationId and not conversationId.isDefaultTitle then conversationId.title else ""
	end)
	
	return reactModule.createElement(appFocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		isFocusable = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = reactModule.useMemo(function() --[[ line: 165 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var11 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p6) --[[ line: 169 ]]
						-- upvalues: var11 (copy)
						var11.onModalClose()
						p6:cancel()
					end)
				}
			}
		end, { var11.onModalClose })
	}, reactModule.createElement(reactModule.Fragment, nil, {
		responseIndicator = var12.isLoading and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		dialog = var12.visible and reactModule.createElement(editChatGroupNameDialogModule, cryoModule.Dictionary.join(var11, useLocalization({
			titleText = var11.titleKey,
			placeholderText = var11.placeholderTextKey,
			cancelText = var11.cancelTitleKey,
			confirmText = var11.confirmationTitleKey,
			warningText = var12.warningTextKey
		}), {
			onActivated = useCallback(function(p7) --[[ line: 130 ]]
				-- upvalues: var11 (ref), var13 (ref), t (copy), var15 (ref), loggerModule (copy), var16 (ref), responseStatus (copy)
				if var11.conversationId then
					var13(t.Waiting())
					var15(var11.conversationId, p7.InputBox):andThen(function(p8) --[[ line: 134 ]]
						-- upvalues: loggerModule (copy), var13 (copy), t (copy), var16 (copy), p7 (ref), responseStatus (copy), var11 (copy)
						if not p8 or not p8.responseBody or (not p8.responseBody.conversations or not p8.responseBody.conversations[1]) then
							loggerModule.error("Conversation rename response is invalid.")
							var13(t.Default(var16, p7.InputBox))
							
							return
						elseif p8.responseBody.conversations[1].status == responseStatus.SUCCESS then
							var13(t.Success())
							var11.onModalClose()
							
							return
						elseif p8.responseBody and p8.responseBody.conversations[1].status == responseStatus.MODERATED then
							loggerModule.error("Conversation rename was moderated.")
							var13(t.Moderated())
							
							return
						end
						loggerModule.error("Conversation rename request failed.")
						var13(t.Default(var16, p7.InputBox))
					end):catch(function(_) --[[ line: 157 ]]
						-- upvalues: var13 (copy), t (copy), var16 (copy), p7 (ref)
						var13(t.Default(var16, p7.InputBox))
					end)
				end
				return true
			end, { var11.conversationId, var16 }),
			inputText = var16,
			conversationTitle = var16
		}))
	}))
end

return memo(EditChatGroupNameDialogContainer)