local t = {
	new = function() --[[ line: 16 ]]
		return {}
	end
}

function t.fromGameCache(p0) --[[ line: 21 ]]
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.universeId = p0.UniverseId
	var1.placeId = p0.PlaceId
	var1.name = p0.Name
	var1.playerCount = p0.PlayerCount
	var1.imageToken = p0.ImageToken
	var1.totalUpVotes = p0.VoteData.UpVotes
	var1.totalDownVotes = p0.VoteData.DownVotes
	
	return var1
end

function t.fromJsonData(p1) --[[ line: 33 ]]
	-- upvalues: t (ref)
	local var2 = t.new()
	var2.universeId = p1.universeId
	var2.placeId = p1.placeId
	var2.name = p1.name
	var2.playerCount = p1.playerCount
	var2.imageToken = p1.imageToken
	var2.totalUpVotes = p1.totalUpVotes
	var2.totalDownVotes = p1.totalDownVotes
	
	return var2
end

return t