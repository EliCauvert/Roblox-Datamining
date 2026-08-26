local universeActivationModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.UniverseActivation)

local function _(p1)
	-- upvalues: universeActivationModule (ref)
	return universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
end

return {
	isSealBroken = function(p1)
		-- upvalues: universeActivationModule (ref)
		local var1 = universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
		
		return var1 ~= nil and var1.provisionalRatingAllowed ~= true
	end,
	isContentUnrated = function(p1)
		-- upvalues: universeActivationModule (ref)
		local var1 = universeActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
		
		return var1 ~= nil and var1.maturityRated ~= true
	end
}