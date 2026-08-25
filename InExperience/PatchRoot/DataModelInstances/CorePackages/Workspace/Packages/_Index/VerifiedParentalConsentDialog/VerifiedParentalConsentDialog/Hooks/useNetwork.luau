local verifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local reactModule = require(verifiedParentalConsentDialog.Parent.React)
local networkContextModule = require(verifiedParentalConsentDialog.Hooks.NetworkContext)

return function()
	-- upvalues: reactModule (ref), networkContextModule (ref)
	return reactModule.useContext(networkContextModule)
end