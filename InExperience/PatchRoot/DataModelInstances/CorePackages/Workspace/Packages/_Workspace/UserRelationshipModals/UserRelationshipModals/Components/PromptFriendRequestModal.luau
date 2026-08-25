local parent = script:FindFirstAncestor("UserRelationshipModals").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userTileModule = require(parent.UserTile)
local userTile = userTileModule.UserTile
local layoutMode = userTileModule.LayoutMode
local promptFriendRequestModalRevampFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename and game:DefineFastFlag("PromptFriendRequestModalRevampFriendsRename", false)
local promptFriendRequestModalInputDelayMs = game:DefineFastInt("PromptFriendRequestModalInputDelayMs", 1000)

return function(p0)
	-- upvalues: useLocalization (ref), promptFriendRequestModalRevampFriendsRename (ref), reactModule (ref), dialog (ref), dialogSize (ref), foundationModule (ref), userTile (ref), layoutMode (ref), buttonVariant (ref), promptFriendRequestModalInputDelayMs (ref)
	local var5 = useLocalization({
		sendText = "InGame.FriendPlayerPrompt.Action.Send",
		titleText = if promptFriendRequestModalRevampFriendsRename then "InGame.FriendPlayerPrompt.Title.SendFriendRequest.FriendsRename" else "InGame.FriendPlayerPrompt.Title.SendFriendRequest"
	})
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Medium, onClose = p0.onClose }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var5.titleText }),
		Avatar = reactModule.createElement(foundationModule.View, {
			tag = "row align-x-center size-full-3000",
			LayoutOrder = 2
		}, {
			UserTile = reactModule.createElement(userTile, {
				userId = p0.userId,
				title = p0.displayName,
				subtitle = "@" .. p0.username,
				layoutMode = layoutMode.compact
			})
		}),
		Buffer = reactModule.createElement(foundationModule.View, { tag = "size-full-500", LayoutOrder = 3 }),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					text = var5.sendText,
					variant = buttonVariant.Emphasis,
					onActivated = p0.onSendClicked,
					inputDelay = if p0.inputDelay == nil then promptFriendRequestModalInputDelayMs / 1000 else p0.inputDelay
				}
			}
		})
	})
end