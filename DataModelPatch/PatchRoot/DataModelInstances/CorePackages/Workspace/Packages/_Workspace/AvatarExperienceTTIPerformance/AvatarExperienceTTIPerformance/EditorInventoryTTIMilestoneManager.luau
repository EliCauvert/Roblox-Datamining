local Parent = script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local TTIMetricNamesModule = require(script.Parent.TTIMetricNames)
local AvatarExperienceTTIPerformanceManagerModule = require(script.Parent.AvatarExperienceTTIPerformanceManager)
local Text = "AvatarExperience_" .. TTIMetricNamesModule.Editor.InventoryTiles
local Root = if require(Parent.AvatarExperienceFlags).FFlagAXTTIEditorEnableMilestones then AvatarExperienceTTIPerformanceManagerModule.Surface.AvatarEditor.Root else nil

local function _(): boolean
	-- upvalues: TimeToInteractiveTracker (copy), Text (copy)
	local Events = TimeToInteractiveTracker.getEvents()
	
	return Events ~= nil and Events[Text] ~= nil
end

local Count = 0
local CustomSubphases = {
	GetUserInventoryV2Started = "GetUserInventoryV2Started",
	GetUserInventoryV2Completed = "GetUserInventoryV2Completed",
	GetUserInventoryStarted = "GetUserInventoryStarted",
	GetUserInventoryCompleted = "GetUserInventoryCompleted",
	GetOutfitsStarted = "GetOutfitsStarted",
	GetOutfitsCompleted = "GetOutfitsCompleted"
}
local Requests = {
	BatchGetOutfits = "BatchGetOutfits",
	GetRecommendedItems = "GetRecommendedItems",
	GetAvatarData = "GetAvatarData"
}

return {
	CustomSubphases = CustomSubphases,
	Requests = Requests,
	startTracking = function()
		-- upvalues: Count (ref), Root (copy)
		Count += 1
		Root.startTracking()
	end,
	getSessionGeneration = function()
		-- upvalues: Count (ref)
		return Count
	end,
	endTilesTracking = function()
		-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Root (copy), TTIMetricNamesModule (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events[Text] ~= nil then
			Root.endTracking(TTIMetricNamesModule.Editor.InventoryTiles)
			
			return
		end
	end,
	endThumbnailsTracking = function()
		-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Root (copy), TTIMetricNamesModule (copy)
		local Events = TimeToInteractiveTracker.getEvents()
		
		if Events ~= nil and Events[Text] ~= nil then
			Root.endTracking(TTIMetricNamesModule.Editor.InventoryThumbnails)
			
			return
		end
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
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackMilestone(Text, Milestone.PrimaryDataStarted.Name)
				
				return
			end
		end,
		primaryDataReady = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackMilestone(Text, Milestone.PrimaryDataReady.Name)
				
				return
			end
		end,
		dataProcessingStarted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackMilestone(Text, Milestone.DataProcessingStarted.Name)
				
				return
			end
		end,
		dataProcessingCompleted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackMilestone(Text, Milestone.DataProcessingCompleted.Name)
				
				return
			end
		end,
		functionallyReady = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackMilestone(Text, Milestone.FunctionallyReady)
				
				return
			end
		end,
		surfaceReady = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackMilestone(Text, Milestone.SurfaceReady)
				
				return
			end
		end
	},
	L3 = {
		networkFetch = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, Milestone.PrimaryDataStarted.Subphase.NetworkFetch)
				
				return
			end
		end,
		getInventoryV2Started = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.GetUserInventoryV2Started)
				
				return
			end
		end,
		getInventoryV2Completed = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.GetUserInventoryV2Completed)
				
				return
			end
		end,
		getInventoryStarted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.GetUserInventoryStarted)
				
				return
			end
		end,
		getInventoryCompleted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.GetUserInventoryCompleted)
				
				return
			end
		end,
		getOutfitsStarted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.GetOutfitsStarted)
				
				return
			end
		end,
		getOutfitsCompleted = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), CustomSubphases (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackSubphase(Text, Milestone.PrimaryDataStarted.Name, CustomSubphases.GetOutfitsCompleted)
				
				return
			end
		end,
		requestBatchGetOutfits = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), Requests (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackRequest(Text, Milestone.PrimaryDataReady.Name, Requests.BatchGetOutfits)
				
				return
			end
		end,
		requestGetRecommendedItems = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), Requests (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackRequest(Text, Milestone.PrimaryDataReady.Name, Requests.GetRecommendedItems)
				
				return
			end
		end,
		requestGetAvatarData = function()
			-- upvalues: TimeToInteractiveTracker (copy), Text (copy), Milestone (copy), Requests (copy)
			local Events = TimeToInteractiveTracker.getEvents()
			
			if Events ~= nil and Events[Text] ~= nil then
				TimeToInteractiveTracker.trackRequest(Text, Milestone.PrimaryDataReady.Name, Requests.GetAvatarData)
				
				return
			end
		end
	}
}