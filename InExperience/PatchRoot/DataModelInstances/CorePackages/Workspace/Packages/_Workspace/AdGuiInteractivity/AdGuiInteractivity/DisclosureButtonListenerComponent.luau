local adService = game:GetService("AdService")
local adGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local parent = adGuiInteractivity.Parent
local reactModule = require(parent.React)
local tModule = require(parent.t)
local getScreenPositionFromGuiObjectInputModule = require(adGuiInteractivity.getScreenPositionFromGuiObjectInput)
local immersiveBrandedAdMenuModule = require(adGuiInteractivity.ImmersiveBrandedAdMenu)
local adsInteractivityTelemetryModule = require(adGuiInteractivity.AdsInteractivityTelemetry)
local var1 = tModule.interface({
	disclosureButton = tModule.instanceIsA("GuiButton"),
	inputObject = tModule.instanceIsA("InputObject"),
	advertiserName = tModule.string,
	campaignId = tModule.string,
	immersiveBrandedAdId = tModule.string
})

return function()
	-- upvalues: reactModule (ref), adService (ref), var1 (ref), adsInteractivityTelemetryModule (ref), getScreenPositionFromGuiObjectInputModule (ref), immersiveBrandedAdMenuModule (ref)
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: adService (copy), var1 (copy), adsInteractivityTelemetryModule (copy), var3 (ref), getScreenPositionFromGuiObjectInputModule (copy)
		function adService.OnImmersiveBrandedAdDisclosureButtonActivated(p1)
			-- upvalues: var1 (copy), adsInteractivityTelemetryModule (copy), var3 (copy), getScreenPositionFromGuiObjectInputModule (copy)
			local var4, _ = var1(p1)
			
			if var4 then
				adsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("disclosure")
				var3({
					menuScreenPosition = getScreenPositionFromGuiObjectInputModule(p1.disclosureButton, p1.inputObject),
					advertiserName = p1.advertiserName,
					campaignId = p1.campaignId,
					immersiveBrandedAdId = p1.immersiveBrandedAdId
				})
				
				return
			end
		end
		
		return function()
			-- upvalues: adService (copy)
			function adService.OnImmersiveBrandedAdDisclosureButtonActivated() end
		end
	end, {})
	
	return if var2 then reactModule.createElement(immersiveBrandedAdMenuModule, {
		screenPosition = var2.menuScreenPosition,
		advertiserName = var2.advertiserName,
		campaignId = var2.campaignId,
		immersiveBrandedAdId = var2.immersiveBrandedAdId,
		onDismiss = reactModule.useCallback(function()
			-- upvalues: var3 (ref)
			var3(nil)
		end, {})
	}) else nil
end