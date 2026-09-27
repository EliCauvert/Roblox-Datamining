return function(p1)
	return if p1.isUniverseChat ~= true then p1.channelNameOverride == "RBXGlobal" else true
end