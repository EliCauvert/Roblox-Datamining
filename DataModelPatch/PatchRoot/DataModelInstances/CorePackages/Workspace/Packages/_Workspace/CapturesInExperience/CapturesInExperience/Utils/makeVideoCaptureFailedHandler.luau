local Parent = script.Parent.Parent
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)

return function(Callback)
	-- upvalues: ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	return function(VideoCaptureResult)
		-- upvalues: Callback (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		if VideoCaptureResult == Enum.VideoCaptureResult.OtherError then
			Callback(ToastTriggeredModule(CapturesToastTypeModule.VideoCaptureOtherError))
		end
	end
end