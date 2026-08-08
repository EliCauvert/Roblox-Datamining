local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	upsellName = tModule.string,
	playabilityStatus = tModule.optional(tModule.string),
	pageName = tModule.optional(tModule.string)
})

return function(p0, p1) --[[ line: 14 ]]
	-- upvalues: var1 (ref), flaggedMutedError (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		flaggedMutedError("UnlockPlayIntentEventInterface", var3)
	end
	p0:sendEventDeferred("PlayButton", "unlockPlayIntent", p1)
end