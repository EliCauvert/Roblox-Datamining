local parent = script.Parent.Parent
local capturesActivatedModule = require(parent.Actions.CapturesActivated)
local capturesDeactivatedModule = require(parent.Actions.CapturesDeactivated)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastDismissedModule = require(parent.Actions.ToastDismissed)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: capturesActivatedModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref), capturesDeactivatedModule (ref), toastDismissedModule (ref)
	if (not p1 or p1 == 1) and not p0 then
		p2(p4)
		p3(capturesActivatedModule())
		p3(toastTriggeredModule(capturesToastTypeModule.CapturesActivated))
		
		return
	elseif p0 then
		p2(p5)
		p3(capturesDeactivatedModule())
		p3(toastDismissedModule())
	end
end