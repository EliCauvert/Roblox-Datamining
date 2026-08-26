local parent = script.Parent.Parent.Parent
local _ = require(parent.Signals)
local _ = require(parent.LeaderboardStore)

local function getSortedPlayerInstances(p1)
	local t = {}
	
	for i, v in p1 do
		for i_1, v_1 in v.players do
			table.insert(t, {
				teamId = v.teamId,
				teamOrder = v.order(false),
				playerOrder = v_1.order(false),
				playerInstance = v_1
			})
		end
	end
	table.sort(t, function(p2, p3)
		return if p2.teamOrder == p3.teamOrder then p2.playerOrder < p3.playerOrder else p2.teamOrder < p3.teamOrder
	end)
	
	return t
end

return {
	getNextPlayerInstance = function(p2, p3, p4)
		-- upvalues: getSortedPlayerInstances (ref)
		local var1 = getSortedPlayerInstances(p2)
		local playerInstance = nil
		
		for i, v in var1 do
			if v.playerInstance.userId == p3.userId then
				if v.playerInstance.object == p3.object then
					local var2 = if i - 1 > 0 then var1[i - 1] else nil
					local var3 = if i + 1 <= #var1 then var1[i + 1] else nil
					
					if var3 then
						playerInstance = if var3.teamId == p4 or not var2 or var2.teamId ~= p4 then var3.playerInstance else var2.playerInstance
					elseif var2 then
						playerInstance = var2.playerInstance
					end
				end
				return v.playerInstance
			end
		end
		return playerInstance
	end,
	getFirstPlayerInstance = function(p5)
		local var4 = nil
		local var5 = 1e999
		
		for i, v in p5 do
			if next(v.players) then
				local var6 = v.order(false)
				
				if not var4 or var5 >= var6 then
					for i_1, v_1 in v.players do
						if not var4 or v_1.order(false) < var4.order(false) then
							var4 = v_1
							var5 = var6
						end
					end
				end
			end
		end
		return var4
	end
}