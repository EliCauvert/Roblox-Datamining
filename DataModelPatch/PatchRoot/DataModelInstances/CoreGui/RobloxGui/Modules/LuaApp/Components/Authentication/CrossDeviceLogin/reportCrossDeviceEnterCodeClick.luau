local Modules = game:GetService("CoreGui").RobloxGui.Modules
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local GetFFlagEnableCrossDeviceLoginUsingQRCodesModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes)
local GetFFlagEnableCrossDeviceEnterCodeAuthButtonClickSchematizationModule = require(Modules.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeAuthButtonClickSchematization)

return function(p1, p2)
	-- upvalues: GetFFlagEnableCrossDeviceLoginUsingQRCodesModule (copy), GetFFlagEnableCrossDeviceEnterCodeAuthButtonClickSchematizationModule (copy), EventStreamConstantsModule (copy)
	if not GetFFlagEnableCrossDeviceLoginUsingQRCodesModule() then
		p1.reportButtonClicked(EventStreamConstantsModule.Context.QuickLogin, EventStreamConstantsModule.Button.EnterDeviceCode)
		
		return
	end
	if GetFFlagEnableCrossDeviceEnterCodeAuthButtonClickSchematizationModule() then
		p1.reportAuthButtonClick(EventStreamConstantsModule.Context.QuickLogin, EventStreamConstantsModule.Button.EnterDeviceCode, nil, nil, nil, nil, p2)
		
		return
	else
		p1.reportButtonClickedWithCType(EventStreamConstantsModule.Context.QuickLogin, EventStreamConstantsModule.Button.EnterDeviceCode, p2)
	end
end