local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local _ = require(AmpV2Wizard.Types)
local CreateVpcNodeModule = require(AmpV2Wizard.Nodes.createVpcNode)
local ParentConsent = CreateVpcNodeModule("ParentConsent")
local ParentLink = CreateVpcNodeModule("ParentLink")

return function(p1)
	-- upvalues: ParentConsent (copy), ParentLink (copy)
	return if (p1.props.action or "ParentLink") == "ParentConsent" then ParentConsent(p1) else ParentLink(p1)
end