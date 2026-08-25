local universeActivationModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.UniverseActivation)

local function _(p0)
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p0).data()
end

return {
	isSealBroken = function(p1)
		-- upvalues: universeActivationModule (ref)
		local var1 = universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
		
		return var1 ~= nil and var1.provisionalRatingAllowed ~= true
	end,
	isContentUnrated = function(p2)
		-- upvalues: universeActivationModule (ref)
		local var2 = universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p2).data()
		
		return var2 ~= nil and var2.maturityRated ~= true
	end
}