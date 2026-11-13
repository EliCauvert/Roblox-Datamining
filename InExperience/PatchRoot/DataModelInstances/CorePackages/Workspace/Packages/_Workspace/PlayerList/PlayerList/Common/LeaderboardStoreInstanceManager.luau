local Parent = script.Parent.Parent.Parent
local SignalsModule = require(Parent.Signals)
local LeaderboardStore = require(Parent.LeaderboardStore).createLeaderboardStore()
local Signal = nil
local Signal2 = nil
Signal, Signal2 = SignalsModule.createSignal(nil)

return {
	createLeaderboardStoreInstance = function()
		-- upvalues: Signal2 (ref), LeaderboardStore (copy)
		Signal2(LeaderboardStore())
	end,
	getLeaderboardStoreInstance = Signal,
	cleanUpInstance = function()
		-- upvalues: Signal (ref), Signal2 (ref)
		local SignalResult = Signal(false)
		
		if SignalResult ~= nil then
			SignalResult.cleanUp()
			Signal2(nil)
		end
	end
}