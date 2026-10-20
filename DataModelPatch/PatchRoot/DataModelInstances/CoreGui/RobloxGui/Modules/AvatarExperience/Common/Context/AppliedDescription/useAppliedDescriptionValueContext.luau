local ReactModule = require(game:GetService("CorePackages").Packages.React)
local AppliedDescriptionValueContextModule = require(script.Parent.AppliedDescriptionValueContext)

return function()
	-- upvalues: ReactModule (copy), AppliedDescriptionValueContextModule (copy)
	return ReactModule.useContext(AppliedDescriptionValueContextModule)
end