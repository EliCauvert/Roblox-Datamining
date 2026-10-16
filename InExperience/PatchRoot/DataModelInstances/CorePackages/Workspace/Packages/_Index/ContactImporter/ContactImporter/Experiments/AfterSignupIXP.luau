local Parent = script.Parent.Parent
local IXPService = game:GetService("IXPService")
local UseUserExperimentFunction = require(Parent.Parent.RoactAppExperiment).useUserExperiment
local FStringPVCIAfterSignupLayerModule = require(Parent.Flags.FStringPVCIAfterSignupLayer)
local FStringPVCIAfterSignupVariantKeyModule = require(Parent.Flags.FStringPVCIAfterSignupVariantKey)

local function v4(p1) --[[ Line: 12 ]]
	-- upvalues: FStringPVCIAfterSignupLayerModule (copy), FStringPVCIAfterSignupVariantKeyModule (copy)
	return (p1[FStringPVCIAfterSignupLayerModule] or {})[FStringPVCIAfterSignupVariantKeyModule]
end

return {
	usePVAndCIAfterSignupVariant = function(p1) --[[ Line: 18 ]]
		-- upvalues: UseUserExperimentFunction (copy), FStringPVCIAfterSignupLayerModule (copy), v4 (copy)
		return (UseUserExperimentFunction({ FStringPVCIAfterSignupLayerModule }, v4, (p1 or { isExposureEnabled = false }).isExposureEnabled))
	end,
	logExposure = function() --[[ Line: 26 ]]
		-- upvalues: IXPService (copy), FStringPVCIAfterSignupLayerModule (copy)
		IXPService:LogUserLayerExposure(FStringPVCIAfterSignupLayerModule)
	end
}