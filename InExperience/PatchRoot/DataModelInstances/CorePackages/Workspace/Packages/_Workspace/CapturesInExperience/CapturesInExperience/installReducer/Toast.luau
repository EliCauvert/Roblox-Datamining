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
	[require(parent.Actions.ToastVanished).name] = function(p0, _) --[[ line: 26 ]]
		-- upvalues: capturesToastTypeModule (ref)
		return if p0.ToastType == capturesToastTypeModule.None then p0 else {
			IsDismissed = false,
			ToastType = capturesToastTypeModule.None
		}
	end,
	[require(parent.Actions.ToastDismissed).name] = function(p1, _) --[[ line: 37 ]]
		-- upvalues: capturesToastTypeModule (ref), dashModule (ref)
		return if p1.IsDismissed then p1 elseif p1.ToastType == capturesToastTypeModule.None then p1 else dashModule.join(p1, { IsDismissed = true })
	end,
	[require(parent.Actions.ToastTriggered).name] = function(p2, p3) --[[ line: 51 ]]
		-- upvalues: dashModule (ref)
		return if p2.ToastType == p3.toastType and not p2.IsDismissed and dashModule.shallowEqual(p2.ToastConfig, p3.toastConfig) then p2 else {
			IsDismissed = false,
			ToastType = p3.toastType,
			ToastConfig = p3.toastConfig
		}
	end
})