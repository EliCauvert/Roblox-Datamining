local parent = script.Parent.Parent
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)

return function(p1)
	-- upvalues: toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		if p2 == Enum.VideoCaptureStartedResult.CapturingAlready then
			p1(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationCapturingAlreadyError))
			
			return
		elseif p2 == Enum.VideoCaptureStartedResult.NoDeviceSupport then
			p1(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationNoDeviceSupportError))
			
			return
		elseif p2 == Enum.VideoCaptureStartedResult.NoSpaceOnDevice then
			p1(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationNoSpaceOnDeviceError))
			
			return
		elseif p2 == Enum.VideoCaptureStartedResult.OtherError then
			p1(toastTriggeredModule(capturesToastTypeModule.VideoCaptureInitializationOtherError))
		end
	end
end