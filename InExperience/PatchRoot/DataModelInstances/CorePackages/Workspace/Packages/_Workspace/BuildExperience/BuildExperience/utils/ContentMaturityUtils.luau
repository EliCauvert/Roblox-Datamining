local UniverseActivationModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.UniverseActivation)

local function _(p1) --[[ Line: 5 | Named "getEligibility" ]]
	-- upvalues: UniverseActivationModule (copy)
	return UniverseActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
end

return {
	isSealBroken = function(p1): boolean --[[ Line: 9 ]]
		-- upvalues: UniverseActivationModule (copy)
		local DataResult = UniverseActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
		
		return DataResult ~= nil and DataResult.provisionalRatingAllowed ~= true
	end,
	isContentUnrated = function(p1): boolean --[[ Line: 14 ]]
		-- upvalues: UniverseActivationModule (copy)
		local DataResult = UniverseActivationModule.getUniverseActivationStore().getAndFetchEligibility(p1).data()
		
		return DataResult ~= nil and DataResult.maturityRated ~= true
	end
}