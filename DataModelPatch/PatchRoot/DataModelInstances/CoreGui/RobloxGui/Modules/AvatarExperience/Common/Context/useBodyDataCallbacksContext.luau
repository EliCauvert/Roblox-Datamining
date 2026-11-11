local ReactModule = require(game:GetService("CorePackages").Packages.React)
local BodyDataCallbacksContextModule = require(script.Parent.BodyDataCallbacksContext)

return function()
	-- upvalues: ReactModule (copy), BodyDataCallbacksContextModule (copy)
	return ReactModule.useContext(BodyDataCallbacksContextModule)
end