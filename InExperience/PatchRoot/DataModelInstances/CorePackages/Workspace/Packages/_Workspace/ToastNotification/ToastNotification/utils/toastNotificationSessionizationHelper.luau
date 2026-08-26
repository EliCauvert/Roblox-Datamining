local sessionService = game:GetService("SessionService")
local parent = script.Parent.Parent
local constantsModule = require(parent.constants)
local typeModule = require(parent.type)

return function(p1)
	-- upvalues: typeModule (ref), sessionService (ref), constantsModule (ref)
	if p1 == typeModule.ToastNotificationActionsEnum.Display then
		sessionService:SetSession(constantsModule.ToastStructuralIdentifier.Level1, constantsModule.ToastStructuralIdentifier.ToastNotification, constantsModule.ToastStructuralIdentifier.ToastNotification)
		
		return
	elseif p1 == typeModule.ToastNotificationActionsEnum.Dismissed or p1 == typeModule.ToastNotificationActionsEnum.Ignored then
		sessionService:RemoveSession(constantsModule.ToastStructuralIdentifier.ToastNotification)
	end
end