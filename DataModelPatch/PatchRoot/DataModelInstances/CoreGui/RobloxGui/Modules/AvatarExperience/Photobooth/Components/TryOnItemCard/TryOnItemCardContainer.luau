local ReactModule = require(game:GetService("CorePackages").Packages.React)
local TryOnItemCardModule = require(script.Parent.TryOnItemCard)
local UseTryOnItemCardPropsModule = require(script.Parent.useTryOnItemCardProps)

return ReactModule.memo(function(p1)
	-- upvalues: UseTryOnItemCardPropsModule (copy), ReactModule (copy), TryOnItemCardModule (copy)
	return ReactModule.createElement(TryOnItemCardModule, (UseTryOnItemCardPropsModule(p1)))
end)