local parent = script.Parent.Parent
local IXPService = game:GetService("IXPService")
local useUserExperiment = require(parent.Parent.RoactAppExperiment).useUserExperiment
local fStringPVCIAfterSignupLayerModule = require(parent.Flags.FStringPVCIAfterSignupLayer)
local fStringPVCIAfterSignupVariantKeyModule = require(parent.Flags.FStringPVCIAfterSignupVariantKey)

local var1 = function(p1)
	-- upvalues: fStringPVCIAfterSignupLayerModule (ref), fStringPVCIAfterSignupVariantKeyModule (ref)
	return (p1[fStringPVCIAfterSignupLayerModule] or {})[fStringPVCIAfterSignupVariantKeyModule]
end

return {
	usePVAndCIAfterSignupVariant = function(value)
		-- upvalues: useUserExperiment (ref), fStringPVCIAfterSignupLayerModule (ref), var1 (ref)
		return useUserExperiment({ fStringPVCIAfterSignupLayerModule }, var1, (value or { isExposureEnabled = false }).isExposureEnabled)
	end,
	logExposure = function()
		-- upvalues: IXPService (ref), fStringPVCIAfterSignupLayerModule (ref)
		IXPService:LogUserLayerExposure(fStringPVCIAfterSignupLayerModule)
	end
}