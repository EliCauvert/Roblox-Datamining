local ReactModule = require(game:GetService("CorePackages").Packages.React)
local AppliedDescriptionCallbackContextModule = require(script.Parent.AppliedDescriptionCallbackContext)

return function()
	-- upvalues: ReactModule (copy), AppliedDescriptionCallbackContextModule (copy)
	return ReactModule.useContext(AppliedDescriptionCallbackContextModule)
end