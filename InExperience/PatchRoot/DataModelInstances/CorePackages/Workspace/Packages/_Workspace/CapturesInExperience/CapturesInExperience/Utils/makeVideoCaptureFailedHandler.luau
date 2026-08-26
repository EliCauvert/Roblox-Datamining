local parent = script.Parent.Parent
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)

return function(p1)
	-- upvalues: toastTriggeredModule (ref), capturesToastTypeModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), toastTriggeredModule (copy), capturesToastTypeModule (copy)
		if p2 == Enum.VideoCaptureResult.OtherError then
			p1(toastTriggeredModule(capturesToastTypeModule.VideoCaptureOtherError))
		end
	end
end