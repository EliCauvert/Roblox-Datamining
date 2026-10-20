local PlatformLeaderboardClientStoreModule = if game:DefineFastFlag("PlatformLeaderboardEnabled", false) then require(script.PlatformLeaderboardClientStore) else nil
local NewResult = nil

return {
	["jest.config"] = script["jest.config"],
	PlatformLeaderboardClientStore = PlatformLeaderboardClientStoreModule,
	getPlatformLeaderboardClientStore = function()
		-- upvalues: NewResult (ref), PlatformLeaderboardClientStoreModule (copy)
		if NewResult == nil and PlatformLeaderboardClientStoreModule ~= nil then
			NewResult = PlatformLeaderboardClientStoreModule.new()
		end
		return NewResult
	end,
	reset = function()
		-- upvalues: NewResult (ref)
		if NewResult ~= nil then
			NewResult:destroy()
			NewResult = nil
		end
	end
}