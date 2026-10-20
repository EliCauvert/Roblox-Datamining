local FFlagBuildExperienceLibrary = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent.SharedFlags).FFlagBuildExperienceLibrary

return {
	isViewer = function(p1)
		-- upvalues: FFlagBuildExperienceLibrary (copy)
		local P0 = p1 or game
		
		return FFlagBuildExperienceLibrary and (P0:GetEngineFeature("IsTeamCreateViewerEnabled") and P0:GetService("RunService"):IsTeamCreateViewer())
	end
}