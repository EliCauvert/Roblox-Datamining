local parent = script.Parent.Parent.Parent
local _ = require(parent.Signals)
local _ = require(parent.LeaderboardStore)

local function getSortedPlayerInstances(p0) --[[ line: 43 ]]
	local t = {}
	
	for i, v in p0 do
		for i_1, v_1 in v.players do
			table.insert(t, {
				teamId = v.teamId,
				teamOrder = v.order(false),
				playerOrder = v_1.order(false),
				playerInstance = v_1
			})
		end
	end
	table.sort(t, function(p1, p2) --[[ line: 57 ]]
		return if p1.teamOrder == p2.teamOrder then p1.playerOrder < p2.playerOrder else p1.teamOrder < p2.teamOrder
	end)
	
	return t
end

return {
	getNextPlayerInstance = function(p3, p4, p5) --[[ line: 68 ]]
		-- upvalues: getSortedPlayerInstances (ref)
		local var2 = getSortedPlayerInstances(p3)
		local playerInstance = nil
		
		for i, v in var2 do
			if v.playerInstance.userId == p4.userId then
				if v.playerInstance.object == p4.object then
					local var3 = if i - 1 > 0 then var2[i - 1] else nil
					local var4 = if i + 1 <= #var2 then var2[i + 1] else nil
					
					if var4 then
						playerInstance = if var4.teamId == p5 or not var3 or var3.teamId ~= p5 then var4.playerInstance else var3.playerInstance
					elseif var3 then
						playerInstance = var3.playerInstance
					end
				end
				return v.playerInstance
			end
		end
		return playerInstance
	end,
	getFirstPlayerInstance = function(p6) --[[ line: 104 ]]
		local var5 = nil
		local var6 = 1e999
		
		for i, v in p6 do
			if next(v.players) then
				local var7 = v.order(false)
				
				if not var5 or var6 >= var7 then
					for i_1, v_1 in v.players do
						if not var5 or v_1.order(false) < var5.order(false) then
							var5 = v_1
							var6 = var7
						end
					end
				end
			end
		end
		return var5
	end
}