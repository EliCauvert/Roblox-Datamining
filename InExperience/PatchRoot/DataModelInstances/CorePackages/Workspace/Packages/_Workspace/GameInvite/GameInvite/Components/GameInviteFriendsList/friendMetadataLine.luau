local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local _ = require(Parent.UserList)
local UserModel = require(Parent.UserLib).Models.UserModel
local EscapeRichTextModule = require(GameInvite.utils.escapeRichText)
local PresenceType = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType

return {
	getContextText = function(p1, p2)
		-- upvalues: UserModel (copy), EscapeRichTextModule (copy)
		local LastLocation = p1.lastLocation
		
		return if p1.presence == UserModel.PresenceType.IN_STUDIO then p2.inStudio elseif p1.presence == UserModel.PresenceType.IN_GAME and LastLocation ~= nil and LastLocation ~= "" then EscapeRichTextModule(LastLocation) else nil
	end,
	getContextTextForPresence = function(InGame, p1, p2)
		-- upvalues: PresenceType (copy), EscapeRichTextModule (copy)
		return if InGame == PresenceType.InStudio then p2.inStudio elseif InGame == PresenceType.InGame and p1 ~= nil and p1 ~= "" then EscapeRichTextModule(p1) elseif InGame == PresenceType.Online then p2.online else nil
	end,
	getLivePresenceType = function(p1)
		-- upvalues: PresenceType (copy)
		return if p1.userPresenceType == PresenceType.InGame and p1.universeId == "" then PresenceType.Online else p1.userPresenceType
	end
}