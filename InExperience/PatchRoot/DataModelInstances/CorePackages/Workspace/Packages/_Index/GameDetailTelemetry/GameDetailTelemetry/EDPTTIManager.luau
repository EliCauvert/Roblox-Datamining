local Parent = script:FindFirstAncestor("GameDetailTelemetry").Parent
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local PageGateModule = require(Parent.PageGate)
local FFlagEnablePLTPrefetchCallbacks = PageGateModule.FFlagEnablePLTPrefetchCallbacks
local EDPTTIConstantsModule = require(script.Parent.EDPTTIConstants)
local EnableEDPTTIManagerColdWarmDetection = game:DefineFastFlag("EnableEDPTTIManagerColdWarmDetection", false)
local EDPTTIEVENTNAME = EDPTTIConstantsModule.EDP_TTI_EVENT_NAME
local FIRSTMEDIARESOLVED = EDPTTIConstantsModule.EDP_MILESTONE.FIRST_MEDIA_RESOLVED
local Flag = false
local Flag1 = false
local Flag2 = false

return {
	startTracking = function(Page) --[[ Line: 22 ]]
		-- upvalues: Flag (ref), Flag1 (ref), Flag2 (ref), TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy), EnableEDPTTIManagerColdWarmDetection (copy)
		Flag = false
		Flag1 = false
		Flag2 = false
		local Event = TimeToInteractiveTracker.getEvents(false)[EDPTTIEVENTNAME]
		
		if not Event or not Event.startTime then
			TimeToInteractiveTracker.trackStart(EDPTTIEVENTNAME, if EnableEDPTTIManagerColdWarmDetection then true else nil)
			TimeToInteractiveTracker.updateMetadata(EDPTTIEVENTNAME, { page = Page })
		end
	end,
	restartTracking = function(Page) --[[ Line: 41 ]]
		-- upvalues: Flag (ref), Flag1 (ref), Flag2 (ref), TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy), EnableEDPTTIManagerColdWarmDetection (copy)
		Flag = false
		Flag1 = false
		Flag2 = false
		TimeToInteractiveTracker.trackStart(EDPTTIEVENTNAME, if EnableEDPTTIManagerColdWarmDetection then true else nil)
		TimeToInteractiveTracker.updateMetadata(EDPTTIEVENTNAME, { page = Page })
	end,
	setImplementation = function(Category) --[[ Line: 55 ]]
		-- upvalues: TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy)
		TimeToInteractiveTracker.updateMetadata(EDPTTIEVENTNAME, { category = Category })
	end,
	trackFunctionallyReady = function() --[[ Line: 61 ]]
		-- upvalues: Flag (ref), TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy), Milestone (copy), FFlagEnablePLTPrefetchCallbacks (copy), PageGateModule (copy)
		if Flag then return end
		Flag = true
		
		if TimeToInteractiveTracker.trackMilestone then
			TimeToInteractiveTracker.trackMilestone(EDPTTIEVENTNAME, Milestone.FunctionallyReady)
		end
		if FFlagEnablePLTPrefetchCallbacks then
			PageGateModule.signal(PageGateModule.Page.ExperienceDetail, PageGateModule.Milestone.FunctionallyReady)
		end
	end,
	trackFirstMediaResolved = function(Id) --[[ Line: 75 ]]
		-- upvalues: Flag2 (ref), TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy), FIRSTMEDIARESOLVED (copy)
		if Flag2 then return end
		Flag2 = true
		
		if TimeToInteractiveTracker.trackMilestone then
			TimeToInteractiveTracker.trackMilestone(EDPTTIEVENTNAME, FIRSTMEDIARESOLVED, { id = Id })
		end
	end,
	trackSurfaceReady = function(p1) --[[ Line: 86 ]]
		-- upvalues: Flag1 (ref), TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy), Milestone (copy)
		if Flag1 then return end
		Flag1 = true
		
		if p1 then
			TimeToInteractiveTracker.updateMetadata(EDPTTIEVENTNAME, p1)
		end
		if TimeToInteractiveTracker.trackMilestone then
			TimeToInteractiveTracker.trackMilestone(EDPTTIEVENTNAME, Milestone.SurfaceReady)
		end
		TimeToInteractiveTracker.trackEnd(EDPTTIEVENTNAME)
	end
}