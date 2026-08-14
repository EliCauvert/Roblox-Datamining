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

return function(p0) --[[ line: 30 | named "ArchiveGameDialog" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var5 = if fFlagBuildLocalization then useLocalization({
		archiveGame = localizationStringsModule.ARCHIVE_GAME_ARCHIVE,
		cancel = localizationStringsModule.ARCHIVE_GAME_CANCEL,
		description = localizationStringsModule.ARCHIVE_GAME_DESCRIPTION,
		title = localizationStringsModule.ARCHIVE_GAME_TITLE
	}) else nil
	local testId = p0.testId or "archive-game-dialog"
	local var7 = reactModule.useCallback(function() --[[ line: 40 ]]
		-- upvalues: p0 (ref)
		p0.onArchive()
	end, { p0.onArchive })
	local var8 = reactModule.useCallback(function() --[[ line: 43 ]]
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
			text = p0.title or (if fFlagBuildLocalization then var5.title else localizationStringsModule.ARCHIVE_GAME_TITLE)
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, {
				Text = p0.description or (if fFlagBuildLocalization then var5.description else localizationStringsModule.ARCHIVE_GAME_DESCRIPTION)
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function() --[[ line: 47 ]]
			-- upvalues: fFlagBuildLocalization (copy), var5 (ref), localizationStringsModule (copy), buttonVariant (copy), var7 (ref), var8 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = if fFlagBuildLocalization then var5.archiveGame else localizationStringsModule.ARCHIVE_GAME_ARCHIVE,
						variant = buttonVariant.Standard,
						onActivated = var7
					},
					{
						text = if fFlagBuildLocalization then var5.cancel else localizationStringsModule.ARCHIVE_GAME_CANCEL,
						variant = buttonVariant.Standard,
						onActivated = var8
					}
				}
			}
		end, { var7, var8 }))
	})
end