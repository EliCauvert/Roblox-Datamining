local parent = script.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.Signals)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(parent.LeaderboardStoreTypes)
local leaderboardStoreModule = require(parent.LeaderboardStore)

return function(p0, p1) --[[ line: 22 | named "createLeaderboardStore" ]]
	-- upvalues: leaderboardStoreModule (ref), createSignalMap (ref)
	return function() --[[ line: 23 ]]
		-- upvalues: p0 (ref), p1 (ref), leaderboardStoreModule (copy), createSignalMap (copy)
		local var1 = leaderboardStoreModule.new(p0 or game:GetService("Teams"), p1 or game:GetService("Players"))
		
		return {
			getGameStatsList = function() --[[ line: 30 ]]
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getGameStatsList() else createSignalMap()
			end,
			getTeamList = function() --[[ line: 36 ]]
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getTeamList() else createSignalMap()
			end,
			getTeamPlayerList = function(p2, p3) --[[ line: 42 ]]
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getTeamPlayerList(p2, p3) else createSignalMap()
			end,
			getPlayerEntry = function(p4, p5) --[[ line: 48 ]]
				-- upvalues: var1 (write)
				return if var1 then var1:getPlayerEntry(p4, p5) else nil
			end,
			cleanUp = function() --[[ line: 56 ]]
				-- upvalues: var1 (write)
				var1:destroy()
				var1 = nil
			end
		}
	end
end