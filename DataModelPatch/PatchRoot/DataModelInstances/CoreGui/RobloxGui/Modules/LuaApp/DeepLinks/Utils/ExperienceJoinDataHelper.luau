local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return {
	mergeExperienceJoinData = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p2 then CryoModule.Dictionary.join(p1, {
			experienceJoinData = {
				eventId = p2.experienceEventId,
				launchData = p2.launchData
			}
		}) else p1
	end
}