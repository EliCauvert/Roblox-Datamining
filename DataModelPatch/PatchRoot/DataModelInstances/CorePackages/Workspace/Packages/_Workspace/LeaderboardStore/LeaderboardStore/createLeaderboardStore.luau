local Parent = script.Parent
local Parent1 = Parent.Parent
local _ = require(Parent1.Signals)
local CreateSignalMapFunction = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(Parent.LeaderboardStoreTypes)
local LeaderboardStoreModule = require(Parent.LeaderboardStore)

return function(p1, p2)
	-- upvalues: LeaderboardStoreModule (copy), CreateSignalMapFunction (copy)
	return function()
		-- upvalues: p1 (copy), p2 (copy), LeaderboardStoreModule (upval), CreateSignalMapFunction (upval)
		local NewLeaderboardStore = LeaderboardStoreModule.new(if p1 then p1 else game:GetService("Teams"), if p2 then p2 else game:GetService("Players"))
		
		return {
			getGameStatsList = function()
				-- upvalues: NewLeaderboardStore (ref), CreateSignalMapFunction (upval)
				return if NewLeaderboardStore then NewLeaderboardStore:getGameStatsList() else CreateSignalMapFunction()
			end,
			getTeamList = function()
				-- upvalues: NewLeaderboardStore (ref), CreateSignalMapFunction (upval)
				return if NewLeaderboardStore then NewLeaderboardStore:getTeamList() else CreateSignalMapFunction()
			end,
			getTeamPlayerList = function(p3, p4)
				-- upvalues: NewLeaderboardStore (ref), CreateSignalMapFunction (upval)
				return if NewLeaderboardStore then NewLeaderboardStore:getTeamPlayerList(p3, p4) else CreateSignalMapFunction()
			end,
			getPlayerEntry = function(p3, p4)
				-- upvalues: NewLeaderboardStore (ref)
				return if NewLeaderboardStore then NewLeaderboardStore:getPlayerEntry(p3, p4) else nil
			end,
			cleanUp = function()
				-- upvalues: NewLeaderboardStore (ref)
				NewLeaderboardStore:destroy()
				NewLeaderboardStore = nil
			end
		}
	end
end