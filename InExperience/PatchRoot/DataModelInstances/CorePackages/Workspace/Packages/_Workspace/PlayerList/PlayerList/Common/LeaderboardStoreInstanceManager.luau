local parent = script.Parent.Parent.Parent
local signalsModule = require(parent.Signals)
local var1 = require(parent.LeaderboardStore).createLeaderboardStore()
local _ = nil
local _ = nil
local var2, var3 = signalsModule.createSignal(nil)
local var4 = var2
local var5 = var3

return {
	createLeaderboardStoreInstance = function()
		-- upvalues: var5 (write), var1 (ref)
		var5(var1())
	end,
	getLeaderboardStoreInstance = var4,
	cleanUpInstance = function()
		-- upvalues: var4 (write), var5 (write)
		local var6 = var4(false)
		
		if var6 ~= nil then
			var6.cleanUp()
			var5(nil)
		end
	end
}