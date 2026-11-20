local InGame = require(script:FindFirstAncestor("GameInvite").Parent.DataHydration).Presence.PresenceEnums.PresenceType.InGame

return function(p1): boolean
	-- upvalues: InGame (copy)
	if p1 == nil or p1.userPresenceType ~= InGame or p1.universeId == "" then
		return false
	else
		local Text = tostring(game.GameId)
		
		return Text ~= "" and (Text ~= "0" and p1.universeId == Text)
	end
end