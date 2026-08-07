local experienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local secondsToTimeStrModule = require(script.Parent.SecondsToTimeStr)

return {
	setupListener = function(value) --[[ line: 9 ]]
		-- upvalues: experienceStateRecordingService (ref), secondsToTimeStrModule (ref)
		experienceStateRecordingService.PlaybackStatusUpdated:Connect(function(p0, _) --[[ line: 10 ]]
			-- upvalues: value (ref), secondsToTimeStrModule (copy)
			value.ScrubberPlayProgress.Size = UDim2.new(p0, 0, 1, 0)
			
			if value.loadedLengthSeconds and value.replayToLoadedStartSeconds then
				value.CurrentTimeLabel.Text = secondsToTimeStrModule.convertSecondsToTimeStr(p0 * value.loadedLengthSeconds + value.replayToLoadedStartSeconds)
			end
		end)
	end
}