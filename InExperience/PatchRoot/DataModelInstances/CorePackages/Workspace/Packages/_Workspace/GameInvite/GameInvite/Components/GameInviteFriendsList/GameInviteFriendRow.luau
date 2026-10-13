local parent = script:FindFirstAncestor("GameInvite").Parent
local reactModule = require(parent.React)
local _ = require(parent.UserList)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userModel = require(parent.UserLib).Models.UserModel
local gameInviteInviteButtonModule = require(script.Parent.GameInviteInviteButton)
local friendMetadataLineModule = require(script.Parent.friendMetadataLine)
local t = {
	[userModel.PresenceType.ONLINE] = "Online",
	[userModel.PresenceType.IN_GAME] = "InGame",
	[userModel.PresenceType.IN_STUDIO] = "InStudio",
	[userModel.PresenceType.OFFLINE] = "Offline"
}

return function(p1)
	-- upvalues: useLocalization (ref), friendMetadataLineModule (ref), reactModule (ref), gameInviteInviteButtonModule (ref), t (ref)
	local friend = p1.friend
	local id = friend.id
	local rowNumber = p1.rowNumber
	local contextText = friendMetadataLineModule.getContextText(friend, useLocalization({ inStudio = "Common.Presence.Label.RobloxStudio" }))
	
	return p1.createRow({
		contextualInfo = reactModule.useMemo(function()
			-- upvalues: contextText (ref)
			return if contextText == nil then nil else { text = contextText }
		end, { contextText }),
		presence = t[friend.presence],
		trailingContent = reactModule.useMemo(function()
			-- upvalues: reactModule (copy), gameInviteInviteButtonModule (copy), id (ref), rowNumber (ref)
			return reactModule.createElement(gameInviteInviteButtonModule, { userId = id, rowNumber = rowNumber })
		end, { id, rowNumber })
	})
end