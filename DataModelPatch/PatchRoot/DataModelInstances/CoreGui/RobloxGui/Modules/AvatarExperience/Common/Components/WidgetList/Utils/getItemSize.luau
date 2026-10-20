local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.Types)

return function(p1, X, p2, p3, p4): Vector2
	-- upvalues: ConstantsModule (copy), UtilsModule (copy)
	local _Font = p1.Font
	
	return Vector2.new(X, UtilsModule.GridItemHeightGetter(p2 or ConstantsModule.ItemTileType.CatalogItemTile, _Font.Header2.RelativeSize * _Font.BaseSize + (p4 or 0), p3)(X))
end