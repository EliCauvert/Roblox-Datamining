local Parent = script.Parent.Parent.Parent
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local FStringPaginatedCarouselExperimentLayer = require(Parent.SharedFlags).FStringPaginatedCarouselExperimentLayer

return {
	usePaginatedFriendsCarouselExperiment = function()
		-- upvalues: UseUserExperimentFunction (copy), FStringPaginatedCarouselExperimentLayer (copy)
		return true, (UseUserExperimentFunction({ FStringPaginatedCarouselExperimentLayer }, function(p1)
			-- upvalues: FStringPaginatedCarouselExperimentLayer (upval)
			return (p1[FStringPaginatedCarouselExperimentLayer] or {}).friendsSortVariant
		end))
	end
}