local fFlagBuildExperienceLibrary = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent.SharedFlags).FFlagBuildExperienceLibrary

return {
	isViewer = function(p1)
		-- upvalues: fFlagBuildExperienceLibrary (ref)
		p1 = p1 or game
		
		return fFlagBuildExperienceLibrary and (p1:GetEngineFeature("IsTeamCreateViewerEnabled") and p1:GetService("RunService"):IsTeamCreateViewer())
	end
}