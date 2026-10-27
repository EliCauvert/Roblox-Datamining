local Parent = script:FindFirstAncestor("TrustedContacts").Parent
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FFlagTCShareLinkErrorModalTextRename = require(Parent.SharedFlags).FFlagTCShareLinkErrorModalTextRename
local FFlagTCShareLinkWrongRecipient = require(Parent.SharedFlags).FFlagTCShareLinkWrongRecipient

return function(p1)
	-- upvalues: FFlagTCShareLinkWrongRecipient (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), FFlagTCShareLinkErrorModalTextRename (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local Navigation = p1.navigation
	local ExtraPropsParam = Navigation.getParam("extraProps")
	local UsernameFromId = nil
	
	if FFlagTCShareLinkWrongRecipient then
		local RecipientUserId = ExtraPropsParam.recipientUserId
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = if RecipientUserId then { RecipientUserId } else {},
			query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
		})
		UsernameFromId = if RecipientUserId and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, RecipientUserId) else nil
	end
	local UseLocalizationResult = UseLocalizationFunction({
		expiredTitle = "Feature.Friends.Title.TrustedFriendsExpiredLink",
		invalidTitle = "Feature.Friends.Title.TrustedFriendsInvalidLink",
		invalidDescription = "Feature.Friends.Description.TrustedFriendsInvalidLink",
		ok = "CommonUI.Controls.Action.OK",
		expiredDescription = if FFlagTCShareLinkErrorModalTextRename then "Feature.Friends.Description.TrustedFriendsExpiredLink" else "Feature.Friends.Description.TrustedConnectionExpiredLink",
		wrongRecipientDescription = if UsernameFromId then {
			"Feature.Friends.Description.TrustedFriendsWrongAccount",
			username = UsernameFromId
		} else nil
	})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium }, {
		Title = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = if ExtraPropsParam.errorType == "Expired" then UseLocalizationResult.expiredTitle else UseLocalizationResult.invalidTitle
		}),
		BodyText = ReactModule.createElement(Dialog.Text, {
			LayoutOrder = 2,
			Text = if ExtraPropsParam.errorType == "Expired" then UseLocalizationResult.expiredDescription elseif FFlagTCShareLinkWrongRecipient and UsernameFromId then UseLocalizationResult.wrongRecipientDescription else UseLocalizationResult.invalidDescription
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