local parent = script.Parent.Parent
local _ = game:GetService("Players")
local _ = require(parent.Actions.ErrorOccurred)
local _ = require(parent.Actions.SetPromptState)
local upsellFlowModule = require(parent.Enums.UpsellFlow)
local _ = require(parent.Enums.PromptState)
local _ = require(parent.Enums.PurchaseError)
local hideWindowModule = require(parent.Thunks.hideWindow)
local getUpsellFlowModule = require(parent.NativeUpsell.getUpsellFlow)
local analyticsModule = require(parent.Services.Analytics)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local networkModule = require(parent.Services.Network)
local platformInterfaceModule = require(parent.Services.PlatformInterface)
local thunkModule = require(parent.Thunk)
local _ = require(parent.Promise)
local list = {
	analyticsModule,
	externalSettingsModule,
	networkModule,
	platformInterfaceModule
}

return function(value)
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), externalSettingsModule (ref), platformInterfaceModule (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), hideWindowModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1)
		-- upvalues: analyticsModule (copy), externalSettingsModule (copy), platformInterfaceModule (copy), getUpsellFlowModule (copy), upsellFlowModule (copy), value (ref), hideWindowModule (copy)
		local var9 = p1[analyticsModule]
		local var10 = p1[externalSettingsModule]
		local var11 = p1[platformInterfaceModule]
		local state = p0:getState()
		
		if getUpsellFlowModule(var10.getPlatform()) == upsellFlowModule.Web then
			var9.signalTwoSVSettingsErrorConfirmed(state.productInfo.productId, state.requestType)
			
			if value then
				var11.openSecuritySettings(value)
			else
				var11.openSecuritySettings()
			end
		end
		p0:dispatch(hideWindowModule())
	end)
end