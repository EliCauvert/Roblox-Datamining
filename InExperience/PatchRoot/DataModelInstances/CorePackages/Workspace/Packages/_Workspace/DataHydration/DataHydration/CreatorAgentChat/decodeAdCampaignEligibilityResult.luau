local TModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local InterfaceResult = TModule.interface({
	userEligible = TModule.boolean,
	universeEligible = TModule.boolean,
	freeCreditsRemaining = TModule.integer,
	cardType = TModule.union(TModule.literal("promote_free"), TModule.literal("promote_paid"), TModule.literal("none")),
	ineligibleReasons = TModule.array(TModule.string),
	offer = TModule.optional(TModule.interface({
		displayAmountRobux = TModule.integer,
		durationDays = TModule.integer
	}))
})

return function(p1)
	-- upvalues: InterfaceResult (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	
	if not InterfaceResultResult then
		return nil, "Invalid ad campaign eligibility response: " .. tostring(InterfaceResultResult2)
	elseif p1.freeCreditsRemaining < 0 then
		return nil, "Invalid ad campaign eligibility response: freeCreditsRemaining must be non-negative"
	elseif p1.offer ~= nil then
		if p1.offer.displayAmountRobux < 0 then
			return nil, "Invalid ad campaign eligibility response: offer.displayAmountRobux must be non-negative"
		elseif p1.offer.durationDays <= 0 then
			return nil, "Invalid ad campaign eligibility response: offer.durationDays must be positive"
		end
	end
	return p1, nil
end