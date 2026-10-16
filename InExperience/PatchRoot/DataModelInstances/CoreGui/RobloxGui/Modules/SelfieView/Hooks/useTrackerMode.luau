local ReactModule = require(game:GetService("CorePackages").Packages.React)
local VideoCaptureService = game:GetService("VideoCaptureService")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local FaceChatUtilsModule = require(script.Parent.Parent.Utils.FaceChatUtils)
local NewResult = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.SelfView.Analytics).new()
local TrackerMode = Enum.TrackerMode
local TrackerMode1 = FaceChatUtilsModule.getTrackerMode()
local IsTrackerModeMatch: boolean = TrackerMode1 == TrackerMode.Video or TrackerMode1 == TrackerMode.AudioVideo
local IsTrackerModeMatch1: boolean = TrackerMode1 == TrackerMode.Audio or TrackerMode1 == TrackerMode.AudioVideo

return function() --[[ Line: 23 ]]
	-- upvalues: ReactModule (copy), TrackerMode (copy), FaceChatUtilsModule (copy), IsTrackerModeMatch (ref), NewResult (copy), IsTrackerModeMatch1 (ref), VideoCaptureService (copy), FaceAnimatorService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(TrackerMode.None)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 26 ]]
		-- upvalues: FaceChatUtilsModule (upval), TrackerMode (upval), IsTrackerModeMatch (upval), NewResult (upval), IsTrackerModeMatch1 (upval), UseStateResult2 (copy)
		local TrackerMode1 = FaceChatUtilsModule.getTrackerMode()
		local IsTrackerModeMatch2: boolean = TrackerMode1 == TrackerMode.Video or TrackerMode1 == TrackerMode.AudioVideo
		
		if IsTrackerModeMatch2 ~= IsTrackerModeMatch then
			NewResult:reportCamState(IsTrackerModeMatch2)
			IsTrackerModeMatch = IsTrackerModeMatch2
		end
		local IsTrackerModeMatch3: boolean = TrackerMode1 == TrackerMode.Audio or TrackerMode1 == TrackerMode.AudioVideo
		
		if IsTrackerModeMatch3 ~= IsTrackerModeMatch1 then
			NewResult:reportMicState(IsTrackerModeMatch3)
			IsTrackerModeMatch1 = IsTrackerModeMatch3
		end
		UseStateResult2(TrackerMode1)
	end)
	ReactModule.useEffect(function() --[[ Line: 45 ]]
		-- upvalues: VideoCaptureService (upval), UseResult (copy), FaceAnimatorService (upval)
		if VideoCaptureService then
			UseResult()
			local StartedConnection = VideoCaptureService.Started:Connect(UseResult)
			local StoppedConnection = VideoCaptureService.Stopped:Connect(UseResult)
			local DevicesChangedConnection = VideoCaptureService.DevicesChanged:Connect(UseResult)
			local Connection = FaceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(UseResult)
			local Connection1 = FaceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(UseResult)
			
			return function() --[[ Line: 55 ]]
				-- upvalues: StartedConnection (copy), StoppedConnection (copy), DevicesChangedConnection (copy), Connection (copy), Connection1 (copy)
				StartedConnection:Disconnect()
				StoppedConnection:Disconnect()
				DevicesChangedConnection:Disconnect()
				Connection:Disconnect()
				Connection1:Disconnect()
			end
		else
			return function() --[[ Line: 63 ]] end
		end
	end, {})
	
	return UseStateResult
end