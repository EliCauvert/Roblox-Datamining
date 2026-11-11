local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local GetBaseTileMediaCornersModule = require(script.Parent.getBaseTileMediaCorners)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), GetBaseTileMediaCornersModule (copy)
	return ReactModule.createElement("UICorner", GetBaseTileMediaCornersModule(UseTokensModule(), p1.isContained))
end)