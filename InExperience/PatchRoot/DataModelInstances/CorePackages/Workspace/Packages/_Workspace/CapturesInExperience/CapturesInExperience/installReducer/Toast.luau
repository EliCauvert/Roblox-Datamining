local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dashModule = require(parent_1.Dash)
local roduxModule = require(parent_1.Rodux)
local capturesToastTypeModule = require(parent.Enums.CapturesToastType)
local _ = require(parent.Types)

return roduxModule.createReducer({
	IsDismissed = false,
	ToastConfig = nil,
	ToastType = capturesToastTypeModule.None
}, {
	[require(parent.Actions.ToastVanished).name] = function(p1, _)
		-- upvalues: capturesToastTypeModule (ref)
		return if p1.ToastType == capturesToastTypeModule.None then p1 else {
			IsDismissed = false,
			ToastType = capturesToastTypeModule.None
		}
	end,
	[require(parent.Actions.ToastDismissed).name] = function(p1, _)
		-- upvalues: capturesToastTypeModule (ref), dashModule (ref)
		return if p1.IsDismissed then p1 elseif p1.ToastType == capturesToastTypeModule.None then p1 else dashModule.join(p1, { IsDismissed = true })
	end,
	[require(parent.Actions.ToastTriggered).name] = function(p1, p2)
		-- upvalues: dashModule (ref)
		return if p1.ToastType == p2.toastType and not p1.IsDismissed and dashModule.shallowEqual(p1.ToastConfig, p2.toastConfig) then p1 else {
			IsDismissed = false,
			ToastType = p2.toastType,
			ToastConfig = p2.toastConfig
		}
	end
})