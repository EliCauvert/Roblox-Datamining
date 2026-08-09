local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 29 | named "ArchiveGameDialog" ]]
	-- upvalues: reactModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local testId = p0.testId or "archive-game-dialog"
	local var3 = reactModule.useCallback(function() --[[ line: 31 ]]
		-- upvalues: p0 (ref)
		p0.onArchive()
	end, { p0.onArchive })
	local var4 = reactModule.useCallback(function() --[[ line: 34 ]]
		-- upvalues: p0 (ref)
		p0.onCancel()
	end, { p0.onCancel })
	
	return if p0.isOpen == false then nil else reactModule.createElement(dialog.Root, {
		disablePortal = p0.disablePortal == true,
		hasBackdrop = p0.hasBackdrop == nil or p0.hasBackdrop,
		size = dialogSize.Small,
		testId = testId
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = p0.title or "Archive Game" }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, {
				Text = p0.description or "Archiving your game will remove it from Build. You can access and restore your archived games from Creator Hub or Roblox Studio."
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function() --[[ line: 38 ]]
			-- upvalues: buttonVariant (copy), var3 (ref), var4 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = "Archive",
						variant = buttonVariant.Alert,
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