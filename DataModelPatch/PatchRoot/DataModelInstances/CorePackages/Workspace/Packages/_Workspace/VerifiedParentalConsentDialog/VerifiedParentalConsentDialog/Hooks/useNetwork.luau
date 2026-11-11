local VerifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local ReactModule = require(VerifiedParentalConsentDialog.Parent.React)
local NetworkContextModule = require(VerifiedParentalConsentDialog.Hooks.NetworkContext)

return function()
	-- upvalues: ReactModule (copy), NetworkContextModule (copy)
	return ReactModule.useContext(NetworkContextModule)
end