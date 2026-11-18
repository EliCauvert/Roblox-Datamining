local SduiSurfaceLoadTimeTracker = require(script:FindFirstAncestor("BuildExperience").Parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker

return function(p1, EventName, Page)
	-- upvalues: SduiSurfaceLoadTimeTracker (copy)
	local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(p1, { eventName = EventName, metadata = { page = Page } })
	LoadTimerWithSurfaceLoadTime.start(Page)
	
	if Page == "mount" then
		LoadTimerWithSurfaceLoadTime.logRenderStarted()
	end
	return LoadTimerWithSurfaceLoadTime
end