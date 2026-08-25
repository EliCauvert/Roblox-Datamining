local parent = script.Parent
local parent_1 = parent.Parent
local _ = require(parent_1.Signals)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(parent.LeaderboardStoreTypes)
local leaderboardStoreModule = require(parent.LeaderboardStore)

return function(p0, p1)
	-- upvalues: leaderboardStoreModule (ref), createSignalMap (ref)
	return function()
		-- upvalues: p0 (ref), p1 (ref), leaderboardStoreModule (copy), createSignalMap (copy)
		local var1 = leaderboardStoreModule.new(p0 or game:GetService("Teams"), p1 or game:GetService("Players"))
		
		return {
			getGameStatsList = function()
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getGameStatsList() else createSignalMap()
			end,
			getTeamList = function()
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getTeamList() else createSignalMap()
			end,
			getTeamPlayerList = function(p2, p3)
				-- upvalues: var1 (write), createSignalMap (copy)
				return if var1 then var1:getTeamPlayerList(p2, p3) else createSignalMap()
			end,
			getPlayerEntry = function(p4, p5)
				-- upvalues: var1 (write)
				return if var1 then var1:getPlayerEntry(p4, p5) else nil
			end,
			cleanUp = function()
				-- upvalues: var1 (write)
				var1:destroy()
				var1 = nil
			end
		}
	end
end