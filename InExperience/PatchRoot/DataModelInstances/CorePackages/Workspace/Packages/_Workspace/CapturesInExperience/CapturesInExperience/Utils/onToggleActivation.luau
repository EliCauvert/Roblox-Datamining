local Parent = script.Parent.Parent
local CapturesActivatedModule = require(Parent.Actions.CapturesActivated)
local CapturesDeactivatedModule = require(Parent.Actions.CapturesDeactivated)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local ToastDismissedModule = require(Parent.Actions.ToastDismissed)
local ToastTriggeredModule = require(Parent.Actions.ToastTriggered)

return function(p1, p2, Callback: (any) -> (), Callback1: (any) -> (), p3, p4) --[[ Line: 9 ]]
	-- upvalues: CapturesActivatedModule (copy), ToastTriggeredModule (copy), CapturesToastTypeModule (copy), CapturesDeactivatedModule (copy), ToastDismissedModule (copy)
	if (not p2 or p2 == 1) and not p1 then
		Callback(p3)
		Callback1(CapturesActivatedModule())
		Callback1(ToastTriggeredModule(CapturesToastTypeModule.CapturesActivated))
		
		return
	end
	if p1 then
		Callback(p4)
		Callback1(CapturesDeactivatedModule())
		Callback1(ToastDismissedModule())
	end
end