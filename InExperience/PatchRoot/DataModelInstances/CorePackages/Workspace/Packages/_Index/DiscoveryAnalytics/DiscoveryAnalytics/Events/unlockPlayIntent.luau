local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	upsellName = tModule.string,
	playabilityStatus = tModule.optional(tModule.string),
	pageName = tModule.optional(tModule.string)
})

return function(p1, p2)
	-- upvalues: var1 (ref), flaggedMutedError (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		flaggedMutedError("UnlockPlayIntentEventInterface", var3)
	end
	p1:sendEventDeferred("PlayButton", "unlockPlayIntent", p2)
end