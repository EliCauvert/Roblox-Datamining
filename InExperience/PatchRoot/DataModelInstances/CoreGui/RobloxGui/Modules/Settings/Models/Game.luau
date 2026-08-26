local t = {
	new = function()
		return {}
	end
}

function t.fromGameCache(p1)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.universeId = p1.UniverseId
	var1.placeId = p1.PlaceId
	var1.name = p1.Name
	var1.playerCount = p1.PlayerCount
	var1.imageToken = p1.ImageToken
	var1.totalUpVotes = p1.VoteData.UpVotes
	var1.totalDownVotes = p1.VoteData.DownVotes
	
	return var1
end

function t.fromJsonData(p1)
	-- upvalues: t (ref)
	local var1 = t.new()
	var1.universeId = p1.universeId
	var1.placeId = p1.placeId
	var1.name = p1.name
	var1.playerCount = p1.playerCount
	var1.imageToken = p1.imageToken
	var1.totalUpVotes = p1.totalUpVotes
	var1.totalDownVotes = p1.totalDownVotes
	
	return var1
end

return t