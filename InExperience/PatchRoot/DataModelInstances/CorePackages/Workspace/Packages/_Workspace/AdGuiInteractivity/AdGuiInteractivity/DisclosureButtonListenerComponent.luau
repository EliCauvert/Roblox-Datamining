local AdService = game:GetService("AdService")
local AdGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local Parent = AdGuiInteractivity.Parent
local ReactModule = require(Parent.React)
local TModule = require(Parent.t)
local GetScreenPositionFromGuiObjectInputModule = require(AdGuiInteractivity.getScreenPositionFromGuiObjectInput)
local ImmersiveBrandedAdMenuModule = require(AdGuiInteractivity.ImmersiveBrandedAdMenu)
local AdsInteractivityTelemetryModule = require(AdGuiInteractivity.AdsInteractivityTelemetry)
local InterfaceResult = TModule.interface({
	disclosureButton = TModule.instanceIsA("GuiButton"),
	inputObject = TModule.instanceIsA("InputObject"),
	advertiserName = TModule.string,
	campaignId = TModule.string,
	immersiveBrandedAdId = TModule.string
})

return function() --[[ Line: 35 ]]
	-- upvalues: ReactModule (copy), AdService (copy), InterfaceResult (copy), AdsInteractivityTelemetryModule (copy), GetScreenPositionFromGuiObjectInputModule (copy), ImmersiveBrandedAdMenuModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: AdService (upval), InterfaceResult (upval), AdsInteractivityTelemetryModule (upval), UseStateResult2 (copy), GetScreenPositionFromGuiObjectInputModule (upval)
		function AdService.OnImmersiveBrandedAdDisclosureButtonActivated(p1) --[[ Line: 40 ]]
			-- upvalues: InterfaceResult (upval), AdsInteractivityTelemetryModule (upval), UseStateResult2 (upval), GetScreenPositionFromGuiObjectInputModule (upval)
			local InterfaceResultResult, _ = InterfaceResult(p1)
			
			if InterfaceResultResult then
				AdsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("disclosure")
				UseStateResult2({
					menuScreenPosition = GetScreenPositionFromGuiObjectInputModule(p1.disclosureButton, p1.inputObject),
					advertiserName = p1.advertiserName,
					campaignId = p1.campaignId,
					immersiveBrandedAdId = p1.immersiveBrandedAdId
				})
				
				return
			end
		end
		
		return function() --[[ Line: 55 ]]
			-- upvalues: AdService (upval)
			function AdService.OnImmersiveBrandedAdDisclosureButtonActivated() --[[ Line: 56 ]] end
		end
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 60 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	
	return if UseStateResult then ReactModule.createElement(ImmersiveBrandedAdMenuModule, {
		screenPosition = UseStateResult.menuScreenPosition,
		advertiserName = UseStateResult.advertiserName,
		campaignId = UseStateResult.campaignId,
		immersiveBrandedAdId = UseStateResult.immersiveBrandedAdId,
		onDismiss = UseResult
	}) else nil
end