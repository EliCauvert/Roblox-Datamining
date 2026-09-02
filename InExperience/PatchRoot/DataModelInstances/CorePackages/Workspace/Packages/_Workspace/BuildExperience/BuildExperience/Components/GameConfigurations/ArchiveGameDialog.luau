local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var1 = if fFlagBuildLocalization then useLocalization({
		archiveGame = localizationStringsModule.ARCHIVE_GAME_ARCHIVE,
		cancel = localizationStringsModule.ARCHIVE_GAME_CANCEL,
		description = localizationStringsModule.ARCHIVE_GAME_DESCRIPTION,
		title = localizationStringsModule.ARCHIVE_GAME_TITLE
	}) else nil
	local testId = p1.testId or "archive-game-dialog"
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onArchive()
	end, { p1.onArchive })
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onCancel()
	end, { p1.onCancel })
	
	return if p1.isOpen == false then nil else reactModule.createElement(dialog.Root, {
		disablePortal = p1.disablePortal == true,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
		size = dialogSize.Small,
		testId = testId
	}, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = p1.title or (if fFlagBuildLocalization then var1.title else localizationStringsModule.ARCHIVE_GAME_TITLE)
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, {
				Text = p1.description or (if fFlagBuildLocalization then var1.description else localizationStringsModule.ARCHIVE_GAME_DESCRIPTION)
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function()
			-- upvalues: fFlagBuildLocalization (copy), var1 (ref), localizationStringsModule (copy), buttonVariant (copy), var2 (ref), var3 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = if fFlagBuildLocalization then var1.archiveGame else localizationStringsModule.ARCHIVE_GAME_ARCHIVE,
						variant = buttonVariant.Standard,
						onActivated = var2
					},
					{
						text = if fFlagBuildLocalization then var1.cancel else localizationStringsModule.ARCHIVE_GAME_CANCEL,
						variant = buttonVariant.Standard,
						onActivated = var3
					}
				}
			}
		end, { var2, var3 }))
	})
end