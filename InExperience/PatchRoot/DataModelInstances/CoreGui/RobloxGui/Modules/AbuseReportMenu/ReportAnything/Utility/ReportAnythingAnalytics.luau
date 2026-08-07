local eventIngestService = game:GetService("EventIngestService")
local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local _ = require(corePackagesService.Workspace.Packages.TnSAvatarIdentification)
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local t = {
	EventType = { AvatarsIdentified = "ReportAnythingAvatarsIdentified" },
	Context = { LegacyMenu = "ReportAbuseLegacyMenu" }
}

local _ = function() --[[ line: 33 ]]
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

local t_1 = {
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
local var5 = nil

local _ = function() --[[ line: 51 ]]
	-- upvalues: var5 (write), eventIngest (ref), eventIngestService (ref)
	if not var5 then
		var5 = eventIngest.new(eventIngestService)
	end
	return var5
end

return {
	incrementPreviewBack = function() --[[ line: 59 ]]
		-- upvalues: t_1 (write)
		t_1.previewBackCount += 1
	end,
	incrementPreviewAttach = function() --[[ line: 62 ]]
		-- upvalues: t_1 (write)
		t_1.previewAttachCount += 1
	end,
	incrementRetake = function() --[[ line: 65 ]]
		-- upvalues: t_1 (write)
		t_1.retakeCount += 1
	end,
	setRetakeAbandon = function() --[[ line: 68 ]]
		-- upvalues: t_1 (write)
		t_1.retakeAbandon = true
	end,
	incrementHighlightScene = function() --[[ line: 71 ]]
		-- upvalues: t_1 (write)
		t_1.highlightSceneCount += 1
	end,
	incrementAnnotationBack = function() --[[ line: 74 ]]
		-- upvalues: t_1 (write)
		t_1.annotationBackCount += 1
	end,
	incrementAnnotationPlace = function() --[[ line: 77 ]]
		-- upvalues: t_1 (write)
		t_1.annotationPlaceCount += 1
	end,
	incrementAnnotationUndo = function() --[[ line: 80 ]]
		-- upvalues: t_1 (write)
		t_1.annotationUndoCount += 1
	end,
	incrementAnnotationRedo = function() --[[ line: 83 ]]
		-- upvalues: t_1 (write)
		t_1.annotationRedoCount += 1
	end,
	setAnnotationNext = function() --[[ line: 86 ]]
		-- upvalues: t_1 (write)
		t_1.annotationNext = true
	end,
	getAccumulatedParameters = function() --[[ line: 90 ]]
		-- upvalues: t_1 (write)
		return t_1
	end,
	emitAvatarsIdentifiedStats = function(p0) --[[ line: 93 ]]
		-- upvalues: cryoModule (ref), var5 (write), eventIngest (ref), eventIngestService (ref), t (ref)
		local var6 = cryoModule.Dictionary.join(p0, { duration = p0.duration * 1000000 })
		
		if not var5 then
			var5 = eventIngest.new(eventIngestService)
		end
		var5:sendEventDeferred(t.Context.LegacyMenu, t.EventType.AvatarsIdentified, var6)
	end,
	clear = function() --[[ line: 103 ]]
		-- upvalues: t_1 (write)
		t_1 = {
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