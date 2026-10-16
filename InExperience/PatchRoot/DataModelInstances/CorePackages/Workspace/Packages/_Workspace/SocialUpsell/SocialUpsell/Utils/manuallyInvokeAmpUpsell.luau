local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local AmpUpsellModule = require(SocialUpsell.Parent.AmpUpsell)
local InExpAmpWizardController = AmpUpsellModule.InExpAmpWizardController
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local DEFAULTFAEENTRYPOINTEVENTCTX = require(SocialUpsell.Constants).DEFAULT_FAE_ENTRY_POINT_EVENT_CTX
local FStringCommsFAEFeatureNameModule = require(SocialUpsell.Flag.FStringCommsFAEFeatureName)
local FStringCommsFAENamespaceModule = require(SocialUpsell.Flag.FStringCommsFAENamespace)

return function(p1, Callback, Callback1) --[[ Line: 14 ]]
	-- upvalues: DEFAULTFAEENTRYPOINTEVENTCTX (copy), InExpAmpWizardController (copy), FStringCommsFAEFeatureNameModule (copy), AccessResponseEnum (copy), FStringCommsFAENamespaceModule (copy)
	return InExpAmpWizardController.OpenAmpWizardContainerInExp(FStringCommsFAEFeatureNameModule, function(Granted, _) --[[ Line: 18 ]]
		-- upvalues: AccessResponseEnum (upval), Callback (copy), Callback1 (copy)
		if Granted == AccessResponseEnum.Granted then
			if Callback then
				Callback()
				
				return
			end
		elseif Callback1 then
			Callback1()
		end
	end, nil, p1 or DEFAULTFAEENTRYPOINTEVENTCTX, nil, FStringCommsFAENamespaceModule)
end