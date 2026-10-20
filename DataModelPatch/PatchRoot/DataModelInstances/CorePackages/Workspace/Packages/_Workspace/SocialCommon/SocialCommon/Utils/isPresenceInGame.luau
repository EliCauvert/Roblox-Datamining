return function(p1): boolean
	return if p1 then p1.userPresenceType == "InGame" and (p1.universeId ~= nil and p1.universeId ~= "") else false
end