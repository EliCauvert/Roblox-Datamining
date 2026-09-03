local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagEnableTeamTestLua (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var1 = useLocalization({
		cancel = localizationStringsModule.VERSION_HISTORY_CANCEL,
		revert = localizationStringsModule.CHAT_REVERT_CONFIRMATION_ACTION,
		restore = localizationStringsModule.VERSION_HISTORY_RESTORE
	})
	local cancel = var1.cancel
	local revert = var1.revert
	local restore = var1.restore
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.isLoading then
			return
		end
		p1.onRestore()
	end, { p1.isLoading, p1.onRestore })
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.isLoading then
			return
		end
		p1.onCancel()
	end, { p1.isLoading, p1.onCancel })
	
	return if p1.isOpen == false then nil else reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "restore-version-dialog",
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p1.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, { Text = p1.description })
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function()
			-- upvalues: fFlagEnableTeamTestLua (copy), revert (ref), restore (ref), buttonVariant (copy), p1 (ref), var2 (ref), cancel (ref), var3 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = if fFlagEnableTeamTestLua then revert else restore,
						variant = buttonVariant.Emphasis,
						isDisabled = p1.isLoading,
						isLoading = p1.isLoading,
						onActivated = var2
					},
					{
						text = cancel,
						variant = buttonVariant.Standard,
						isDisabled = p1.isLoading,
						onActivated = var3
					}
				}
			}
		end, {
			cancel, var2, var3, p1.isLoading, restore, revert
		}))
	})
end