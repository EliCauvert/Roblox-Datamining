return function(p0) --[[ line: 8 ]]
	return if p0 then p0.userPresenceType == "InGame" and (p0.universeId ~= nil and p0.universeId ~= "") else false
end