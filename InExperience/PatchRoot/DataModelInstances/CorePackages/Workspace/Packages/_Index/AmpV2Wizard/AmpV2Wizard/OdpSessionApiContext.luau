local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")

return (require(AmpV2Wizard.Parent.React).createContext((require(AmpV2Wizard.OdpSessionApiProvider))))