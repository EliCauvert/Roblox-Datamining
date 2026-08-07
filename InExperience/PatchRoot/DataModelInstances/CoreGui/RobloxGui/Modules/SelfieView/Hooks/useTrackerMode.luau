local reactModule = require(game:GetService("CorePackages").Packages.React)
local videoCaptureService = game:GetService("VideoCaptureService")
local faceAnimatorService = game:GetService("FaceAnimatorService")
local faceChatUtilsModule = require(script.Parent.Parent.Utils.FaceChatUtils)
local var4 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.SelfView.Analytics).new()
local trackerMode = Enum.TrackerMode
local trackerMode_1 = faceChatUtilsModule.getTrackerMode()
local var6 = if trackerMode_1 ~= trackerMode.Video then trackerMode_1 == trackerMode.AudioVideo else true
local var7 = if trackerMode_1 ~= trackerMode.Audio then trackerMode_1 == trackerMode.AudioVideo else true

return function() --[[ line: 23 ]]
	-- upvalues: reactModule (ref), trackerMode (ref), faceChatUtilsModule (ref), var6 (write), var4 (ref), var7 (write), videoCaptureService (ref), faceAnimatorService (ref)
	local var8, var9 = reactModule.useState(trackerMode.None)
	local var10 = reactModule.useCallback(function() --[[ line: 26 ]]
		-- upvalues: faceChatUtilsModule (copy), trackerMode (copy), var6 (copy), var4 (copy), var7 (copy), var9 (ref)
		local trackerMode_1 = faceChatUtilsModule.getTrackerMode()
		local var12 = if trackerMode_1 ~= trackerMode.Video then trackerMode_1 == trackerMode.AudioVideo else true
		
		if var12 ~= var6 then
			var4:reportCamState(var12)
			var6 = var12
		end
		local var13 = if trackerMode_1 ~= trackerMode.Audio then trackerMode_1 == trackerMode.AudioVideo else true
		
		if var13 ~= var7 then
			var4:reportMicState(var13)
			var7 = var13
		end
		var9(trackerMode_1)
	end)
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: videoCaptureService (copy), var10 (ref), faceAnimatorService (copy)
		if videoCaptureService then
			var10()
			local startedConnection = videoCaptureService.Started:Connect(var10)
			local stoppedConnection = videoCaptureService.Stopped:Connect(var10)
			local devicesChangedConnection = videoCaptureService.DevicesChanged:Connect(var10)
			local var17 = faceAnimatorService:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(var10)
			local var18 = faceAnimatorService:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(var10)
			
			return function() --[[ line: 55 ]]
				-- upvalues: startedConnection (ref), stoppedConnection (ref), devicesChangedConnection (ref), var17 (ref), var18 (ref)
				startedConnection:Disconnect()
				stoppedConnection:Disconnect()
				devicesChangedConnection:Disconnect()
				var17:Disconnect()
				var18:Disconnect()
			end
		end
		return function() --[[ line: 63 ]] end
	end, {})
	
	return var8
end