local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local RegisterAuditContent = require(Parent.AuthCommon).Components.RegisterAuditContent
local LegalTextWithLinks = require(Parent.AuthCommon).Components.LegalTextWithLinks
local AccountUpgradeFieldsModule = require(script.Parent.AccountUpgradeFields)
local AccountUpgradeFieldErrorModule = require(script.Parent.AccountUpgradeFieldError)
local BirthdayPickerSheetModule = require(script.Parent.BirthdayPickerSheet)
local CloseConfirmationDialogModule = require(script.Parent.CloseConfirmationDialog)
local MarketingConsentCheckboxModule = require(script.Parent.MarketingConsentCheckbox)
local AccountUpgradeDialogModule = require(AccountUpgrade.SuccessModal.AccountUpgradeDialog)
local AccountUpgradeDialogActionsModule = require(AccountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local AccountUpgradeFieldModule = require(AccountUpgrade.AccountUpgradeField)
local FFlagAccountUpgradeOAuthTelemetryModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

local function noop() end

local function createAuditContent(AuditContent)
	-- upvalues: ReactModule (copy), RegisterAuditContent (copy)
	local Elements = {}
	
	for _, value in AuditContent do
		Elements[value.translationKey] = ReactModule.createElement(RegisterAuditContent, value)
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end

return function(Form)
	-- upvalues: AccountUpgradeFieldModule (copy), ReactModule (copy), View (copy), AccountUpgradeFieldsModule (copy), AccountUpgradeDialogActionsModule (copy), ButtonVariant (copy), AccountUpgradeFieldErrorModule (copy), MarketingConsentCheckboxModule (copy), noop (copy), InputSize (copy), LegalTextWithLinks (copy), createAuditContent (copy), AccountUpgradeDialogModule (copy), BirthdayPickerSheetModule (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), CloseConfirmationDialogModule (copy)
	local NoIsSubmitting: boolean = not Form.isSaveEnabled and not Form.isSubmitting
	local HasFieldState = Form.fieldStates[AccountUpgradeFieldModule.Birthday] ~= nil
	local OnCloseFunction = Form.onClose
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: OnCloseFunction (copy)
		if OnCloseFunction then
			OnCloseFunction()
		end
	end, { OnCloseFunction })
	local OnSignOut = Form.onSignOut
	
	return ReactModule.createElement(AccountUpgradeDialogModule, {
		title = Form.titleText,
		subtitle = Form.subtitleText,
		onClose = if OnCloseFunction and not Form.confirmsClose then UseResult else nil,
		onCloseActivated = if Form.confirmsClose then OnCloseFunction else nil,
		hasBackdrop = Form.hasBackdrop,
		fitsContent = Form.fitsDialogToContent,
		isFocusable = not (Form.isBirthdayPickerOpen or Form.isCloseConfirmationOpen),
		children = {
			Content = ReactModule.createElement(View, {
				testId = "AccountUpgradeContent",
				tag = {
					["col size-full-0 auto-y"] = true,
					["padding-top-xsmall"] = Form.subtitleText ~= nil
				}
			}, {
				Body = ReactModule.createElement(View, {
					tag = "col gap-xlarge size-full-0 auto-y",
					LayoutOrder = 1,
					testId = "AccountUpgradeBody"
				}, {
					Fields = ReactModule.createElement(AccountUpgradeFieldsModule, { LayoutOrder = 1, form = Form }),
					Actions = ReactModule.createElement(View, {
						tag = "col gap-small size-full-0 auto-y",
						LayoutOrder = 2
					}, {
						Buttons = ReactModule.createElement(AccountUpgradeDialogActionsModule, {
							LayoutOrder = 1,
							buttons = {
								{
									text = Form.saveText,
									variant = if NoIsSubmitting then ButtonVariant.Standard else ButtonVariant.Emphasis,
									onActivated = Form.onSaveActivated,
									isDisabled = NoIsSubmitting,
									isLoading = Form.isSubmitting
								}
							}
						}),
						Error = ReactModule.createElement(AccountUpgradeFieldErrorModule, {
							LayoutOrder = 2,
							testId = "AccountUpgradeSubmitError",
							text = Form.submitError
						}),
						MarketingConsent = if Form.marketingConsentText == nil then nil else ReactModule.createElement(MarketingConsentCheckboxModule, {
							LayoutOrder = 3,
							text = Form.marketingConsentText,
							isChecked = Form.isMarketingConsentChecked == true,
							isDisabled = Form.isSubmitting or Form.isMarketingConsentDisabled == true,
							onToggled = Form.onMarketingConsentToggled or noop,
							size = InputSize.Medium
						}),
						LegalText = if Form.legalText then ReactModule.createElement(LegalTextWithLinks, {
							LayoutOrder = 4,
							testId = "AccountUpgradeLegalText",
							text = Form.legalText,
							onLinkActivated = Form.onLegalLinkActivated
						}) else nil
					})
				}),
				AuditContent = if Form.auditContent then createAuditContent(Form.auditContent) else nil
			}),
			BirthdayPicker = if HasFieldState then ReactModule.createElement(BirthdayPickerSheetModule, {
				isOpen = Form.isBirthdayPickerOpen,
				birthday = Form.birthday,
				onClose = Form.onBirthdayPickerClosed,
				onConfirm = Form.onBirthdayConfirmed,
				onAllPicked = if FFlagAccountUpgradeOAuthTelemetryModule then Form.onBirthdayPickerAllPicked else nil
			}) else nil,
			CloseConfirmation = if Form.isCloseConfirmationOpen and OnSignOut then ReactModule.createElement(CloseConfirmationDialogModule, {
				onBack = Form.onCloseConfirmationBack,
				onSignOut = OnSignOut
			}) else nil
		}
	})
end