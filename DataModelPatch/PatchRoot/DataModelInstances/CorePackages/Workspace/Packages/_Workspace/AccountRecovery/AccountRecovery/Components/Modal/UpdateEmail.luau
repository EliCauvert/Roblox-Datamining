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
local SetEmailModule = require(AccountRecovery.Thunks.SetEmail)
local _ = require(AccountRecovery.Common.AccountRecoveryRequestTypes)

return function(p1)
	-- upvalues: ReactModule (copy), AccountRecoveryContextModule (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), SetEmailModule (copy), UseLocalizationFunction (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local UseContextResult = ReactModule.useContext(AccountRecoveryContextModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	local function _(RecoverySessionId)
		-- upvalues: UseDispatchResult (copy), SetEmailModule (upval), UseRoactServiceResult (copy)
		return UseDispatchResult(SetEmailModule(UseRoactServiceResult, { recoverySessionId = RecoverySessionId }))
	end
	
	local _ = function()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseContextResult (copy), UseDispatchResult (copy), SetEmailModule (upval), UseRoactServiceResult (copy), p1 (copy)
		if not UseStateResult then
			UseStateResult2(true)
			UseDispatchResult(SetEmailModule(UseRoactServiceResult, {
				recoverySessionId = UseContextResult.state.recoverySessionId
			})):andThen(function(_)
				-- upvalues: p1 (upval)
				p1.onPasswordResetSuccess()
			end)
			
			return
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		updateEmailHeadingText = "Authentication.AccountRecovery.Heading.UpdateEmail",
		okButtonText = "Authentication.AccountRecovery.Action.Ok",
		updateEmailBodyText = {
			"Authentication.AccountRecovery.Description.UpdateEmailConfirmation",
			email = `{p1.email}`
		}
	})
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = DialogSize.Small
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationResult.updateEmailHeadingText
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			DialogText = ReactModule.createElement(Dialog.Text, {
				LayoutOrder = 1,
				Text = UseLocalizationResult.updateEmailBodyText
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.okButtonText,
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseContextResult (copy), UseDispatchResult (copy), SetEmailModule (upval), UseRoactServiceResult (copy), p1 (copy)
						if not UseStateResult then
							UseStateResult2(true)
							UseDispatchResult(SetEmailModule(UseRoactServiceResult, {
								recoverySessionId = UseContextResult.state.recoverySessionId
							})):andThen(function(_)
								-- upvalues: p1 (upval)
								p1.onPasswordResetSuccess()
							end)
							
							return
						end
					end
				}
			}
		})
	})
end