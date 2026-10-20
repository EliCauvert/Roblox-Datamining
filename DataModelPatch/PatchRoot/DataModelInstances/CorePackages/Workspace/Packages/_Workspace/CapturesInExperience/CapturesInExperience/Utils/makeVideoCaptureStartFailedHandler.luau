local Parent = script.Parent.Parent
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)

return function(Callback)
	-- upvalues: ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	return function(VideoCaptureStartedResult)
		-- upvalues: Callback (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		if VideoCaptureStartedResult == Enum.VideoCaptureStartedResult.CapturingAlready then
			Callback(ToastTriggeredModule(CapturesToastTypeModule.VideoCaptureInitializationCapturingAlreadyError))
			
			return
		end
		if VideoCaptureStartedResult == Enum.VideoCaptureStartedResult.NoDeviceSupport then
			Callback(ToastTriggeredModule(CapturesToastTypeModule.VideoCaptureInitializationNoDeviceSupportError))
			
			return
		end
		if VideoCaptureStartedResult == Enum.VideoCaptureStartedResult.NoSpaceOnDevice then
			Callback(ToastTriggeredModule(CapturesToastTypeModule.VideoCaptureInitializationNoSpaceOnDeviceError))
			
			return
		end
		if VideoCaptureStartedResult == Enum.VideoCaptureStartedResult.OtherError then
			Callback(ToastTriggeredModule(CapturesToastTypeModule.VideoCaptureInitializationOtherError))
		end
	end
end