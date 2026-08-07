local parent = script.Parent.Parent
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)

return function(p0) --[[ line: 6 | named "makeVideoCaptureStartFailedHandler" ]]
	-- upvalues: toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p1) --[[ line: 7 | named "videoCaptureStartFailedHandler" ]]
		-- upvalues: p0 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		if p1 == Enum.VideoCaptureStartedResult.CapturingAlready then
			p0(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationCapturingAlreadyError))
			
			return
		elseif p1 == Enum.VideoCaptureStartedResult.NoDeviceSupport then
			p0(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationNoDeviceSupportError))
			
			return
		elseif p1 == Enum.VideoCaptureStartedResult.NoSpaceOnDevice then
			p0(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationNoSpaceOnDeviceError))
			
			return
		elseif p1 == Enum.VideoCaptureStartedResult.OtherError then
			p0(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationOtherError))
		end
	end
end