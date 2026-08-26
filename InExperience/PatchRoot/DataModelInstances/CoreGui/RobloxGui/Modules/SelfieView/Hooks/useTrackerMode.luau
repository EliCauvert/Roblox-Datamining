local reactModule = require(game:GetService("CorePackages").Packages.React)
local videoCaptureService = game:GetService("VideoCaptureService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local faceChatUtilsModule = require(script.Parent.Parent.Utils.FaceChatUtils)
local var1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.SelfView.Analytics).new()
local trackerMode = Enum.TrackerMode
local trackerMode_1 = faceChatUtilsModule.getTrackerMode()
local var2 = if trackerMode_1 ~= trackerMode.Video then trackerMode_1 == trackerMode.AudioVideo else true
local var3 = if trackerMode_1 ~= trackerMode.Audio then trackerMode_1 == trackerMode.AudioVideo else true

return function()
	-- upvalues: reactModule (ref), trackerMode (ref), faceChatUtilsModule (ref), var2 (write), var1 (ref), var3 (write), videoCaptureService (ref), faceAnimatorService (ref)
	local var4, var5 = reactModule.useState(trackerMode.None)
	local var6 = reactModule.useCallback(function()
		-- upvalues: faceChatUtilsModule (copy), trackerMode (copy), var2 (copy), var1 (copy), var3 (copy), var5 (ref)
		local trackerMode_1 = faceChatUtilsModule.getTrackerMode()
		local var7 = if trackerMode_1 ~= trackerMode.Video then trackerMode_1 == trackerMode.AudioVideo else true
		
		if var7 ~= var2 then
			var1:reportCamState(var7)
			var2 = var7
		end
		local var8 = if trackerMode_1 ~= trackerMode.Audio then trackerMode_1 == trackerMode.AudioVideo else true
		
		if var8 ~= var3 then
			var1:reportMicState(var8)
			var3 = var8
		end
		var5(trackerMode_1)
	end)
	reactModule.useEffect(function()
		-- upvalues: videoCaptureService (copy), var6 (ref), faceAnimatorService (copy)
		if videoCaptureService then
			var6()
			local startedConnection = videoCaptureService.Started:Connect(var6)
			local stoppedConnection = videoCaptureService.Stopped:Connect(var6)
			local devicesChangedConnection = videoCaptureService.DevicesChanged:Connect(var6)
			local var7 = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(var6)
			local var8 = faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(var6)
			
			return function()
				-- upvalues: startedConnection (ref), stoppedConnection (ref), devicesChangedConnection (ref), var7 (ref), var8 (ref)
				startedConnection:Disconnect()
				stoppedConnection:Disconnect()
				devicesChangedConnection:Disconnect()
				var7:Disconnect()
				var8:Disconnect()
			end
		end
		return function() end
	end, {})
	
	return var4
end