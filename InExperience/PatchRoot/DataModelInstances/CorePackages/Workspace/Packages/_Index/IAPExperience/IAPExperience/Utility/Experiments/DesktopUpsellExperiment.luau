local IXPServiceWrapper = require(script.Parent.Parent.Parent.Parent.IXPServiceWrapper).IXPServiceWrapper
local NewUpsellModalExperimentForDesktopV2 = game:DefineFastFlag("NewUpsellModalExperimentForDesktopV2", false)
local DesktopUpsellIXPLayer = game:DefineFastString("DesktopUpsellIXPLayer", "Payments.Optimization.InExperienceUpsell.Desktop.UI")
local Variants = { Control = 0, OpenRobuxStore = 1, OpenPaymentsPage = 2 }

return {
	variants = Variants,
	getVariant = function() --[[ Line: 14 ]]
		-- upvalues: NewUpsellModalExperimentForDesktopV2 (copy), Variants (copy), IXPServiceWrapper (copy), DesktopUpsellIXPLayer (copy)
		if NewUpsellModalExperimentForDesktopV2 then
			local LayerData = IXPServiceWrapper:GetLayerData(DesktopUpsellIXPLayer)
			
			return if LayerData and LayerData.newUpsellModalVariant ~= nil then LayerData.newUpsellModalVariant else Variants.Control
		else
			return Variants.Control
		end
	end,
	logExposure = function() --[[ Line: 29 ]]
		-- upvalues: NewUpsellModalExperimentForDesktopV2 (copy), IXPServiceWrapper (copy), DesktopUpsellIXPLayer (copy)
		if NewUpsellModalExperimentForDesktopV2 then
			IXPServiceWrapper:LogUserLayerExposure(DesktopUpsellIXPLayer)
			
			return
		end
	end,
	shouldShowNewModal = function(): boolean --[[ Line: 37 ]]
		-- upvalues: NewUpsellModalExperimentForDesktopV2 (copy), IXPServiceWrapper (copy), DesktopUpsellIXPLayer (copy), Variants (copy)
		if NewUpsellModalExperimentForDesktopV2 then
			IXPServiceWrapper:LogUserLayerExposure(DesktopUpsellIXPLayer)
		end
		local Control = nil
		if NewUpsellModalExperimentForDesktopV2 then
			local LayerData = IXPServiceWrapper:GetLayerData(DesktopUpsellIXPLayer)
			Control = if LayerData and LayerData.newUpsellModalVariant ~= nil then LayerData.newUpsellModalVariant else Variants.Control
		else
			Control = Variants.Control
		end
		return Control ~= Variants.Control
	end
}