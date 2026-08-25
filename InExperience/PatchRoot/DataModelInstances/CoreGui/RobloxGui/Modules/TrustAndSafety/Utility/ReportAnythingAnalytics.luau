local corePackagesService = game:GetService("CorePackages")
local eventIngestService = game:GetService("EventIngestService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local _ = require(corePackagesService.Workspace.Packages.TnSAvatarIdentification)
local eventIngest = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local t = {
	EventType = { AvatarsIdentified = "ReportAnythingAvatarsIdentified" },
	Context = { LegacyMenu = "ReportAbuseLegacyMenu" }
}

local _ = function()
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

local t_1 = {
	annotationOptionSeenCount = 0,
	annotationPageSeenCount = 0,
	annotationPlaceCount = 0,
	annotationUndoCount = 0,
	annotationRedoCount = 0,
	abandonedForRetake = false,
	isPortraitMode = false
}
local var5 = nil

local _ = function()
	-- upvalues: var5 (write), eventIngest (ref), eventIngestService (ref)
	if not var5 then
		var5 = eventIngest.new(eventIngestService)
	end
	return var5
end

return {
	incrementAnnotationOptionSeen = function()
		-- upvalues: t_1 (write)
		t_1.annotationOptionSeenCount += 1
	end,
	incrementAnnotationPageSeen = function()
		-- upvalues: t_1 (write)
		t_1.annotationPageSeenCount += 1
	end,
	incrementAnnotationPlace = function()
		-- upvalues: t_1 (write)
		t_1.annotationPlaceCount += 1
	end,
	incrementAnnotationUndo = function()
		-- upvalues: t_1 (write)
		t_1.annotationUndoCount += 1
	end,
	incrementAnnotationRedo = function()
		-- upvalues: t_1 (write)
		t_1.annotationRedoCount += 1
	end,
	setAbandonedForRetake = function()
		-- upvalues: t_1 (write)
		t_1.abandonedForRetake = true
	end,
	setIsPortraitMode = function()
		-- upvalues: t_1 (write)
		t_1.isPortraitMode = true
	end,
	getAccumulatedParameters = function()
		-- upvalues: t_1 (write)
		return t_1
	end,
	emitAvatarsIdentifiedStats = function(p0)
		-- upvalues: cryoModule (ref), var5 (write), eventIngest (ref), eventIngestService (ref), t (ref)
		local var6 = cryoModule.Dictionary.join(p0, { duration = p0.duration * 1000000 })
		
		if not var5 then
			var5 = eventIngest.new(eventIngestService)
		end
		var5:sendEventDeferred(t.Context.LegacyMenu, t.EventType.AvatarsIdentified, var6)
	end,
	clear = function()
		-- upvalues: t_1 (write)
		t_1 = {
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