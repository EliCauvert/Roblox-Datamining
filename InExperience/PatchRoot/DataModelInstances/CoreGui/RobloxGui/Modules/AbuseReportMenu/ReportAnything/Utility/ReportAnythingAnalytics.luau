local EventIngestService = game:GetService("EventIngestService")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.TnSAvatarIdentification)
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local config = {
	EventType = { AvatarsIdentified = "ReportAnythingAvatarsIdentified" },
	Context = { LegacyMenu = "ReportAbuseLegacyMenu" }
}

local function _() --[[ Line: 33 ]]
	return {
		previewBackCount = 0,
		previewAttachCount = 0,
		retakeCount = 0,
		retakeAbandon = false,
		highlightSceneCount = 0,
		annotationBackCount = 0,
		annotationPlaceCount = 0,
		annotationUndoCount = 0,
		annotationRedoCount = 0,
		annotationNext = false
	}
end

local config1 = {
	previewBackCount = 0,
	previewAttachCount = 0,
	retakeCount = 0,
	retakeAbandon = false,
	highlightSceneCount = 0,
	annotationBackCount = 0,
	annotationPlaceCount = 0,
	annotationUndoCount = 0,
	annotationRedoCount = 0,
	annotationNext = false
}
local NewResult = nil

local _ = function() --[[ Line: 51 ]]
	-- upvalues: NewResult (ref), EventIngest (copy), EventIngestService (copy)
	if not NewResult then
		NewResult = EventIngest.new(EventIngestService)
	end
	return NewResult
end

return {
	incrementPreviewBack = function() --[[ Line: 59 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.previewBackCount += 1
	end,
	incrementPreviewAttach = function() --[[ Line: 62 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.previewAttachCount += 1
	end,
	incrementRetake = function() --[[ Line: 65 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.retakeCount += 1
	end,
	setRetakeAbandon = function() --[[ Line: 68 ]]
		-- upvalues: config1 (ref)
		config1.retakeAbandon = true
	end,
	incrementHighlightScene = function() --[[ Line: 71 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.highlightSceneCount += 1
	end,
	incrementAnnotationBack = function() --[[ Line: 74 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationBackCount += 1
	end,
	incrementAnnotationPlace = function() --[[ Line: 77 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationPlaceCount += 1
	end,
	incrementAnnotationUndo = function() --[[ Line: 80 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationUndoCount += 1
	end,
	incrementAnnotationRedo = function() --[[ Line: 83 ]]
		-- upvalues: config1 (ref)
		local config = config1
		config.annotationRedoCount += 1
	end,
	setAnnotationNext = function() --[[ Line: 86 ]]
		-- upvalues: config1 (ref)
		config1.annotationNext = true
	end,
	getAccumulatedParameters = function() --[[ Line: 90 ]]
		-- upvalues: config1 (ref)
		return config1
	end,
	emitAvatarsIdentifiedStats = function(p1) --[[ Line: 93 ]]
		-- upvalues: CryoModule (copy), NewResult (ref), EventIngest (copy), EventIngestService (copy), config (copy)
		local JoinResult = CryoModule.Dictionary.join(p1, { duration = p1.duration * 1000000 })
		
		if not NewResult then
			NewResult = EventIngest.new(EventIngestService)
		end
		NewResult:sendEventDeferred(config.Context.LegacyMenu, config.EventType.AvatarsIdentified, JoinResult)
	end,
	clear = function() --[[ Line: 103 ]]
		-- upvalues: config1 (ref)
		config1 = {
			previewBackCount = 0,
			previewAttachCount = 0,
			retakeCount = 0,
			retakeAbandon = false,
			highlightSceneCount = 0,
			annotationBackCount = 0,
			annotationPlaceCount = 0,
			annotationUndoCount = 0,
			annotationRedoCount = 0,
			annotationNext = false
		}
	end
}