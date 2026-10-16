local UseTrackerModeModule = require(script.Parent.useTrackerMode)

return function(): boolean --[[ Line: 5 | Named "useCameraOn" ]]
	-- upvalues: UseTrackerModeModule (copy)
	local UseTrackerModeModuleResult = UseTrackerModeModule()
	
	return UseTrackerModeModuleResult == Enum.TrackerMode.Video or UseTrackerModeModuleResult == Enum.TrackerMode.AudioVideo
end