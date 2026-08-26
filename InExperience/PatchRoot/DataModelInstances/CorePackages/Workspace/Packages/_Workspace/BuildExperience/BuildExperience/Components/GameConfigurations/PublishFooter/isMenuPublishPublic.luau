local buildExperience = script:FindFirstAncestor("BuildExperience")
local fFlagEnableProvisionalRatingModule = require(buildExperience.Flags.FFlagEnableProvisionalRating)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)

return function(p1)
	-- upvalues: fFlagEnableProvisionalRatingModule (ref), fFlagBuildRehydrateOnPublishModule (ref)
	return if p1.isCurrentlyPublic then true else fFlagEnableProvisionalRatingModule and (fFlagBuildRehydrateOnPublishModule or not p1.isActive)
end