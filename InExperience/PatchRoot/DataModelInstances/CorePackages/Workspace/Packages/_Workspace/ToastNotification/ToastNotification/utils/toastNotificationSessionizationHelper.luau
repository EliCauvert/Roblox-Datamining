local sessionService = game:GetService("SessionService")
local parent = script.Parent.Parent
local constantsModule = require(parent.constants)
local typeModule = require(parent.type)

return function(p0)
	-- upvalues: typeModule (ref), sessionService (ref), constantsModule (ref)
	if p0 == typeModule.ToastNotificationActionsEnum.Display then
		sessionService:SetSession(constantsModule.ToastStructuralIdentifier.Level1, constantsModule.ToastStructuralIdentifier.ToastNotification, constantsModule.ToastStructuralIdentifier.ToastNotification)
		
		return
	elseif p0 == typeModule.ToastNotificationActionsEnum.Dismissed or p0 == typeModule.ToastNotificationActionsEnum.Ignored then
		sessionService:RemoveSession(constantsModule.ToastStructuralIdentifier.ToastNotification)
	end
end