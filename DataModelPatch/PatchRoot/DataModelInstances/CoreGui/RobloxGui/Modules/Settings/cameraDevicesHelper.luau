local VideoCaptureService = game:GetService("VideoCaptureService")
local CameraDevices = nil
VideoCaptureService.DevicesChanged:Connect(function()
	-- upvalues: CameraDevices (ref), VideoCaptureService (copy)
	CameraDevices = VideoCaptureService:GetCameraDevices()
end)

return {
	GetDevices = function()
		-- upvalues: CameraDevices (ref), VideoCaptureService (copy)
		if not CameraDevices then
			CameraDevices = VideoCaptureService:GetCameraDevices()
		end
		return CameraDevices
	end
}