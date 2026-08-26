local var1 = if game:DefineFastFlag("PlatformLeaderboardEnabled", false) then require(script.PlatformLeaderboardClientStore) else nil
local var2 = nil

return {
	["jest.config"] = script["jest.config"],
	PlatformLeaderboardClientStore = var1,
	getPlatformLeaderboardClientStore = function()
		-- upvalues: var2 (write), var1 (ref)
		if var2 == nil and var1 ~= nil then
			var2 = var1.new()
		end
		return var2
	end,
	reset = function()
		-- upvalues: var2 (write)
		if var2 ~= nil then
			var2:destroy()
			var2 = nil
		end
	end
}