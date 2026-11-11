local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local _ = require(AmpV2Wizard.Types)
local FFlagAmpV2WizardRetryAmpModule = require(AmpV2Wizard.Flags.FFlagAmpV2WizardRetryAmp)
local RemoteParentRequestNodeModule = require(AmpV2Wizard.Nodes.RemoteParentRequestNode)
local Default = {
	TextScreen = { component = require(AmpV2Wizard.Nodes.TextScreenNode) },
	OdpHandoff = {
		fillsViewport = true,
		component = require(AmpV2Wizard.Nodes.OdpHandoffNode)
	},
	CreateOdpSession = {
		ownsLoadingState = true,
		component = require(AmpV2Wizard.Nodes.CreateOdpSessionNode)
	},
	PinEntry = {
		fillsViewport = true,
		component = require(AmpV2Wizard.Nodes.PinEntryNode)
	},
	UserAgreement = {
		fillsViewport = true,
		component = require(AmpV2Wizard.Nodes.UserAgreementNode)
	},
	AgreementConsents = {
		fillsViewport = true,
		component = require(AmpV2Wizard.Nodes.AgreementConsentsNode)
	},
	VerificationMethodSelection = {
		fillsViewport = true,
		component = require(AmpV2Wizard.Nodes.VerificationMethodSelectionNode)
	},
	SessionPolling = {
		ownsLoadingState = true,
		component = require(AmpV2Wizard.Nodes.SessionPollingNode)
	},
	Redirect = {
		ownsLoadingState = true,
		component = require(AmpV2Wizard.Nodes.RedirectNode)
	},
	RemoteParentRequest = {
		ownsLoadingState = true,
		component = RemoteParentRequestNodeModule
	},
	OdpAgeEstimation = {
		ownsLoadingState = true,
		component = require(AmpV2Wizard.Nodes.OdpAgeEstimationNode)
	},
	OdpGovernmentId = {
		ownsLoadingState = true,
		component = require(AmpV2Wizard.Nodes.OdpGovernmentIdNode)
	}
}
local ComponentRegistry = {
	default = Default,
	get = function(p1, p2)
		local v1 = p1[p2]
		
		return if v1 then v1.component else nil
	end,
	ownsLoadingState = function(p1, p2): boolean
		local v1 = p1[p2]
		
		return v1 ~= nil and v1.ownsLoadingState == true
	end,
	fillsViewport = function(p1, p2): boolean
		local v1 = p1[p2]
		
		return v1 ~= nil and v1.fillsViewport == true
	end
}

function ComponentRegistry.capabilities(p1)
	-- upvalues: Default (copy), FFlagAmpV2WizardRetryAmpModule (copy), ComponentRegistry (copy), RemoteParentRequestNodeModule (copy)
	local P6 = p1 or Default
	local List = {}
	
	for i in P6 do
		table.insert(List, i)
	end
	if FFlagAmpV2WizardRetryAmpModule and ComponentRegistry.get(P6, "RemoteParentRequest") == RemoteParentRequestNodeModule then
		table.insert(List, "RemoteParentRequestRetryAmp")
	end
	table.sort(List)
	
	return List
end

return ComponentRegistry