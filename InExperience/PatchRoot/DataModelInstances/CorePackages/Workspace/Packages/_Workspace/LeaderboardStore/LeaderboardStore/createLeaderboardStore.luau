local parent = script.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.Signals)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(parent.LeaderboardStoreTypes)
local leaderboardStoreModule = require(parent.LeaderboardStore)

return function(p1, p2)
	-- upvalues: leaderboardStoreModule (ref), createSignalMap (ref)
	return function()
		-- upvalues: p1 (ref), p2 (ref), leaderboardStoreModule (copy), createSignalMap (copy)
		local var1 = leaderboardStoreModule.new(p1 or game:GetService("Teams"), p2 or game:GetService("Players"))
		
		return {
			getGameStatsList = function()
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getGameStatsList() else createSignalMap()
			end,
			getTeamList = function()
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getTeamList() else createSignalMap()
			end,
			getTeamPlayerList = function(p3, p4)
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getTeamPlayerList(p3, p4) else createSignalMap()
			end,
			getPlayerEntry = function(p3, p4)
				-- upvalues: var1 (write)
				return if var1 then var1:getPlayerEntry(p3, p4) else nil
			end,
			cleanUp = function()
				-- upvalues: var1 (write)
				var1:destroy()
				var1 = nil
			end
		}
	end
end