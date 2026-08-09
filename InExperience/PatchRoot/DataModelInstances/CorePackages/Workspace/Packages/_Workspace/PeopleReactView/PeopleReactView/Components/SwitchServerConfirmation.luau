local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local constantsModule = require(peopleReactView.Constants)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local useLocalization = localizationModule.Hooks.useLocalization
local launchGame = require(parent.GameLaunch).LaunchGame
local default = require(parent.ExperienceService).GameProtocol.default

return reactModule.memo(function(p0) --[[ line: 26 | named "SwitchServerConfirmation" ]]
	-- upvalues: useLocalization (ref), constantsModule (ref), reactModule (ref), launchGame (ref), default (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var5 = useLocalization({
		title = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.TITLE,
		body = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.BODY,
		confirm = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.CONFIRM,
		cancel = constantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.CANCEL
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = dialogSize.Small,
		onClose = p0.onClose
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var5.title }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var5.body })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					text = var5.confirm,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 34 ]]
						-- upvalues: p0 (ref), launchGame (copy), constantsModule (copy), default (copy)
						p0.onClose()
						launchGame(tostring(game.PlaceId), constantsModule.PEOPLEPAGE.PAGE_ID, { gameIdToExclude = tostring(game.JobId) }, default, constantsModule.PEOPLEPAGE.SOURCE)
					end, { p0.onClose, game.PlaceId, game.JobId })
				},
				{
					text = var5.cancel,
					variant = buttonVariant.Standard,
					onActivated = p0.onClose
				}
			}
		})
	})
end)