local UserList = script:FindFirstAncestor("UserList")
local FoundationModule = require(UserList.Parent.Foundation)
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local IconName = FoundationModule.Enums.IconName
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonTypes = EnumsModule.ButtonTypes
local ClientCtaActions = EnumsModule.ClientCtaActions

return {
	[ClientCtaActions.ViewProfile] = {
		buttonType = ButtonTypes.View,
		handlerKey = ButtonTypes.View,
		variant = ButtonVariant.Standard
	},
	[ClientCtaActions.RequestFriendship] = {
		buttonType = ButtonTypes.Add,
		handlerKey = ButtonTypes.Add
	},
	[ClientCtaActions.AcceptFriendRequest] = {
		buttonType = ButtonTypes.Accept,
		handlerKey = ButtonTypes.Accept
	},
	[ClientCtaActions.DeclineFriendRequest] = {
		buttonType = ButtonTypes.Dismiss,
		handlerKey = ButtonTypes.Dismiss,
		icon = IconName.X
	},
	[ClientCtaActions.PendingFriendRequest] = { isDisabled = true, buttonType = ButtonTypes.Pending }
}