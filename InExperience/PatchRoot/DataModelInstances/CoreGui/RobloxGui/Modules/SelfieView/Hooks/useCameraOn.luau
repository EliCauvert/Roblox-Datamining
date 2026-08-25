local useTrackerModeModule = require(script.Parent.useTrackerMode)

return function()
	-- upvalues: useTrackerModeModule (ref)
	local var1 = useTrackerModeModule()
	
	return if var1 ~= Enum.TrackerMode.Video then var1 == Enum.TrackerMode.AudioVideo else true
end