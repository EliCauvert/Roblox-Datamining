local ReactModule = require(game:GetService("CorePackages").Packages.React)
local SceneInteractionCallbacksContextModule = require(script.Parent.SceneInteractionCallbacksContext)

return function()
	-- upvalues: ReactModule (copy), SceneInteractionCallbacksContextModule (copy)
	return ReactModule.useContext(SceneInteractionCallbacksContextModule)
end