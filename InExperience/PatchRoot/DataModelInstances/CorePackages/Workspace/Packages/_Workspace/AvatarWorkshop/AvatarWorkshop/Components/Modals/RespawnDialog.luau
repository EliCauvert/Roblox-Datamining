local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ButtonVariant (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		heading = "Feature.AvatarSwitcher.Heading.RespawnToSwitch",
		respawnLaterMessage = "Feature.AvatarSwitcher.Label.RespawnLater",
		respawnNotAllowedMessage = "Feature.AvatarSwitcher.Message.RespawnNotAllowed",
		respawn = "Feature.AvatarSwitcher.Action.Respawn",
		respawnLater = "Feature.AvatarSwitcher.Action.RespawnLater",
		ok = "Feature.AvatarSwitcher.Action.OK"
	})
	local HasSavingChoice = p1.savingChoice ~= nil
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = FoundationModule.Enums.DialogSize.Small,
		onClose = if HasSavingChoice then nil else p1.onClose
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.heading }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			DialogText = ReactModule.createElement(Dialog.Text, {
				Text = if p1.respawnEnabled then UseLocalizationResult.respawnLaterMessage else UseLocalizationResult.respawnNotAllowedMessage
			})
		}),
		DialogActions = ReactModule.createElement(FoundationModule.View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = 2,
			testId = "avatar-workshop-respawn-actions"
		}, {
			Buttons = ReactModule.createElement(FoundationModule.ButtonGroup, {
				buttons = if p1.respawnEnabled then {
					{
						testId = "avatar-workshop-respawn-button",
						text = UseLocalizationResult.respawn,
						variant = ButtonVariant.Emphasis,
						onActivated = p1.onRespawn,
						isLoading = p1.savingChoice == "Respawn",
						isDisabled = HasSavingChoice
					},
					{
						testId = "avatar-workshop-respawn-later-button",
						text = UseLocalizationResult.respawnLater,
						variant = ButtonVariant.Standard,
						onActivated = p1.onDefer,
						isLoading = p1.savingChoice == "Defer",
						isDisabled = HasSavingChoice
					}
				} else {
					{
						testId = "avatar-workshop-respawn-ok-button",
						text = UseLocalizationResult.ok,
						variant = ButtonVariant.Emphasis,
						onActivated = p1.onDefer,
						isLoading = HasSavingChoice
					}
				},
				orientation = FoundationModule.Enums.Orientation.Vertical,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fill
			})
		})
	})
end