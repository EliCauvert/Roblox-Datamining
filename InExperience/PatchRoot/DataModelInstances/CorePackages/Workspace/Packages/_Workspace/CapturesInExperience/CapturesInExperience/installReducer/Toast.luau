local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local CapturesToastTypeModule = require(Parent.Enums.CapturesToastType)
local _ = require(Parent.Types)

return require(Parent1.Rodux).createReducer({
	IsDismissed = false,
	ToastConfig = nil,
	ToastType = CapturesToastTypeModule.None
}, {
	[require(Parent.Actions.ToastVanished).name] = function(p1, _) --[[ Line: 26 ]]
		-- upvalues: CapturesToastTypeModule (copy)
		return if p1.ToastType == CapturesToastTypeModule.None then p1 else {
			IsDismissed = false,
			ToastType = CapturesToastTypeModule.None
		}
	end,
	[require(Parent.Actions.ToastDismissed).name] = function(p1, _) --[[ Line: 37 ]]
		-- upvalues: CapturesToastTypeModule (copy), DashModule (copy)
		return if p1.IsDismissed then p1 elseif p1.ToastType == CapturesToastTypeModule.None then p1 else DashModule.join(p1, { IsDismissed = true })
	end,
	[require(Parent.Actions.ToastTriggered).name] = function(p1, p2) --[[ Line: 51 ]]
		-- upvalues: DashModule (copy)
		local ShallowEqualResult = DashModule.shallowEqual(p1.ToastConfig, p2.toastConfig)
		
		return if p1.ToastType == p2.toastType and not p1.IsDismissed and ShallowEqualResult then p1 else {
			IsDismissed = false,
			ToastType = p2.toastType,
			ToastConfig = p2.toastConfig
		}
	end
})