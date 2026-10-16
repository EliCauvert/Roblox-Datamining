local Parent = script.Parent.Parent
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)

return function(Callback) --[[ Line: 6 | Named "makeVideoCaptureFailedHandler" ]]
	-- upvalues: ToastTriggeredModule (copy), CapturesToastTypeModule (copy)
	return function(VideoCaptureResult) --[[ Line: 7 | Named "videoCaptureFailedHandler" ]]
		-- upvalues: Callback (copy), ToastTriggeredModule (upval), CapturesToastTypeModule (upval)
		if VideoCaptureResult == Enum.VideoCaptureResult.OtherError then
			Callback(ToastTriggeredModule(CapturesToastTypeModule.VideoCaptureOtherError))
		end
	end
end