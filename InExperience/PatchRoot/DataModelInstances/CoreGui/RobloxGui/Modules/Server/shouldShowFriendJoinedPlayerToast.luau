return function(p1)
	local joinData = p1:GetJoinData()
	local referredByPlayerId = joinData and tonumber(joinData.ReferredByPlayerId)
	
	return if referredByPlayerId ~= nil then referredByPlayerId == 0 else true
end