local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	upsellName = tModule.string,
	playabilityStatus = tModule.optional(tModule.string),
	pageName = if require(parent.SharedFlags).FFlagLuaAppLogPageContextUnlockPlayIntent then tModule.optional(tModule.string) else nil
})

return function(p0, p1) --[[ line: 17 ]]
	-- upvalues: var1 (ref), flaggedMutedError (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		flaggedMutedError("UnlockPlayIntentEventInterface", var3)
	end
	p0:sendEventDeferred("PlayButton", "unlockPlayIntent", p1)
end