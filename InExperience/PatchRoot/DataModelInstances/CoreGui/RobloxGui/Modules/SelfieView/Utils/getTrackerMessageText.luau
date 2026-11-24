local TrackerMode = Enum.TrackerMode

return function(AudioVideo, Audio, p1)
	-- upvalues: TrackerMode (copy)
	local _ = p1.controlMessageMotion
	local _ = p1.controlMessageOff
	local ControlMessageOn = nil
	local ControlMessageMotion = nil
	
	if AudioVideo == TrackerMode.None then
		ControlMessageOn = p1.controlMessageOff
		ControlMessageMotion = if Audio == TrackerMode.Audio then p1.controlMessageSound else p1.controlMessageMotion
	else
		ControlMessageOn = p1.controlMessageOn
		ControlMessageMotion = if AudioVideo == TrackerMode.AudioVideo or AudioVideo == TrackerMode.Video then p1.controlMessageMotion else p1.controlMessageSound
	end
	return { text = ControlMessageMotion, status = ControlMessageOn }
end