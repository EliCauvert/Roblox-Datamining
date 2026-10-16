local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AuthSignupModule = require(Parent.AuthSignup)
local UseRequireManualSelectionModule = require(AccountUpgrade.Hooks.useRequireManualSelection)
local FFlagAccountUpgradeOAuthTelemetryModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local AccountUpgradeDialogModule = require(AccountUpgrade.SuccessModal.AccountUpgradeDialog)
local AccountUpgradeDialogActionsModule = require(AccountUpgrade.SuccessModal.AccountUpgradeDialogActions)
local BirthdayPicker = AuthSignupModule.Components.BirthdayPicker
local UseValidatedBirthdayFunction = AuthSignupModule.Hooks.useValidatedBirthday
local FIntSinglePageSignupMinimumAge = require(Parent.SharedFlags).FIntSinglePageSignupMinimumAge
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant

local function BirthdayPickerDialog(p1) --[[ Line: 46 ]]
	-- upvalues: UseValidatedBirthdayFunction (copy), FIntSinglePageSignupMinimumAge (copy), UseRequireManualSelectionModule (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), ReactModule (copy), UseLocalizationFunction (copy), AccountUpgradeDialogModule (copy), BirthdayPicker (copy), AccountUpgradeDialogActionsModule (copy), ButtonVariant (copy)
	local UseValidatedBirthdayResult, UseValidatedBirthdayResult2 = UseValidatedBirthdayFunction(FIntSinglePageSignupMinimumAge)
	local UseRequireManualSelectionModuleResult = UseRequireManualSelectionModule()
	local OnAllPickedFunction = p1.onAllPicked
	local UseRefResult = if FFlagAccountUpgradeOAuthTelemetryModule then ReactModule.useRef(false) else nil
	local OnConfirmFunction = p1.onConfirm
	local UseResult = ReactModule.useCallback(function() --[[ Line: 69 ]]
		-- upvalues: UseValidatedBirthdayResult (copy), OnConfirmFunction (copy)
		if UseValidatedBirthdayResult ~= nil then
			OnConfirmFunction(UseValidatedBirthdayResult)
		end
	end, { UseValidatedBirthdayResult, OnConfirmFunction })
	local OnCloseFunction = p1.onClose
	local UseResult1 = ReactModule.useCallback(function(_) --[[ Line: 78 ]]
		-- upvalues: OnCloseFunction (copy)
		OnCloseFunction()
	end, { OnCloseFunction })
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Authentication.SignUp.Label.SelectBirthdaySentenceCase",
		confirmText = "Authentication.SignUp.Button.OKCaptialized"
	})
	local Birthday = p1.birthday
	
	return ReactModule.createElement(AccountUpgradeDialogModule, {
		hasBackdrop = true,
		testId = "account-upgrade-birthday-dialog",
		title = UseLocalizationResult.titleText,
		onClose = UseResult1,
		children = {
			Picker = ReactModule.createElement(BirthdayPicker, {
				layoutOrder = 1,
				minAgeAllowed = FIntSinglePageSignupMinimumAge,
				requireManualSelection = UseRequireManualSelectionModuleResult,
				updateBirthday = (if FFlagAccountUpgradeOAuthTelemetryModule then ReactModule.useCallback(function(p2, p3, p4) --[[ Line: 59 ]]
					-- upvalues: UseValidatedBirthdayResult2 (copy), OnAllPickedFunction (copy), UseRefResult (copy)
					UseValidatedBirthdayResult2(p2, p3, p4)
					
					if OnAllPickedFunction and UseRefResult and not UseRefResult.current and p2 and p3 and p4 then
						UseRefResult.current = true
						OnAllPickedFunction()
					end
				end, {
					UseValidatedBirthdayResult2,
					OnAllPickedFunction,
					UseRefResult
				}) else nil) or UseValidatedBirthdayResult2,
				initialMonth = if Birthday then Birthday.Month else nil,
				initialDay = if Birthday then Birthday.Day else nil,
				initialYear = if Birthday then Birthday.Year else nil
			})
		},
		actions = ReactModule.createElement(AccountUpgradeDialogActionsModule, {
			LayoutOrder = 3,
			testId = "account-upgrade-birthday-dialog-actions",
			buttons = {
				{
					text = UseLocalizationResult.confirmText,
					variant = ButtonVariant.Emphasis,
					onActivated = UseResult,
					isDisabled = UseValidatedBirthdayResult == nil
				}
			}
		})
	})
end

return function(p1) --[[ Line: 131 | Named "BirthdayPickerSheet" ]]
	-- upvalues: ReactModule (copy), BirthdayPickerDialog (copy)
	return if p1.isOpen then ReactModule.createElement(BirthdayPickerDialog, p1) else nil
end