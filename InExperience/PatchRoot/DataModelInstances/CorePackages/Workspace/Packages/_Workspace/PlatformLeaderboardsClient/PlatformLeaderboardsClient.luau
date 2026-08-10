local var0 = if game:DefineFastFlag("PlatformLeaderboardEnabled", false) then require(script.PlatformLeaderboardClientStore) else nil
local var1 = nil

return {
	["jest.config"] = script["jest.config"],
	PlatformLeaderboardClientStore = var0,
	getPlatformLeaderboardClientStore = function() --[[ line: 11 ]]
		-- upvalues: var1 (write), var0 (ref)
		if var1 == nil and var0 ~= nil then
			var1 = var0.new()
		end
		return var1
	end,
	reset = function() --[[ line: 18 ]]
		-- upvalues: var1 (write)
		if var1 ~= nil then
			var1:destroy()
			var1 = nil
		end
	end
}