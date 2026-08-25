local verifiedParentalConsentDialog = script:FindFirstAncestor("VerifiedParentalConsentDialog")
local reactModule = require(verifiedParentalConsentDialog.Parent.React)
local screenSizeContextModule = require(verifiedParentalConsentDialog.Hooks.ScreenSizeContext)

return function()
	-- upvalues: reactModule (ref), screenSizeContextModule (ref)
	return reactModule.useContext(screenSizeContextModule)
end