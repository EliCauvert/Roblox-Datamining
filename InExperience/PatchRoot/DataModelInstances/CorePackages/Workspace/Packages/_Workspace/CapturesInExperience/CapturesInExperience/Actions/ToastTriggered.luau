local Parent = script.Parent.Parent
local _ = require(Parent.Enums.CapturesToastType)
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(ToastType, ToastConfig) --[[ Line: 16 ]]
	return { toastType = ToastType, toastConfig = ToastConfig }
end)