local GameInvite = script:FindFirstAncestor("GameInvite")
local UserModel = require(GameInvite.Parent.UserLib).Models.UserModel
local EscapeRichTextModule = require(GameInvite.utils.escapeRichText)

return {
	getContextText = function(p1, p2) --[[ Line: 17 ]]
		-- upvalues: UserModel (copy), EscapeRichTextModule (copy)
		local LastLocation = p1.lastLocation
		
		return if p1.presence == UserModel.PresenceType.IN_STUDIO then p2.inStudio elseif p1.presence == UserModel.PresenceType.IN_GAME and LastLocation ~= nil and LastLocation ~= "" then EscapeRichTextModule(LastLocation) else nil
	end
}