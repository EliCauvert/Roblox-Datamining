local videoCaptureService = game:GetService("VideoCaptureService")
local var1 = nil
videoCaptureService.DevicesChanged:Connect(function()
	-- upvalues: var1 (write), videoCaptureService (ref)
	var1 = videoCaptureService:GetCameraDevices()
end)

return {
	GetDevices = function()
		-- upvalues: var1 (write), videoCaptureService (ref)
		if not var1 then
			var1 = videoCaptureService:GetCameraDevices()
		end
		return var1
	end
}