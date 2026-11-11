local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local Parent = AccountRecovery.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local AccountRecoveryContextModule = require(AccountRecovery.Store.AccountRecoveryContext)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local GetFFlagEnableTwoStepMethodDynamicTextFunction = require(AccountRecovery.Flags).GetFFlagEnableTwoStepMethodDynamicText
local GetCurrentTwoStepMethodModule = require(AccountRecovery.Thunks.GetCurrentTwoStepMethod)
local DisableTwoStepMethodModule = require(AccountRecovery.Thunks.DisableTwoStepMethod)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)
local ModalStateModule = require(AccountRecovery.Enums.ModalState)
local AccountRecoveryActionTypeModule = require(AccountRecovery.Enums.AccountRecoveryActionType)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), GetCurrentTwoStepMethodModule (copy), UseLocalizationFunction (copy), AccountRecoveryActionTypeModule (copy), ModalStateModule (copy), DisableTwoStepMethodModule (copy), Dialog (copy), DialogSize (copy), GetFFlagEnableTwoStepMethodDynamicTextFunction (copy), ButtonVariant (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), GetCurrentTwoStepMethodModule (upval), UseRoactServiceResult (copy), UseContextResult (copy), UseStateResult2 (copy), UseStateResult2_3 (copy)
		UseDispatchResult(GetCurrentTwoStepMethodModule(UseRoactServiceResult, UseContextResult.state.recoverySessionId)):andThen(function(Result)
			-- upvalues: UseStateResult2 (upval), UseStateResult2_3 (upval)
			if not Result.isError then
				UseStateResult2(Result.data.twoStepMethod)
			end
			UseStateResult2_3(false)
		end)
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		email = "Authentication.AccountRecovery.Label.Email2sv",
		authenticator = "Authentication.AccountRecovery.Label.Authenticator2sv",
		securityKey = "Authentication.AccountRecovery.Label.SecurityKey2sv"
	})
	
	local function _(p2)
		-- upvalues: UseLocalizationResult (copy)
		return if p2 == "Email" then UseLocalizationResult.email elseif p2 == "Authenticator" then UseLocalizationResult.authenticator elseif p2 == "SecurityKey" then UseLocalizationResult.securityKey else ""
	end
	
	local UseLocalizationResult1 = UseLocalizationFunction({
		headingText = "Authentication.AccountRecovery.Heading.SaveTwoStepMethod",
		bodyText = "Authentication.AccountRecovery.Description.SaveTwoStepMethod",
		saveButtonText = "Authentication.AccountRecovery.Action.Save",
		deleteButtonText = "Authentication.AccountRecovery.Action.Delete",
		dynamicBodyText = {
			"Authentication.AccountRecovery.Description.KeepTwoStepMethodDynamic",
			twoStepMethod = if UseStateResult == "Email" then UseLocalizationResult.email elseif UseStateResult == "Authenticator" then UseLocalizationResult.authenticator elseif UseStateResult == "SecurityKey" then UseLocalizationResult.securityKey else ""
		},
		requestErrorText = if UseStateResult3 == "" then nil else UseStateResult3 or nil
	})
	
	local function v28()
		-- upvalues: p1 (copy), UseContextResult (copy), AccountRecoveryActionTypeModule (upval), ModalStateModule (upval)
		if p1.shouldUpdateEmail then
			UseContextResult.dispatch({
				type = AccountRecoveryActionTypeModule.SET_MODAL_STATE_AND_PROPS,
				data = {
					modalStateAndProps = {
						modalState = ModalStateModule.UPDATE_EMAIL,
						props = {
							email = p1.email,
							onPasswordResetSuccess = p1.onPasswordResetSuccess
						}
					}
				}
			})
			
			return
		else
			p1.onPasswordResetSuccess()
		end
	end
	
	local function v29()
		-- upvalues: UseStateResult1 (copy), UseStateResult (copy), UseStateResult4 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseDispatchResult (copy), DisableTwoStepMethodModule (upval), UseRoactServiceResult (copy), UseContextResult (copy), v28 (copy)
		if not UseStateResult1 and UseStateResult ~= "" and not UseStateResult4 then
			UseStateResult2_1(true)
			UseStateResult2_2("")
			UseDispatchResult(DisableTwoStepMethodModule(UseRoactServiceResult, {
				recoverySessionId = UseContextResult.state.recoverySessionId,
				twoStepMethod = UseStateResult
			})):andThen(function(Result)
				-- upvalues: UseStateResult2_1 (upval), UseStateResult2_2 (upval), v28 (upval)
				UseStateResult2_1(false)
				
				if Result.isError then
					UseStateResult2_2(Result.errorKey)
					
					return
				else
					v28()
				end
			end)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: UseStateResult1 (copy), UseStateResult4 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), v28 (copy)
		if not UseStateResult1 and not UseStateResult4 then
			UseStateResult2_1(true)
			UseStateResult2_2("")
			v28()
			
			return
		end
	end
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = DialogSize.Small
	}, {
		DialogTitle = not UseStateResult4 and ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationResult1.headingText
		}),
		DialogContent = not UseStateResult4 and ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			DialogText = ReactModule.createElement(Dialog.Text, {
				LayoutOrder = 1,
				Text = if GetFFlagEnableTwoStepMethodDynamicTextFunction() then UseLocalizationResult1.dynamicBodyText else UseLocalizationResult1.bodyText
			}),
			RequestErrorText = UseStateResult3 ~= "" and ReactModule.createElement(Dialog.Text, {
				LayoutOrder = 2,
				Text = UseLocalizationResult1.requestErrorText or ""
			})
		}),
		DialogActions = not UseStateResult4 and ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult1.saveButtonText,
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: UseStateResult1 (copy), UseStateResult4 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), v28 (copy)
						if not UseStateResult1 then
							if UseStateResult4 then return end
							UseStateResult2_1(true)
							UseStateResult2_2("")
							v28()
						end
					end
				},
				{
					text = UseLocalizationResult1.deleteButtonText,
					variant = ButtonVariant.Standard,
					onActivated = function()
						-- upvalues: v29 (copy)
						v29()
					end
				}
			}
		})
	})
end