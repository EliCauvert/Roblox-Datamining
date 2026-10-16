local SessionService = game:GetService("SessionService")
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.constants)
local TypeModule = require(Parent.type)

return function(Dismissed) --[[ Line: 6 ]]
	-- upvalues: TypeModule (copy), SessionService (copy), ConstantsModule (copy)
	if Dismissed == TypeModule.ToastNotificationActionsEnum.Display then
		SessionService:SetSession(ConstantsModule.ToastStructuralIdentifier.Level1, ConstantsModule.ToastStructuralIdentifier.ToastNotification, ConstantsModule.ToastStructuralIdentifier.ToastNotification)
		
		return
	end
	if Dismissed == TypeModule.ToastNotificationActionsEnum.Dismissed or Dismissed == TypeModule.ToastNotificationActionsEnum.Ignored then
		SessionService:RemoveSession(ConstantsModule.ToastStructuralIdentifier.ToastNotification)
	end
end