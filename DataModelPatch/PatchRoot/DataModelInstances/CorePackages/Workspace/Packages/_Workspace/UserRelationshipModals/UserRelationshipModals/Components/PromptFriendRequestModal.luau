local Parent = script:FindFirstAncestor("UserRelationshipModals").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserTileModule = require(Parent.UserTile)
local UserTile = UserTileModule.UserTile
local LayoutMode = UserTileModule.LayoutMode
local PromptFriendRequestModalRevampFriendsRename = game:DefineFastFlag("PromptFriendRequestModalRevampFriendsRename", false)
local PromptFriendRequestModalRevampFriendsRename1 = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename and PromptFriendRequestModalRevampFriendsRename

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), PromptFriendRequestModalRevampFriendsRename1 (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), FoundationModule (copy), UserTile (copy), LayoutMode (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		sendText = "InGame.FriendPlayerPrompt.Action.Send",
		titleText = if PromptFriendRequestModalRevampFriendsRename1 then "InGame.FriendPlayerPrompt.Title.SendFriendRequest.FriendsRename" else "InGame.FriendPlayerPrompt.Title.SendFriendRequest"
	})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium, onClose = p1.onClose }, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.titleText }),
		Avatar = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-x-center size-full-3000",
			LayoutOrder = 2
		}, {
			UserTile = ReactModule.createElement(UserTile, {
				userId = p1.userId,
				title = p1.displayName,
				subtitle = "@" .. p1.username,
				layoutMode = LayoutMode.compact
			})
		}),
		Buffer = ReactModule.createElement(FoundationModule.View, { tag = "size-full-500", LayoutOrder = 3 }),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					text = UseLocalizationResult.sendText,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onSendClicked,
					inputDelay = if p1.inputDelay == nil then 3 else p1.inputDelay
				}
			}
		})
	})
end