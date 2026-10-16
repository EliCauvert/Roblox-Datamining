local Parent = script.Parent.Parent.Parent
local LeaderboardStore = require(Parent.LeaderboardStore).createLeaderboardStore()
local Signal = nil
local Signal2 = nil
Signal, Signal2 = require(Parent.Signals).createSignal(nil)

return {
	createLeaderboardStoreInstance = function() --[[ Line: 13 ]]
		-- upvalues: Signal2 (ref), LeaderboardStore (copy)
		Signal2(LeaderboardStore())
	end,
	getLeaderboardStoreInstance = Signal,
	cleanUpInstance = function() --[[ Line: 17 ]]
		-- upvalues: Signal (ref), Signal2 (ref)
		local SignalResult = Signal(false)
		
		if SignalResult ~= nil then
			SignalResult.cleanUp()
			Signal2(nil)
		end
	end
}