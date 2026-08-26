local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local ampUpsellModule = require(socialUpsell.Parent.AmpUpsell)
local constantsModule = require(socialUpsell.Constants)
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local DEFAULT_FAE_ENTRY_POINT_EVENT_CTX = constantsModule.DEFAULT_FAE_ENTRY_POINT_EVENT_CTX
local fStringCommsFAEFeatureNameModule = require(socialUpsell.Flag.FStringCommsFAEFeatureName)
local fStringCommsFAENamespaceModule = require(socialUpsell.Flag.FStringCommsFAENamespace)

return function(p1, p2, p3)
	-- upvalues: DEFAULT_FAE_ENTRY_POINT_EVENT_CTX (ref), inExpAmpWizardController (ref), fStringCommsFAEFeatureNameModule (ref), accessResponseEnum (ref), fStringCommsFAENamespaceModule (ref)
	return inExpAmpWizardController.OpenAmpWizardContainerInExp(fStringCommsFAEFeatureNameModule, function(p4, _)
		-- upvalues: accessResponseEnum (copy), p2 (ref), p3 (ref)
		if p4 == accessResponseEnum.Granted then
			if p2 then
				p2()
				
				return
			end
		elseif p3 then
			p3()
		end
	end, nil, p1 or DEFAULT_FAE_ENTRY_POINT_EVENT_CTX, nil, fStringCommsFAENamespaceModule)
end