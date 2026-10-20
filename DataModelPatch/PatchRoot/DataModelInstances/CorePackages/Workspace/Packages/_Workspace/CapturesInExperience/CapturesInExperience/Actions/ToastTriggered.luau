local Parent = script.Parent.Parent
local _ = require(Parent.Enums.CapturesToastType)
local _ = require(Parent.Types)

return require(Parent.Parent.Rodux).makeActionCreator(script.Name, function(ToastType, ToastConfig)
	return { toastType = ToastType, toastConfig = ToastConfig }
end)