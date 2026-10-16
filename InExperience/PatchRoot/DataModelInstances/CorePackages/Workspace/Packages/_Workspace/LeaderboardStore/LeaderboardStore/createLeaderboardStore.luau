local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.Signals)
local CreateSignalMapFunction = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(Parent.LeaderboardStoreTypes)
local LeaderboardStoreModule = require(Parent.LeaderboardStore)

return function(p1, p2) --[[ Line: 22 | Named "createLeaderboardStore" ]]
	-- upvalues: LeaderboardStoreModule (copy), CreateSignalMapFunction (copy)
	return function() --[[ Line: 23 ]]
		-- upvalues: p1 (copy), p2 (copy), LeaderboardStoreModule (upval), CreateSignalMapFunction (upval)
		local NewLeaderboardStore = LeaderboardStoreModule.new(if p1 then p1 else game:GetService("Teams"), if p2 then p2 else game:GetService("Players"))
		
		return {
			getGameStatsList = function() --[[ Line: 30 ]]
				-- upvalues: NewLeaderboardStore (ref), CreateSignalMapFunction (upval)
				return if NewLeaderboardStore then NewLeaderboardStore:getGameStatsList() else CreateSignalMapFunction()
			end,
			getTeamList = function() --[[ Line: 36 ]]
				-- upvalues: NewLeaderboardStore (ref), CreateSignalMapFunction (upval)
				return if NewLeaderboardStore then NewLeaderboardStore:getTeamList() else CreateSignalMapFunction()
			end,
			getTeamPlayerList = function(p3, p4) --[[ Line: 42 ]]
				-- upvalues: NewLeaderboardStore (ref), CreateSignalMapFunction (upval)
				return if NewLeaderboardStore then NewLeaderboardStore:getTeamPlayerList(p3, p4) else CreateSignalMapFunction()
			end,
			getPlayerEntry = function(p3, p4) --[[ Line: 48 ]]
				-- upvalues: NewLeaderboardStore (ref)
				return if NewLeaderboardStore then NewLeaderboardStore:getPlayerEntry(p3, p4) else nil
			end,
			cleanUp = function() --[[ Line: 56 ]]
				-- upvalues: NewLeaderboardStore (ref)
				NewLeaderboardStore:destroy()
				NewLeaderboardStore = nil
			end
		}
	end
end