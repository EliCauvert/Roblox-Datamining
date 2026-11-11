local Parent = script:FindFirstAncestor("TrustedContacts").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FFlagTCShareLinkErrorModalTextRename = require(Parent.SharedFlags).FFlagTCShareLinkErrorModalTextRename

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagTCShareLinkErrorModalTextRename (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local Navigation = p1.navigation
	local ExtraPropsParam = Navigation.getParam("extraProps")
	local UseLocalizationResult = UseLocalizationFunction({
		expiredTitle = "Feature.Friends.Title.TrustedFriendsExpiredLink",
		invalidTitle = "Feature.Friends.Title.TrustedFriendsInvalidLink",
		invalidDescription = "Feature.Friends.Description.TrustedFriendsInvalidLink",
		ok = "CommonUI.Controls.Action.OK",
		expiredDescription = if FFlagTCShareLinkErrorModalTextRename then "Feature.Friends.Description.TrustedFriendsExpiredLink" else "Feature.Friends.Description.TrustedConnectionExpiredLink"
	})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium }, {
		Title = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = if ExtraPropsParam.errorType == "Expired" then UseLocalizationResult.expiredTitle else UseLocalizationResult.invalidTitle
		}),
		BodyText = ReactModule.createElement(Dialog.Text, {
			LayoutOrder = 2,
			Text = if ExtraPropsParam.errorType == "Expired" then UseLocalizationResult.expiredDescription else UseLocalizationResult.invalidDescription
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.ok,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: Navigation (copy), ExtraPropsParam (copy)
						Navigation.pop()
						ExtraPropsParam.closeModal()
					end, { Navigation, ExtraPropsParam.closeModal })
				}
			}
		})
	})
end