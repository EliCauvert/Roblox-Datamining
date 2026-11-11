local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ConstantsModule = require(PeopleReactView.Constants)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local Default = require(Parent.ExperienceService).GameProtocol.default

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), LaunchGameFunction (copy), Default (copy), Dialog (copy), DialogSize (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = ConstantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.TITLE,
		body = ConstantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.BODY,
		confirm = ConstantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.CONFIRM,
		cancel = ConstantsModule.PEOPLEPAGE.SWITCH_SERVER_CONFIRMATION.CANCEL
	})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = DialogSize.Small,
		onClose = p1.onClose
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.confirm,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: p1 (copy), LaunchGameFunction (upval), ConstantsModule (upval), Default (upval)
						p1.onClose()
						LaunchGameFunction(tostring(game.PlaceId), ConstantsModule.PEOPLEPAGE.PAGE_ID, { gameIdToExclude = tostring(game.JobId) }, Default, ConstantsModule.PEOPLEPAGE.SOURCE)
					end, { p1.onClose, game.PlaceId, game.JobId })
				},
				{
					text = UseLocalizationResult.cancel,
					variant = ButtonVariant.Standard,
					onActivated = p1.onClose
				}
			}
		})
	})
end)