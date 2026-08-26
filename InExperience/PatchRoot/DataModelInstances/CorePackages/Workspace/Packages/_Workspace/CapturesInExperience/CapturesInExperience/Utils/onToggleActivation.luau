local parent = script.Parent.Parent
local capturesActivatedModule = require(parent.Actions.CapturesActivated)
local capturesDeactivatedModule = require(parent.Actions.CapturesDeactivated)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local toastDismissedModule = require(parent.Actions.ToastDismissed)
local toastTriggeredModule = require(parent.Actions.ToastTriggered)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: capturesActivatedModule (ref), toastTriggeredModule (ref), capturesToastTypeModule (ref), capturesDeactivatedModule (ref), toastDismissedModule (ref)
	if (not p2 or p2 == 1) and not p1 then
		p3(p5)
		p4(capturesActivatedModule())
		p4(toastTriggeredModule(capturesToastTypeModule.CapturesActivated))
		
		return
	elseif p1 then
		p3(p6)
		p4(capturesDeactivatedModule())
		p4(toastDismissedModule())
	end
end