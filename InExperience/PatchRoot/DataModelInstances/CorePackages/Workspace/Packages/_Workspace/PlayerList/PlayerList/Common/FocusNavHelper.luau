local Parent = script.Parent.Parent.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.LeaderboardStore)

local function getSortedPlayerInstances(List) --[[ Line: 43 ]]
	local List1 = {}
	
	for _, value in List do
		for _, player in value.players do
			table.insert(List1, {
				teamId = value.teamId,
				teamOrder = value.order(false),
				playerOrder = player.order(false),
				playerInstance = player
			})
		end
	end
	table.sort(List1, function(A, B): boolean --[[ Line: 57 ]]
		return if A.teamOrder == B.teamOrder then A.playerOrder < B.playerOrder else A.teamOrder < B.teamOrder
	end)
	
	return List1
end

return {
	getNextPlayerInstance = function(p1, p2, TeamId) --[[ Line: 68 ]]
		-- upvalues: getSortedPlayerInstances (copy)
		local SortedPlayerInstances = getSortedPlayerInstances(p1)
		local PlayerInstance = nil
		
		for i, sortedPlayerInstance in SortedPlayerInstances do
			if sortedPlayerInstance.playerInstance.userId == p2.userId then
				if sortedPlayerInstance.playerInstance.object ~= p2.object then
					return sortedPlayerInstance.playerInstance
				end
				local SortedPlayerInstance = if i - 1 > 0 then SortedPlayerInstances[i - 1] else nil
				local SortedPlayerInstance1 = if i + 1 <= #SortedPlayerInstances then SortedPlayerInstances[i + 1] else nil
				
				if SortedPlayerInstance1 then
					PlayerInstance = if SortedPlayerInstance1.teamId == TeamId or not SortedPlayerInstance or SortedPlayerInstance.teamId ~= TeamId then SortedPlayerInstance1.playerInstance else SortedPlayerInstance.playerInstance
				elseif SortedPlayerInstance then
					PlayerInstance = SortedPlayerInstance.playerInstance
				end
			end
		end
		return PlayerInstance
	end,
	getFirstPlayerInstance = function(List) --[[ Line: 104 ]]
		local v1 = nil
		local v2 = 1e999
		
		for _, value in List do
			if next(value.players) then
				local OrderResult = value.order(false)
				
				if not v1 or v2 >= OrderResult then
					for _, player in value.players do
						if not v1 or player.order(false) < v1.order(false) then
							v1 = player
							v2 = OrderResult
						end
					end
				end
			end
		end
		return v1
	end
}