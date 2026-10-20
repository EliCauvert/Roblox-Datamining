local UniverseActivationModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.UniverseActivation)

local function _(p1)
	-- upvalues: UniverseActivationModule (copy)
	return UniverseActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
end

return {
	isSealBroken = function(p1): boolean
		-- upvalues: UniverseActivationModule (copy)
		local DataResult = UniverseActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
		
		return DataResult ~= nil and DataResult.provisionalRatingAllowed ~= true
	end,
	isContentUnrated = function(p1): boolean
		-- upvalues: UniverseActivationModule (copy)
		local DataResult = UniverseActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
		
		return DataResult ~= nil and DataResult.maturityRated ~= true
	end
}