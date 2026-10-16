local Parent = script.Parent.Parent
local _ = game:GetService("Players")
local _ = require(Parent.Actions.ErrorOccurred)
local _ = require(Parent.Actions.SetPromptState)
local UpsellFlowModule = require(Parent.Enums.UpsellFlow)
local _ = require(Parent.Enums.PromptState)
local _ = require(Parent.Enums.PurchaseError)
local HideWindowModule = require(Parent.Thunks.hideWindow)
local GetUpsellFlowModule = require(Parent.NativeUpsell.getUpsellFlow)
local AnalyticsModule = require(Parent.Services.Analytics)
local ExternalSettingsModule = require(Parent.Services.ExternalSettings)
local PlatformInterfaceModule = require(Parent.Services.PlatformInterface)
local ThunkModule = require(Parent.Thunk)
local _ = require(Parent.Promise)
local list = {
	AnalyticsModule,
	ExternalSettingsModule,
	require(Parent.Services.Network),
	PlatformInterfaceModule
}

return function(p1) --[[ Line: 26 | Named "openSecuritySettings" ]]
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), ExternalSettingsModule (copy), PlatformInterfaceModule (copy), GetUpsellFlowModule (copy), UpsellFlowModule (copy), HideWindowModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3) --[[ Line: 27 ]]
		-- upvalues: AnalyticsModule (upval), ExternalSettingsModule (upval), PlatformInterfaceModule (upval), GetUpsellFlowModule (upval), UpsellFlowModule (upval), p1 (copy), HideWindowModule (upval)
		local v1 = p3[AnalyticsModule]
		local v2 = p3[PlatformInterfaceModule]
		local State = p2:getState()
		
		if GetUpsellFlowModule(p3[ExternalSettingsModule].getPlatform()) == UpsellFlowModule.Web then
			v1.signalTwoSVSettingsErrorConfirmed(State.productInfo.productId, State.requestType)
			
			if p1 then
				v2.openSecuritySettings(p1)
			else
				v2.openSecuritySettings()
			end
		end
		p2:dispatch(HideWindowModule())
	end)
end