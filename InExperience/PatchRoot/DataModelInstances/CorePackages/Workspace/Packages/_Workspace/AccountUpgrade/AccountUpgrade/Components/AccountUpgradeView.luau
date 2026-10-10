local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local registerAuditContent = require(parent.AuthCommon).Components.RegisterAuditContent
local legalTextWithLinks = require(parent.AuthCommon).Components.LegalTextWithLinks
local accountUpgradeFieldsModule = require(script.Parent.AccountUpgradeFields)
local accountUpgradeFieldErrorModule = require(script.Parent.AccountUpgradeFieldError)
local birthdayPickerSheetModule = require(script.Parent.BirthdayPickerSheet)
local closeConfirmationDialogModule = require(script.Parent.CloseConfirmationDialog)
local accountUpgradeDialogModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialog)
local accountUpgradeDialogActionsModule = require(accountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant

local function createAuditContent(p1)
	-- upvalues: reactModule (ref), registerAuditContent (ref)
	local t = {}
	
	for i, v in p1 do
		t[v.translationKey] = reactModule.createElement(registerAuditContent, v)
	end
	return reactModule.createElement(reactModule.Fragment, nil, t)
end

return function(p2)
	-- upvalues: accountUpgradeFieldModule (ref), reactModule (ref), view (ref), accountUpgradeFieldsModule (ref), accountUpgradeDialogActionsModule (ref), buttonVariant (ref), accountUpgradeFieldErrorModule (ref), legalTextWithLinks (ref), createAuditContent (ref), accountUpgradeDialogModule (ref), birthdayPickerSheetModule (ref), closeConfirmationDialogModule (ref)
	local var1 = not p2.isSaveEnabled and not p2.isSubmitting
	local var2 = p2.fieldStates[accountUpgradeFieldModule.Birthday] ~= nil
	local onClose = p2.onClose
	local onSignOut = p2.onSignOut
	
	return reactModule.createElement(accountUpgradeDialogModule, {
		title = p2.titleText,
		subtitle = p2.subtitleText,
		onClose = if onClose and not p2.confirmsClose then reactModule.useCallback(function(_)
			-- upvalues: onClose (ref)
			if onClose then
				onClose()
			end
		end, { onClose }) else nil,
		onCloseActivated = if p2.confirmsClose then onClose else nil,
		hasBackdrop = p2.hasBackdrop,
		isFocusable = not (p2.isBirthdayPickerOpen or p2.isCloseConfirmationOpen),
		children = {
			Content = reactModule.createElement(view, {
				testId = "AccountUpgradeContent",
				tag = {
					["col size-full-0 auto-y"] = true,
					["padding-top-xsmall"] = p2.subtitleText ~= nil
				}
			}, {
				Body = reactModule.createElement(view, {
					tag = "col gap-xlarge size-full-0 auto-y",
					LayoutOrder = 1,
					testId = "AccountUpgradeBody"
				}, {
					Fields = reactModule.createElement(accountUpgradeFieldsModule, { LayoutOrder = 1, form = p2 }),
					Actions = reactModule.createElement(view, {
						tag = "col gap-small size-full-0 auto-y",
						LayoutOrder = 2
					}, {
						Buttons = reactModule.createElement(accountUpgradeDialogActionsModule, {
							LayoutOrder = 1,
							buttons = {
								{
									text = p2.saveText,
									variant = if var1 then buttonVariant.Standard else buttonVariant.Emphasis,
									onActivated = p2.onSaveActivated,
									isDisabled = var1,
									isLoading = p2.isSubmitting
								}
							}
						}),
						Error = reactModule.createElement(accountUpgradeFieldErrorModule, {
							LayoutOrder = 2,
							testId = "AccountUpgradeSubmitError",
							text = p2.submitError
						}),
						LegalText = if p2.legalText then reactModule.createElement(legalTextWithLinks, {
							LayoutOrder = 3,
							testId = "AccountUpgradeLegalText",
							text = p2.legalText,
							onLinkActivated = p2.onLegalLinkActivated
						}) else nil
					})
				}),
				AuditContent = if p2.auditContent then createAuditContent(p2.auditContent) else nil
			}),
			BirthdayPicker = if var2 then reactModule.createElement(birthdayPickerSheetModule, {
				isOpen = p2.isBirthdayPickerOpen,
				birthday = p2.birthday,
				onClose = p2.onBirthdayPickerClosed,
				onConfirm = p2.onBirthdayConfirmed
			}) else nil,
			CloseConfirmation = if p2.isCloseConfirmationOpen and onSignOut then reactModule.createElement(closeConfirmationDialogModule, {
				onBack = p2.onCloseConfirmationBack,
				onSignOut = onSignOut
			}) else nil
		}
	})
end