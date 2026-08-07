local IXPServiceWrapper = require(script.Parent.Parent.Parent.Parent.IXPServiceWrapper).IXPServiceWrapper
local newUpsellModalExperimentForDesktopV2 = game:DefineFastFlag("NewUpsellModalExperimentForDesktopV2", false)
local desktopUpsellIXPLayer = game:DefineFastString("DesktopUpsellIXPLayer", "Payments.Optimization.InExperienceUpsell.Desktop.UI")
local t = { Control = 0, OpenRobuxStore = 1, OpenPaymentsPage = 2 }

return {
	variants = t,
	getVariant = function() --[[ line: 14 ]]
		-- upvalues: newUpsellModalExperimentForDesktopV2 (ref), t (ref), IXPServiceWrapper (ref), desktopUpsellIXPLayer (ref)
		if not newUpsellModalExperimentForDesktopV2 then
			return t.Control
		end
		local var3 = IXPServiceWrapper:GetLayerData(desktopUpsellIXPLayer)
		
		return if var3 and var3.newUpsellModalVariant ~= nil then var3.newUpsellModalVariant else t.Control
	end,
	logExposure = function() --[[ line: 29 ]]
		-- upvalues: newUpsellModalExperimentForDesktopV2 (ref), IXPServiceWrapper (ref), desktopUpsellIXPLayer (ref)
		if newUpsellModalExperimentForDesktopV2 then
			IXPServiceWrapper:LogUserLayerExposure(desktopUpsellIXPLayer)
			
			return
		end
	end,
	shouldShowNewModal = function() --[[ line: 37 ]]
		-- upvalues: newUpsellModalExperimentForDesktopV2 (ref), IXPServiceWrapper (ref), desktopUpsellIXPLayer (ref), t (ref)
		local control
		if newUpsellModalExperimentForDesktopV2 then
			IXPServiceWrapper:LogUserLayerExposure(desktopUpsellIXPLayer)
		end
		if newUpsellModalExperimentForDesktopV2 then
			local var4 = IXPServiceWrapper:GetLayerData(desktopUpsellIXPLayer)
			control = if var4 and var4.newUpsellModalVariant ~= nil then var4.newUpsellModalVariant else t.Control
		else
			control = t.Control
		end
		return control ~= t.Control
	end
}