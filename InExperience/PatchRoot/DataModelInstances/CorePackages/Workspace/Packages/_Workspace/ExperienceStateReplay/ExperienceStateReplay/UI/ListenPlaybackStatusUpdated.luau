local experienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local secondsToTimeStrModule = require(script.Parent.SecondsToTimeStr)

return {
	setupListener = function(value)
		-- upvalues: experienceStateRecordingService (ref), secondsToTimeStrModule (ref)
		experienceStateRecordingService.PlaybackStatusUpdated:Connect(function(p1, _)
			-- upvalues: value (ref), secondsToTimeStrModule (copy)
			value.ScrubberPlayProgress.Size = UDim2.new(p1, 0, 1, 0)
			
			if value.loadedLengthSeconds and value.replayToLoadedStartSeconds then
				value.CurrentTimeLabel.Text = secondsToTimeStrModule.convertSecondsToTimeStr(p1 * value.loadedLengthSeconds + value.replayToLoadedStartSeconds)
			end
		end)
	end
}