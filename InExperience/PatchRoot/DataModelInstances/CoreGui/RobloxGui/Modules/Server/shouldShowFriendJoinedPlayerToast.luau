return function(Player: Player): boolean --[[ Line: 1 ]]
	local JoinData = Player:GetJoinData()
	local Number = JoinData and tonumber(JoinData.ReferredByPlayerId)
	
	return Number == nil or Number == 0
end