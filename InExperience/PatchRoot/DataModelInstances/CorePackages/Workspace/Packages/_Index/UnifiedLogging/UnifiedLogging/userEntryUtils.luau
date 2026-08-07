return {
	extractFieldsFromUserEntry = function(p0) --[[ line: 7 ]]
		return if p0 then {
			presence = if p0.presence then p0.presence.userPresenceType else "",
			friendStatus = if p0.isFriend then "friend" else "notFriend",
			presenceUniverseId = if p0.presence and p0.presence.universeId and p0.presence.universeId ~= "" then p0.presence.universeId else "-1"
		} else {}
	end
}