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
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua

return function(p0)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), fFlagEnableTeamTestLua (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local VERSION_HISTORY_CANCEL, CHAT_REVERT_CONFIRMATION_ACTION, VERSION_HISTORY_RESTORE
	local var5 = if fFlagBuildLocalization then useLocalization({
		cancel = localizationStringsModule.VERSION_HISTORY_CANCEL,
		revert = localizationStringsModule.CHAT_REVERT_CONFIRMATION_ACTION,
		restore = localizationStringsModule.VERSION_HISTORY_RESTORE
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_CANCEL = var5.cancel
		CHAT_REVERT_CONFIRMATION_ACTION = var5.revert
		VERSION_HISTORY_RESTORE = var5.restore
	else
		VERSION_HISTORY_CANCEL = localizationStringsModule.VERSION_HISTORY_CANCEL
		CHAT_REVERT_CONFIRMATION_ACTION = localizationStringsModule.CHAT_REVERT_CONFIRMATION_ACTION
		VERSION_HISTORY_RESTORE = localizationStringsModule.VERSION_HISTORY_RESTORE
	end
	local var6 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		p0.onRestore()
	end, { p0.onRestore })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		p0.onCancel()
	end, { p0.onCancel })
	
	return if p0.isOpen == false then nil else reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "restore-version-dialog",
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p0.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, { Text = p0.description })
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function()
			-- upvalues: fFlagEnableTeamTestLua (copy), CHAT_REVERT_CONFIRMATION_ACTION (write), VERSION_HISTORY_RESTORE (write), buttonVariant (copy), var6 (ref), VERSION_HISTORY_CANCEL (write), var7 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = if fFlagEnableTeamTestLua then CHAT_REVERT_CONFIRMATION_ACTION else VERSION_HISTORY_RESTORE,
						variant = buttonVariant.Emphasis,
						onActivated = var6
					},
					{
						text = VERSION_HISTORY_CANCEL,
						variant = buttonVariant.Standard,
						onActivated = var7
					}
				}
			}
		end, {
			VERSION_HISTORY_CANCEL,
			var6,
			var7,
			VERSION_HISTORY_RESTORE,
			CHAT_REVERT_CONFIRMATION_ACTION
		}))
	})
end