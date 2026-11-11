local VerifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local ReactModule = require(VerifiedParentalConsentDialog.Parent.React)
local ScreenSizeContextModule = require(VerifiedParentalConsentDialog.Hooks.ScreenSizeContext)

return function()
	-- upvalues: ReactModule (copy), ScreenSizeContextModule (copy)
	return ReactModule.useContext(ScreenSizeContextModule)
end