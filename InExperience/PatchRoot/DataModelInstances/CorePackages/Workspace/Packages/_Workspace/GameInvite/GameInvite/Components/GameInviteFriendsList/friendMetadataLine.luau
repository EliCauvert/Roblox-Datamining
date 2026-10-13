local gameInvite = script:FindFirstAncestor("GameInvite")
local userModel = require(gameInvite.Parent.UserLib).Models.UserModel
local escapeRichTextModule = require(gameInvite.utils.escapeRichText)

return {
	getContextText = function(p1, p2)
		-- upvalues: userModel (ref), escapeRichTextModule (ref)
		local lastLocation = p1.lastLocation
		
		return if p1.presence == userModel.PresenceType.IN_STUDIO then p2.inStudio elseif p1.presence == userModel.PresenceType.IN_GAME and lastLocation ~= nil and lastLocation ~= "" then escapeRichTextModule(lastLocation) else nil
	end
}