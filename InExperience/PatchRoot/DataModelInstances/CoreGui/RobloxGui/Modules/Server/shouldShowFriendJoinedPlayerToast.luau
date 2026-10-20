return function(Player: Player): boolean
	local JoinData = Player:GetJoinData()
	local Number = JoinData and tonumber(JoinData.ReferredByPlayerId)
	
	return Number == nil or Number == 0
end