local TimeToInteractiveTracker = require(script:FindFirstAncestor("GameDetailTelemetry").Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local EnableEDPTTIManagerColdWarmDetection = game:DefineFastFlag("EnableEDPTTIManagerColdWarmDetection", false)
local EDPTTIEVENTNAME = require(script.Parent.EDPTTIConstants).EDP_TTI_EVENT_NAME
local Flag = false
local Flag1 = false

return {
	startTracking = function(Page)
		-- upvalues: Flag (ref), Flag1 (ref), TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy), EnableEDPTTIManagerColdWarmDetection (copy)
		Flag = false
		Flag1 = false
		local Event = TimeToInteractiveTracker.getEvents(false)[EDPTTIEVENTNAME]
		
		if not Event or not Event.startTime then
			TimeToInteractiveTracker.trackStart(EDPTTIEVENTNAME, if EnableEDPTTIManagerColdWarmDetection then true else nil)
			TimeToInteractiveTracker.updateMetadata(EDPTTIEVENTNAME, { page = Page })
		end
	end,
	setImplementation = function(Category)
		-- upvalues: TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy)
		TimeToInteractiveTracker.updateMetadata(EDPTTIEVENTNAME, { category = Category })
	end,
	trackFunctionallyReady = function()
		-- upvalues: Flag (ref), TimeToInteractiveTracker (copy), EDPTTIEVENTNAME (copy), Milestone (copy)
		if Flag then return end
		Flag = true
		
		if TimeToInteractiveTracker.trackMilestone then
			TimeToInteractiveTracker.trackMilestone(EDPTTIEVENTNAME, Milestone.FunctionallyReady)
		end
	end,
	trackSurfaceReady = function(p1)
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