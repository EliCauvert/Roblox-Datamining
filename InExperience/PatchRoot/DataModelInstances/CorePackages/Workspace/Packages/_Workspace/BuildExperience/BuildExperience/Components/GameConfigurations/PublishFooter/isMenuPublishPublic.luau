local fFlagBuildRehydrateOnPublishModule = require(script:FindFirstAncestor("BuildExperience").Flags.FFlagBuildRehydrateOnPublish)

return function(p1)
	-- upvalues: fFlagBuildRehydrateOnPublishModule (ref)
	return if p1.isCurrentlyPublic then true else fFlagBuildRehydrateOnPublishModule or not p1.isActive
end