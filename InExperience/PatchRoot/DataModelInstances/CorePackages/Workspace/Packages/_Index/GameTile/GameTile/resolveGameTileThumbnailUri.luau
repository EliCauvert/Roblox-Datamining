local GameTile = script:FindFirstAncestor("GameTile")
local FormatExperienceIconModule = require(GameTile.formatExperienceIcon)
local FormatExperienceThumbnailModule = require(GameTile.formatExperienceThumbnail)
local ResolveWideAssetIdModule = require(GameTile.resolveWideAssetId)

return function(p1)
	-- upvalues: ResolveWideAssetIdModule (copy), FormatExperienceThumbnailModule (copy), FormatExperienceIconModule (copy)
	if p1.useGridTile then
		local ResolveWideAssetIdModuleResult = ResolveWideAssetIdModule(p1.perEntryWideAssetId, p1.game, p1.topicId)
		
		return if ResolveWideAssetIdModuleResult or p1.placeId then FormatExperienceThumbnailModule(ResolveWideAssetIdModuleResult, p1.placeId, p1.isEmphasized) else nil
	else
		return if p1.universeId then FormatExperienceIconModule(p1.iconUrl, p1.universeId) else p1.iconUrl
	end
end