local Parent = script:FindFirstAncestor("GameInvite").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.UserList)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserModel = require(Parent.UserLib).Models.UserModel
local GameInviteInviteButtonModule = require(script.Parent.GameInviteInviteButton)
local FriendMetadataLineModule = require(script.Parent.friendMetadataLine)
local config = {
	[UserModel.PresenceType.ONLINE] = "Online",
	[UserModel.PresenceType.IN_GAME] = "InGame",
	[UserModel.PresenceType.IN_STUDIO] = "InStudio",
	[UserModel.PresenceType.OFFLINE] = "Offline"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FriendMetadataLineModule (copy), ReactModule (copy), GameInviteInviteButtonModule (copy), config (copy)
	local Friend = p1.friend
	local Id = Friend.id
	local RowNumber = p1.rowNumber
	local ContextText = FriendMetadataLineModule.getContextText(Friend, (UseLocalizationFunction({ inStudio = "Common.Presence.Label.RobloxStudio" })))
	
	return p1.createRow({
		contextualInfo = ReactModule.useMemo(function()
			-- upvalues: ContextText (copy)
			return if ContextText == nil then nil else { text = ContextText }
		end, { ContextText }),
		presence = config[Friend.presence],
		trailingContent = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), GameInviteInviteButtonModule (upval), Id (copy), RowNumber (copy)
			return ReactModule.createElement(GameInviteInviteButtonModule, { userId = Id, rowNumber = RowNumber })
		end, { Id, RowNumber })
	})
end