local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 23 | named "RestoreVersionDialog" ]]
	-- upvalues: reactModule (ref), localizationStringsModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var4 = reactModule.useCallback(function() --[[ line: 24 ]]
		-- upvalues: p0 (ref)
		p0.onRestore()
	end, { p0.onRestore })
	local var5 = reactModule.useCallback(function() --[[ line: 27 ]]
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
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function() --[[ line: 31 ]]
			-- upvalues: localizationStringsModule (copy), buttonVariant (copy), var4 (ref), var5 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = localizationStringsModule.VERSION_HISTORY_RESTORE,
						variant = buttonVariant.Emphasis,
						onActivated = var4
					},
					{
						text = localizationStringsModule.VERSION_HISTORY_CANCEL,
						variant = buttonVariant.Standard,
						onActivated = var5
					}
				}
			}
		end, { var4, var5 }))
	})
end