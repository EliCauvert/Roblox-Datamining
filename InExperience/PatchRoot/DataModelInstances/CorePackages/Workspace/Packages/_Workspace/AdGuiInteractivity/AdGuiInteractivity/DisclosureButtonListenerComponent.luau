local adService = game:GetService("AdService")
local adGuiInteractivity = script:FindFirstAncestor("AdGuiInteractivity")
local parent = adGuiInteractivity.Parent
local reactModule = require(parent.React)
local tModule = require(parent.t)
local getScreenPositionFromGuiObjectInputModule = require(adGuiInteractivity.getScreenPositionFromGuiObjectInput)
local immersiveBrandedAdMenuModule = require(adGuiInteractivity.ImmersiveBrandedAdMenu)
local adsInteractivityTelemetryModule = require(adGuiInteractivity.AdsInteractivityTelemetry)
local var7 = tModule.interface({
	disclosureButton = tModule.instanceIsA("GuiButton"),
	inputObject = tModule.instanceIsA("InputObject"),
	advertiserName = tModule.string,
	campaignId = tModule.string,
	immersiveBrandedAdId = tModule.string
})

return function() --[[ line: 35 ]]
	-- upvalues: reactModule (ref), adService (ref), var7 (ref), adsInteractivityTelemetryModule (ref), getScreenPositionFromGuiObjectInputModule (ref), immersiveBrandedAdMenuModule (ref)
	local var8, var9 = reactModule.useState(nil)
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: adService (copy), var7 (copy), adsInteractivityTelemetryModule (copy), var9 (ref), getScreenPositionFromGuiObjectInputModule (copy)
		function adService.OnImmersiveBrandedAdDisclosureButtonActivated(p0) --[[ line: 40 ]]
			-- upvalues: var7 (copy), adsInteractivityTelemetryModule (copy), var9 (copy), getScreenPositionFromGuiObjectInputModule (copy)
			local var10, _ = var7(p0)
			
			if var10 then
				adsInteractivityTelemetryModule.logImmersiveBrandedAdButtonClickCounter("disclosure")
				var9({
					menuScreenPosition = getScreenPositionFromGuiObjectInputModule(p0.disclosureButton, p0.inputObject),
					advertiserName = p0.advertiserName,
					campaignId = p0.campaignId,
					immersiveBrandedAdId = p0.immersiveBrandedAdId
				})
				
				return
			end
		end
		
		return function() --[[ line: 55 ]]
			-- upvalues: adService (copy)
			function adService.OnImmersiveBrandedAdDisclosureButtonActivated() --[[ line: 56 ]] end
		end
	end, {})
	
	return if var8 then reactModule.createElement(immersiveBrandedAdMenuModule, {
		screenPosition = var8.menuScreenPosition,
		advertiserName = var8.advertiserName,
		campaignId = var8.campaignId,
		immersiveBrandedAdId = var8.immersiveBrandedAdId,
		onDismiss = reactModule.useCallback(function() --[[ line: 60 ]]
			-- upvalues: var9 (ref)
			var9(nil)
		end, {})
	}) else nil
end