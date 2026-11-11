local TimeToInteractiveTracker = require(script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local Text = "AvatarExperience_" .. require(script.Parent.TTIMetricNames).Marketplace.OrganicThumbnails
local CustomSubphases = {
	SponsoredSearchStarted = "SponsoredSearchStarted",
	SponsoredSearchCompleted = "SponsoredSearchCompleted",
	CatalogApiSearchStarted = "CatalogApiSearchStarted",
	CatalogApiSearchCompleted = "CatalogApiSearchCompleted"
}

return {
	CustomSubphases = CustomSubphases,
	Hooks = {
		useRenderAndMountedTracking = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy)
			TimeToInteractiveTracker.Hooks.useTTIRenderAndMountedTracking(Text)
		end
	},
	L2 = {
		primaryDataStarted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackMilestone(Text, Milestone.PrimaryDataStarted.Name)
		end,
		primaryDataReady = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackMilestone(Text, Milestone.PrimaryDataReady.Name)
		end,
		dataProcessingStarted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackMilestone(Text, Milestone.DataProcessingStarted.Name)
		end,
		dataProcessingCompleted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackMilestone(Text, Milestone.DataProcessingCompleted.Name)
		end,
		functionallyReady = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackMilestone(Text, Milestone.FunctionallyReady)
		end,
		surfaceReady = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackMilestone(Text, Milestone.SurfaceReady)
		end
	},
	L3 = {
		networkFetch = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, Milestone.PrimaryDataStarted.Subphase.NetworkFetch)
		end,
		responseReceived = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, Milestone.PrimaryDataStarted.Subphase.ResponseReceived)
		end,
		sponsoredSearchStarted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.SponsoredSearchStarted)
		end,
		sponsoredSearchCompleted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.SponsoredSearchCompleted)
		end,
		catalogApiSearchStarted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.CatalogApiSearchStarted)
		end,
		catalogApiSearchCompleted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.CatalogApiSearchCompleted)
		end
	}
}