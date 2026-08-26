local parent = script.Parent.Parent.Parent
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fStringPaginatedCarouselExperimentLayer = require(parent.SharedFlags).FStringPaginatedCarouselExperimentLayer

return {
	usePaginatedFriendsCarouselExperiment = function()
		-- upvalues: useUserExperiment (ref), fStringPaginatedCarouselExperimentLayer (ref)
		return true, useUserExperiment({ fStringPaginatedCarouselExperimentLayer }, function(p1)
			-- upvalues: fStringPaginatedCarouselExperimentLayer (copy)
			return (p1[fStringPaginatedCarouselExperimentLayer] or {}).friendsSortVariant
		end)
	end
}