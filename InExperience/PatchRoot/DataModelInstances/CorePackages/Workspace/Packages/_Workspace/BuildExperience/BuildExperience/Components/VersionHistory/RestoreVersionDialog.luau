local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FFlagEnableTeamTestLua = require(Parent.SharedFlags).FFlagEnableTeamTestLua

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), FFlagEnableTeamTestLua (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = LocalizationStringsModule.VERSION_HISTORY_CANCEL,
		revert = LocalizationStringsModule.CHAT_REVERT_CONFIRMATION_ACTION,
		restore = LocalizationStringsModule.VERSION_HISTORY_RESTORE
	})
	local Cancel = UseLocalizationResult.cancel
	local Revert = UseLocalizationResult.revert
	local Restore = UseLocalizationResult.restore
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if not p1.isLoading then
			p1.onRestore()
			
			return
		end
	end, { p1.isLoading, p1.onRestore })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if not p1.isLoading then
			p1.onCancel()
			
			return
		end
	end, { p1.isLoading, p1.onCancel })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagEnableTeamTestLua (upval), Revert (copy), Restore (copy), ButtonVariant (upval), p1 (copy), UseResult (copy), Cancel (copy), UseResult1 (copy)
		return {
			LayoutOrder = 3,
			actions = {
				{
					text = if FFlagEnableTeamTestLua then Revert else Restore,
					variant = ButtonVariant.Emphasis,
					isDisabled = p1.isLoading,
					isLoading = p1.isLoading,
					onActivated = UseResult
				},
				{
					text = Cancel,
					variant = ButtonVariant.Standard,
					isDisabled = p1.isLoading,
					onActivated = UseResult1
				}
			}
		}
	end, {
		Cancel, UseResult, UseResult1, p1.isLoading, Restore, Revert
	})
	
	return if p1.isOpen == false then nil else ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "restore-version-dialog",
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = p1.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Description = ReactModule.createElement(Dialog.Text, { Text = p1.description })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, UseMemoResult)
	})
end