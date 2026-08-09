local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 23 | named "RestoreVersionDialog" ]]
	-- upvalues: reactModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local testId = p0.testId or "restore-version-dialog"
	local var3 = reactModule.useCallback(function() --[[ line: 25 ]]
		-- upvalues: p0 (ref)
		p0.onRestore()
	end, { p0.onRestore })
	local var4 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref)
		p0.onCancel()
	end, { p0.onCancel })
	
	return if p0.isOpen == false then nil else reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = dialogSize.Small,
		testId = testId
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p0.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, { Text = p0.description })
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function() --[[ line: 32 ]]
			-- upvalues: buttonVariant (copy), var3 (ref), var4 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = "Restore",
						variant = buttonVariant.Emphasis,
						onActivated = var3
					},
					{
						text = "Cancel",
						variant = buttonVariant.Standard,
						onActivated = var4
					}
				}
			}
		end, { var3, var4 }))
	})
end