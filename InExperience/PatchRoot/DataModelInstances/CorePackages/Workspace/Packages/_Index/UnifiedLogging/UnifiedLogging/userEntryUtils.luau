return {
	extractFieldsFromUserEntry = function(p1)
		return if p1 then {
			presence = if p1.presence then p1.presence.userPresenceType else "",
			friendStatus = if p1.isFriend then "friend" else "notFriend",
			presenceUniverseId = if p1.presence and p1.presence.universeId and p1.presence.universeId ~= "" then p1.presence.universeId else "-1"
		} else {}
	end
}