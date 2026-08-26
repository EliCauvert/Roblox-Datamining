local IXPServiceWrapper = require(script.Parent.Parent.Parent.Parent.IXPServiceWrapper).IXPServiceWrapper
local newUpsellModalExperimentForDesktopV2 = game:DefineFastFlag("NewUpsellModalExperimentForDesktopV2", false)
local desktopUpsellIXPLayer = game:DefineFastString("DesktopUpsellIXPLayer", "Payments.Optimization.InExperienceUpsell.Desktop.UI")
local t = { Control = 0, OpenRobuxStore = 1, OpenPaymentsPage = 2 }

return {
	variants = t,
	getVariant = function()
		-- upvalues: newUpsellModalExperimentForDesktopV2 (ref), t (ref), IXPServiceWrapper (ref), desktopUpsellIXPLayer (ref)
		if not newUpsellModalExperimentForDesktopV2 then
			return t.Control
		end
		local var1 = IXPServiceWrapper:GetLayerData(desktopUpsellIXPLayer)
		
		return if var1 and var1.newUpsellModalVariant ~= nil then var1.newUpsellModalVariant else t.Control
	end,
	logExposure = function()
		-- upvalues: newUpsellModalExperimentForDesktopV2 (ref), IXPServiceWrapper (ref), desktopUpsellIXPLayer (ref)
		if newUpsellModalExperimentForDesktopV2 then
			IXPServiceWrapper:LogUserLayerExposure(desktopUpsellIXPLayer)
			
			return
		end
	end,
	shouldShowNewModal = function()
		-- upvalues: newUpsellModalExperimentForDesktopV2 (ref), IXPServiceWrapper (ref), desktopUpsellIXPLayer (ref), t (ref)
		local control
		if newUpsellModalExperimentForDesktopV2 then
			IXPServiceWrapper:LogUserLayerExposure(desktopUpsellIXPLayer)
		end
		if newUpsellModalExperimentForDesktopV2 then
			local var1 = IXPServiceWrapper:GetLayerData(desktopUpsellIXPLayer)
			control = if var1 and var1.newUpsellModalVariant ~= nil then var1.newUpsellModalVariant else t.Control
		else
			control = t.Control
		end
		return control ~= t.Control
	end
}