local parent = script.Parent.Parent
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)

return function(p0)
	-- upvalues: toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p1)
		-- upvalues: p0 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		if p1 == Enum.VideoCaptureResult.OtherError then
			p0(toastTriggeredModule(capturesToastTypeModule.VideoCaptureOtherError))
		end
	end
end