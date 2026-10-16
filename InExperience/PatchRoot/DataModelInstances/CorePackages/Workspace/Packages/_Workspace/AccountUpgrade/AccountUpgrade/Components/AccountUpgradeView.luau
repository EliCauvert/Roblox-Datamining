local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local accountUpgradeFieldsModule = require(script.Parent.AccountUpgradeFields)
local accountUpgradeFieldErrorModule = require(script.Parent.AccountUpgradeFieldError)
local birthdayPickerSheetModule = require(script.Parent.BirthdayPickerSheet)
local closeConfirmationDialogModule = require(script.Parent.CloseConfirmationDialog)
local accountUpgradeDialogModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialog)
local accountUpgradeDialogActionsModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local view = foundationModule.View
local text = foundationModule.Text
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: accountUpgradeFieldModule (ref), reactModule (ref), view (ref), text (ref), accountUpgradeFieldsModule (ref), accountUpgradeDialogActionsModule (ref), buttonVariant (ref), accountUpgradeFieldErrorModule (ref), accountUpgradeDialogModule (ref), birthdayPickerSheetModule (ref), closeConfirmationDialogModule (ref)
	local var1 = not p1.isSaveEnabled and not p1.isSubmitting
	local var2 = p1.fieldStates[accountUpgradeFieldModule.Birthday] ~= nil
	local onClose = p1.onClose
	local onSignOut = p1.onSignOut
	
	return reactModule.createElement(accountUpgradeDialogModule, {
		title = p1.titleText,
		onClose = if onClose and not p1.confirmsClose then reactModule.useCallback(function(_)
			-- upvalues: onClose (ref)
			if onClose then
				onClose()
			end
		end, { onClose }) else nil,
		onCloseActivated = if p1.confirmsClose then onClose else nil,
		hasBackdrop = p1.hasBackdrop,
		isFocusable = not (p1.isBirthdayPickerOpen or p1.isCloseConfirmationOpen),
		children = {
			Content = reactModule.createElement(view, {
				tag = "col gap-large size-full-0 auto-y",
				testId = "AccountUpgradeContent"
			}, {
				Subtitle = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					LayoutOrder = 1,
					testId = "AccountUpgradeSubtitle",
					Text = p1.subtitleText
				}),
				Body = reactModule.createElement(view, {
					tag = "col gap-xxlarge size-full-0 auto-y",
					LayoutOrder = 2,
					testId = "AccountUpgradeBody"
				}, {
					Fields = reactModule.createElement(accountUpgradeFieldsModule, { LayoutOrder = 1, form = p1 }),
					Actions = reactModule.createElement(view, {
						tag = "col gap-small size-full-0 auto-y",
						LayoutOrder = 2
					}, {
						Buttons = reactModule.createElement(accountUpgradeDialogActionsModule, {
							LayoutOrder = 1,
							buttons = {
								{
									text = p1.saveText,
									variant = if var1 then buttonVariant.Standard else buttonVariant.Emphasis,
									onActivated = p1.onSaveActivated,
									isDisabled = var1,
									isLoading = p1.isSubmitting
								}
							}
						}),
						Error = reactModule.createElement(accountUpgradeFieldErrorModule, {
							LayoutOrder = 2,
							testId = "AccountUpgradeSubmitError",
							text = p1.submitError
						})
					})
				})
			}),
			BirthdayPicker = if var2 then reactModule.createElement(birthdayPickerSheetModule, {
				isOpen = p1.isBirthdayPickerOpen,
				birthday = p1.birthday,
				onClose = p1.onBirthdayPickerClosed,
				onConfirm = p1.onBirthdayConfirmed
			}) else nil,
			CloseConfirmation = if p1.isCloseConfirmationOpen and onSignOut then reactModule.createElement(closeConfirmationDialogModule, {
				onBack = p1.onCloseConfirmationBack,
				onSignOut = onSignOut
			}) else nil
		}
	})
end