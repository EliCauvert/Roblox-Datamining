local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua

return function(p0) --[[ line: 25 | named "RestoreVersionDialog" ]]
	-- upvalues: reactModule (ref), fFlagEnableTeamTestLua (ref), localizationStringsModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var5 = reactModule.useCallback(function() --[[ line: 26 ]]
		-- upvalues: p0 (ref)
		p0.onRestore()
	end, { p0.onRestore })
	local var6 = reactModule.useCallback(function() --[[ line: 29 ]]
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
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function() --[[ line: 33 ]]
			-- upvalues: fFlagEnableTeamTestLua (copy), localizationStringsModule (copy), buttonVariant (copy), var5 (ref), var6 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = if fFlagEnableTeamTestLua then localizationStringsModule.CHAT_REVERT_CONFIRMATION_ACTION else localizationStringsModule.VERSION_HISTORY_RESTORE,
						variant = buttonVariant.Emphasis,
						onActivated = var5
					},
					{
						text = localizationStringsModule.VERSION_HISTORY_CANCEL,
						variant = buttonVariant.Standard,
						onActivated = var6
					}
				}
			}
		end, { var5, var6 }))
	})
end