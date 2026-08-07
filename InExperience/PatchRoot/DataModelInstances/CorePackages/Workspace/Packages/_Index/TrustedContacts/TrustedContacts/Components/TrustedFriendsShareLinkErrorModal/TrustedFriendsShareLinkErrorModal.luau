local parent = script:FindFirstAncestor("TrustedContacts").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local fFlagTCShareLinkErrorModalTextRename = require(parent.SharedFlags).FFlagTCShareLinkErrorModalTextRename

return function(p0) --[[ line: 24 | named "TrustedFriendsShareLinkErrorModal" ]]
	-- upvalues: useLocalization (ref), fFlagTCShareLinkErrorModalTextRename (ref), reactModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local navigation = p0.navigation
	local extraProps = navigation.getParam("extraProps")
	local var3 = useLocalization({
		expiredTitle = "Feature.Friends.Title.TrustedFriendsExpiredLink",
		invalidTitle = "Feature.Friends.Title.TrustedFriendsInvalidLink",
		invalidDescription = "Feature.Friends.Description.TrustedFriendsInvalidLink",
		ok = "CommonUI.Controls.Action.OK",
		expiredDescription = if fFlagTCShareLinkErrorModalTextRename then "Feature.Friends.Description.TrustedFriendsExpiredLink" else "Feature.Friends.Description.TrustedConnectionExpiredLink"
	})
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Medium }, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = if extraProps.errorType == "Expired" then var3.expiredTitle else var3.invalidTitle
		}),
		BodyText = reactModule.createElement(dialog.Text, {
			LayoutOrder = 2,
			Text = if extraProps.errorType == "Expired" then var3.expiredDescription else var3.invalidDescription
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var3.ok,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 38 ]]
						-- upvalues: navigation (ref), extraProps (ref)
						navigation.pop()
						extraProps.closeModal()
					end, { navigation, extraProps.closeModal })
				}
			}
		})
	})
end