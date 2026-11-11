local TimeToInteractiveTracker = require(script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local TTIMetricNamesModule = require(script.Parent.TTIMetricNames)
local Text = "AvatarExperience_" .. TTIMetricNamesModule.Marketplace.WidgetThumbnails .. "_Percieved"
local Text1 = "AvatarExperience_" .. TTIMetricNamesModule.Marketplace.WidgetTiles .. "_Percieved"
local Requests = {
	FetchHydratedWidgets = "FetchHydratedWidgets",
	FetchCatalogSearchWithSponsoredItems = "FetchCatalogSearchWithSponsoredItems",
	FetchCatalogSearch = "FetchCatalogSearch"
}

return {
	Requests = Requests,
	startPerceivedTracking = function()
		-- upvalues: TimeToInteractiveTracker (copy), Text1 (copy), Text (copy)
		TimeToInteractiveTracker.trackStart(Text1)
		TimeToInteractiveTracker.trackStart(Text)
	end,
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
		requestFetchHydratedWidgets = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), Requests (copy)
			TimeToInteractiveTracker.trackRequest(Text, Milestone.PrimaryDataReady.Name, Requests.FetchHydratedWidgets)
		end,
		requestFetchCatalogSearch = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), Requests (copy)
			TimeToInteractiveTracker.trackRequest(Text, Milestone.PrimaryDataReady.Name, Requests.FetchCatalogSearchWithSponsoredItems)
		end,
		requestFetchCatalogSearchOrganic = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), Requests (copy)
			TimeToInteractiveTracker.trackRequest(Text, Milestone.PrimaryDataReady.Name, Requests.FetchCatalogSearch)
		end
	}
}