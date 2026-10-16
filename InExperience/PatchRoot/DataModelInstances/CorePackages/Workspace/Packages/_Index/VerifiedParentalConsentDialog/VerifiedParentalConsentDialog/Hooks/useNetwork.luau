local VerifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local ReactModule = require(VerifiedParentalConsentDialog.Parent.React)
local NetworkContextModule = require(VerifiedParentalConsentDialog.Hooks.NetworkContext)

return function() --[[ Line: 7 | Named "useNetwork" ]]
	-- upvalues: ReactModule (copy), NetworkContextModule (copy)
	return ReactModule.useContext(NetworkContextModule)
end