local Parent = script:FindFirstAncestor("GameDetail").Parent
local SduiSurfaceLoadTimeTracker = require(Parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local EDPTTIConstants = require(Parent.GameDetailTelemetry).EDPTTIConstants
local EDPTTIEVENTNAME = EDPTTIConstants.EDP_TTI_EVENT_NAME
local FIRSTMEDIARESOLVED = EDPTTIConstants.EDP_MILESTONE.FIRST_MEDIA_RESOLVED

return function(p1, Metadata)
	-- upvalues: SduiSurfaceLoadTimeTracker (copy), EDPTTIEVENTNAME (copy), TimeToInteractiveTracker (copy), FIRSTMEDIARESOLVED (copy)
	local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(p1, {
		manualSurfaceReady = true,
		manualFunctionallyReady = true,
		startImmediately = true,
		eventName = EDPTTIEVENTNAME,
		metadata = Metadata
	})
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local v1 = nil
	local TrackSurfaceReadyFunction = LoadTimerWithSurfaceLoadTime.trackSurfaceReady
	
	local function _()
		-- upvalues: TrackSurfaceReadyFunction (copy), v1 (ref)
		TrackSurfaceReadyFunction(v1)
	end
	
	local function markPlayButtonReady()
		-- upvalues: Flag2 (ref), Flag1 (ref), TrackSurfaceReadyFunction (copy), v1 (ref)
		if Flag2 then return end
		Flag2 = true
		
		if Flag1 then
			TrackSurfaceReadyFunction(v1)
		end
	end
	
	function LoadTimerWithSurfaceLoadTime.trackSurfaceReady(p2)
		-- upvalues: Flag (ref), TimeToInteractiveTracker (upval), EDPTTIEVENTNAME (upval), FIRSTMEDIARESOLVED (upval), Flag1 (ref), v1 (ref), Flag2 (ref), TrackSurfaceReadyFunction (copy)
		if not Flag then
			Flag = true
			local MediaFound = if p2 then p2.mediaFound else nil
			TimeToInteractiveTracker.trackMilestone(EDPTTIEVENTNAME, FIRSTMEDIARESOLVED, {
				id = if MediaFound == true then "success" elseif MediaFound == false then "failed" else "unknown"
			})
		end
		if Flag1 then return end
		Flag1 = true
		v1 = p2
		
		if Flag2 then
			TrackSurfaceReadyFunction(v1)
		end
	end
	
	LoadTimerWithSurfaceLoadTime.markPlayButtonReady = markPlayButtonReady
	
	return LoadTimerWithSurfaceLoadTime
end