local parent = script:FindFirstAncestor("AuthCommon").Parent
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local fFlagEnableAuthBackgroundContainer = require(parent.SharedFlags).FFlagEnableAuthBackgroundContainer
local landingLayer = require(parent.ExperimentLayers).AppBtidLayers.LandingLayer

return function() --[[ line: 20 | named "useAuthBackgroundContainerVariant" ]]
	-- upvalues: fFlagEnableAuthBackgroundContainer (ref), roactAppExperimentModule (ref), landingLayer (ref)
	return if fFlagEnableAuthBackgroundContainer then roactAppExperimentModule.useBrowserTrackerExperiment({ landingLayer }, function(p0) --[[ line: 27 ]]
		-- upvalues: landingLayer (copy)
		return (p0[landingLayer] or {}).landingMarketingBackground == "NewGridBackground"
	end) else false
end