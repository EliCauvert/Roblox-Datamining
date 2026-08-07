local videoCaptureService = game:GetService("VideoCaptureService")
local var1 = nil
videoCaptureService.DevicesChanged:Connect(function() --[[ line: 4 ]]
	-- upvalues: var1 (write), videoCaptureService (ref)
	var1 = videoCaptureService:GetCameraDevices()
end)

return {
	GetDevices = function() --[[ line: 8 ]]
		-- upvalues: var1 (write), videoCaptureService (ref)
		if not var1 then
			var1 = videoCaptureService:GetCameraDevices()
		end
		return var1
	end
}