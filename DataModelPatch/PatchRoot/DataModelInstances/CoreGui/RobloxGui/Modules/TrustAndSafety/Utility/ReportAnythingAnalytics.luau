local CorePackages = game:GetService("CorePackages")
local EventIngestService = game:GetService("EventIngestService")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.TnSAvatarIdentification)
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local config = {
	EventType = { AvatarsIdentified = "ReportAnythingAvatarsIdentified" },
	Context = { LegacyMenu = "ReportAbuseLegacyMenu" }
}

local function _()
	return {
		annotationOptionSeenCount = 0,
		annotationPageSeenCount = 0,
		annotationPlaceCount = 0,
		annotationUndoCount = 0,
		annotationRedoCount = 0,
		abandonedForRetake = false,
		isPortraitMode = false
	}
end

local config1 = {
	annotationOptionSeenCount = 0,
	annotationPageSeenCount = 0,
	annotationPlaceCount = 0,
	annotationUndoCount = 0,
	annotationRedoCount = 0,
	abandonedForRetake = false,
	isPortraitMode = false
}
local NewResult = nil

local _ = function()
	-- upvalues: NewResult (ref), EventIngest (copy), EventIngestService (copy)
	if not NewResult then
		NewResult = EventIngest.new(EventIngestService)
	end
	return NewResult
end

return {
	incrementAnnotationOptionSeen = function()
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationOptionSeenCount += 1
	end,
	incrementAnnotationPageSeen = function()
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationPageSeenCount += 1
	end,
	incrementAnnotationPlace = function()
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationPlaceCount += 1
	end,
	incrementAnnotationUndo = function()
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationUndoCount += 1
	end,
	incrementAnnotationRedo = function()
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationRedoCount += 1
	end,
	setAbandonedForRetake = function()
		-- upvalues: config1 (ref)
		config1.abandonedForRetake = true
	end,
	setIsPortraitMode = function()
		-- upvalues: config1 (ref)
		config1.isPortraitMode = true
	end,
	getAccumulatedParameters = function()
		-- upvalues: config1 (ref)
		return config1
	end,
	emitAvatarsIdentifiedStats = function(p1)
		-- upvalues: CryoModule (copy), NewResult (ref), EventIngest (copy), EventIngestService (copy), config (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, { duration = p1.duration * 1000000 })
		
		if not NewResult then
			NewResult = EventIngest.new(EventIngestService)
		end
		NewResult:sendEventDeferred(config.Context.LegacyMenu, config.EventType.AvatarsIdentified, JoinResult)
	end,
	clear = function()
		-- upvalues: config1 (ref)
		config1 = {
			annotationOptionSeenCount = 0,
			annotationPageSeenCount = 0,
			annotationPlaceCount = 0,
			annotationUndoCount = 0,
			annotationRedoCount = 0,
			abandonedForRetake = false,
			isPortraitMode = false
		}
	end
}