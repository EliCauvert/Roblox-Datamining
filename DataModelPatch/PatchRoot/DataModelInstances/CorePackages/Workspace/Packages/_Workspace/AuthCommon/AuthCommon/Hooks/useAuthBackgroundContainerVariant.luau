local Parent = script:FindFirstAncestor("AuthCommon").Parent
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local FFlagEnableAuthBackgroundContainer = require(Parent.SharedFlags).FFlagEnableAuthBackgroundContainer
local LandingLayer = require(Parent.ExperimentLayers).AppBtidLayers.LandingLayer

return function()
	-- upvalues: FFlagEnableAuthBackgroundContainer (copy), RoactAppExperimentModule (copy), LandingLayer (copy)
	return if FFlagEnableAuthBackgroundContainer then RoactAppExperimentModule.useBrowserTrackerExperiment({ LandingLayer }, function(p1): boolean
		-- upvalues: LandingLayer (upval)
		return (p1[LandingLayer] or {}).landingMarketingBackground == "NewGridBackground"
	end) else false
end