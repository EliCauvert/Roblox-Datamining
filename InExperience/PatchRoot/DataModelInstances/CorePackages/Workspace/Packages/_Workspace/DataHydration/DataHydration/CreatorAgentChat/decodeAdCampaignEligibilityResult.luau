local tModule = require(script:FindFirstAncestor("DataHydration").Parent.t)
local _ = require(script.Parent.Types.store)
local var1 = tModule.interface({
	schemaVersion = tModule.integer,
	userEligible = tModule.boolean,
	universeEligible = tModule.boolean,
	freeCreditsRemaining = tModule.integer,
	cardType = tModule.union(tModule.literal("promote_free"), tModule.literal("promote_paid"), tModule.literal("none")),
	ineligibleReasons = tModule.array(tModule.string),
	offer = tModule.optional(tModule.interface({
		displayAmountRobux = tModule.integer,
		durationDays = tModule.integer
	}))
})

return function(p1)
	-- upvalues: var1 (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		return nil, "Invalid ad campaign eligibility response: " .. tostring(var3)
	elseif p1.schemaVersion ~= 1 then
		return nil, `Unsupported ad campaign eligibility schema version: {p1.schemaVersion}`
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