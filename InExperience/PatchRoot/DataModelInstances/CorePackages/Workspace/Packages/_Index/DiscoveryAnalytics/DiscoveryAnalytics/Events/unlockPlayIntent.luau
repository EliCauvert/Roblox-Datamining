local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	upsellName = TModule.string,
	playabilityStatus = TModule.optional(TModule.string),
	pageName = TModule.optional(TModule.string)
})

return function(p1, p2)
	-- upvalues: StrictInterfaceResult (copy), FlaggedMutedErrorFunction (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p2)
	
	if not StrictInterfaceResultResult then
		FlaggedMutedErrorFunction("UnlockPlayIntentEventInterface", StrictInterfaceResultResult2)
	end
	p1:sendEventDeferred("PlayButton", "unlockPlayIntent", p2)
end