local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 26 | named "ArchiveGameDialog" ]]
	-- upvalues: reactModule (ref), localizationStringsModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local testId = p0.testId or "archive-game-dialog"
	local var5 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref)
		p0.onArchive()
	end, { p0.onArchive })
	local var6 = reactModule.useCallback(function() --[[ line: 31 ]]
		-- upvalues: p0 (ref)
		p0.onCancel()
	end, { p0.onCancel })
	
	return if p0.isOpen == false then nil else reactModule.createElement(dialog.Root, {
		disablePortal = p0.disablePortal == true,
		hasBackdrop = p0.hasBackdrop == nil or p0.hasBackdrop,
		size = dialogSize.Small,
		testId = testId
	}, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = p0.title or localizationStringsModule.ARCHIVE_GAME_TITLE
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, {
				Text = p0.description or localizationStringsModule.ARCHIVE_GAME_DESCRIPTION
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function() --[[ line: 35 ]]
			-- upvalues: localizationStringsModule (copy), buttonVariant (copy), var5 (ref), var6 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = localizationStringsModule.ARCHIVE_GAME_ARCHIVE,
						variant = buttonVariant.Standard,
						onActivated = var5
					},
					{
						text = localizationStringsModule.ARCHIVE_GAME_CANCEL,
						variant = buttonVariant.Standard,
						onActivated = var6
					}
				}
			}
		end, { var5, var6 }))
	})
end