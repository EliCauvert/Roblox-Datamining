local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local ampUpsellModule = require(socialUpsell.Parent.AmpUpsell)
local constantsModule = require(socialUpsell.Constants)
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local DEFAULT_FAE_ENTRY_POINT_EVENT_CTX = constantsModule.DEFAULT_FAE_ENTRY_POINT_EVENT_CTX
local fStringCommsFAEFeatureNameModule = require(socialUpsell.Flag.FStringCommsFAEFeatureName)
local fStringCommsFAENamespaceModule = require(socialUpsell.Flag.FStringCommsFAENamespace)

return function(p0, p1, p2)
	-- upvalues: DEFAULT_FAE_ENTRY_POINT_EVENT_CTX (ref), inExpAmpWizardController (ref), fStringCommsFAEFeatureNameModule (ref), accessResponseEnum (ref), fStringCommsFAENamespaceModule (ref)
	return inExpAmpWizardController.OpenAmpWizardContainerInExp(fStringCommsFAEFeatureNameModule, function(p3, _)
		-- upvalues: accessResponseEnum (copy), p1 (ref), p2 (ref)
		if p3 == accessResponseEnum.Granted then
			if p1 then
				p1()
				
				return
			end
		elseif p2 then
			p2()
		end
	end, nil, p0 or DEFAULT_FAE_ENTRY_POINT_EVENT_CTX, nil, fStringCommsFAENamespaceModule)
end