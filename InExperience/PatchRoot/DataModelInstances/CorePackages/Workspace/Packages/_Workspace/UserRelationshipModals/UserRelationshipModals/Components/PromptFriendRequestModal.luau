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

return function(p1)
	-- upvalues: useLocalization (ref), promptFriendRequestModalRevampFriendsRename (ref), reactModule (ref), dialog (ref), dialogSize (ref), foundationModule (ref), userTile (ref), layoutMode (ref), buttonVariant (ref), promptFriendRequestModalInputDelayMs (ref)
	local var1 = useLocalization({
		sendText = "InGame.FriendPlayerPrompt.Action.Send",
		titleText = if promptFriendRequestModalRevampFriendsRename then "InGame.FriendPlayerPrompt.Title.SendFriendRequest.FriendsRename" else "InGame.FriendPlayerPrompt.Title.SendFriendRequest"
	})
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Medium, onClose = p1.onClose }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var1.titleText }),
		Avatar = reactModule.createElement(foundationModule.View, {
			tag = "row align-x-center size-full-3000",
			LayoutOrder = 2
		}, {
			UserTile = reactModule.createElement(userTile, {
				userId = p1.userId,
				title = p1.displayName,
				subtitle = "@" .. p0.username,
				layoutMode = layoutMode.compact
			})
		}),
		Buffer = reactModule.createElement(foundationModule.View, { tag = "size-full-500", LayoutOrder = 3 }),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 4,
			actions = {
				{
					text = var1.sendText,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onSendClicked,
					inputDelay = if p1.inputDelay == nil then promptFriendRequestModalInputDelayMs / 1000 else p1.inputDelay
				}
			}
		})
	})
end