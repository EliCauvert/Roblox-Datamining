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
	Success = function()
		return { visible = false, isLoading = false, warningTextKey = nil }
	end,
	Moderated = function()
		-- upvalues: getFFlagIsSquadEnabled (ref)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Response.ChatNameFullyModerated.V2" else "Feature.Chat.Response.ChatNameFullyModerated"
		}
	end,
	Default = function(p1, p2)
		-- upvalues: getFFlagIsSquadEnabled (ref)
		return {
			visible = true,
			isLoading = false,
			warningTextKey = {
				if getFFlagIsSquadEnabled() then "Feature.Chat.Message.FailedToRenameConversation.V2" else "Feature.Chat.Message.FailedToRenameConversation",
				EXISTING_NAME = p1,
				NEW_NAME = p2
			}
		}
	end,
	Waiting = function()
		return { visible = true, isLoading = true }
	end
}
local t_1 = {
	cancelTitleKey = "Feature.Chat.Action.Cancel",
	confirmationTitleKey = "Feature.Chat.Action.Save",
	onModalClose = function() end,
	titleKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Label.GroupName" else "Feature.Chat.Label.ChatGroupName",
	placeholderTextKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Description.NameGroup" else "Feature.Chat.Description.NameGroupChat"
}

function EditChatGroupNameDialogContainer(p3)
	-- upvalues: cryoModule (ref), t_1 (ref), useState (ref), useDispatch (ref), useCallback (ref), appChatNetworkingModule (ref), useSelector (ref), loggerModule (ref), t (ref), responseStatus (ref), getFFlagIsSquadEnabled (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useLocalization (ref), responseIndicator (ref), editChatGroupNameDialogModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1 = cryoModule.Dictionary.join(t_1, p3)
	local var2, var3 = useState({ visible = true, isLoading = false })
	local var4 = useDispatch()
	local var5 = useCallback(function(p4, p5)
		-- upvalues: var4 (ref), appChatNetworkingModule (copy)
		return var4(appChatNetworkingModule.rodux.UpdateConversationTitle.API(p4, p5))
	end, { var4 })
	local var6 = useSelector(function(p4)
		-- upvalues: var1 (ref)
		local conversationId = p4.ChatAppReducer.Conversations[var1.conversationId]
		
		return if conversationId and not conversationId.isDefaultTitle then conversationId.title else ""
	end)
	
	return reactModule.createElement(appFocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		isFocusable = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var1 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p4)
						-- upvalues: var1 (copy)
						var1.onModalClose()
						p4:cancel()
					end)
				}
			}
		end, { var1.onModalClose })
	}, reactModule.createElement(reactModule.Fragment, nil, {
		responseIndicator = var2.isLoading and reactModule.createElement(responseIndicator, {
			soakAreaTransparency = 0.8,
			soakAreaColor3 = Color3.fromRGB(25, 25, 25)
		}),
		dialog = var2.visible and reactModule.createElement(editChatGroupNameDialogModule, cryoModule.Dictionary.join(var1, useLocalization({
			titleText = var1.titleKey,
			placeholderText = var1.placeholderTextKey,
			cancelText = var1.cancelTitleKey,
			confirmText = var1.confirmationTitleKey,
			warningText = var2.warningTextKey
		}), {
			onActivated = useCallback(function(p4)
				-- upvalues: var1 (ref), var3 (ref), var5 (ref), loggerModule (copy), t (copy), var6 (ref), responseStatus (copy), getFFlagIsSquadEnabled (copy)
				if var1.conversationId then
					var3({ visible = true, isLoading = true })
					var5(var1.conversationId, p4.InputBox):andThen(function(p5)
						-- upvalues: loggerModule (copy), var3 (copy), t (copy), var6 (copy), p4 (ref), responseStatus (copy), var1 (copy), getFFlagIsSquadEnabled (copy)
						if not p5 or not p5.responseBody or (not p5.responseBody.conversations or not p5.responseBody.conversations[1]) then
							loggerModule.error("Conversation rename response is invalid.")
							var3(t.Default(var6, p4.InputBox))
							
							return
						elseif p5.responseBody.conversations[1].status == responseStatus.SUCCESS then
							var3({ visible = false, isLoading = false, warningTextKey = nil })
							var1.onModalClose()
							
							return
						elseif p5.responseBody and p5.responseBody.conversations[1].status == responseStatus.MODERATED then
							loggerModule.error("Conversation rename was moderated.")
							var3({
								visible = true,
								isLoading = false,
								warningTextKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Response.ChatNameFullyModerated.V2" else "Feature.Chat.Response.ChatNameFullyModerated"
							})
							
							return
						end
						loggerModule.error("Conversation rename request failed.")
						var3(t.Default(var6, p4.InputBox))
					end):catch(function(_)
						-- upvalues: var3 (copy), t (copy), var6 (copy), p4 (ref)
						var3(t.Default(var6, p4.InputBox))
					end)
				end
				return true
			end, { var1.conversationId, var6 }),
			inputText = var6,
			conversationTitle = var6
		}))
	}))
end

return memo(EditChatGroupNameDialogContainer)