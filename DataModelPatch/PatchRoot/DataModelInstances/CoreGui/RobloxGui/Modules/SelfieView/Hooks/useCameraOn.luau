local UseTrackerModeModule = require(script.Parent.useTrackerMode)

return function(): boolean
	-- upvalues: UseTrackerModeModule (copy)
	local UseTrackerModeModuleResult = UseTrackerModeModule()
	
	return UseTrackerModeModuleResult == Enum.TrackerMode.Video or UseTrackerModeModuleResult == Enum.TrackerMode.AudioVideo
end