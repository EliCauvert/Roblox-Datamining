local gameTile = script:FindFirstAncestor("GameTile")
local formatExperienceIconModule = require(gameTile.formatExperienceIcon)
local formatExperienceThumbnailModule = require(gameTile.formatExperienceThumbnail)
local resolveWideAssetIdModule = require(gameTile.resolveWideAssetId)

return function(p0)
	-- upvalues: resolveWideAssetIdModule (ref), formatExperienceThumbnailModule (ref), formatExperienceIconModule (ref)
	if p0.useGridTile then
		local var4 = resolveWideAssetIdModule(p0.perEntryWideAssetId, p0.game, p0.topicId)
		
		return if var4 or p0.placeId then formatExperienceThumbnailModule(var4, p0.placeId, p0.isEmphasized) else nil
	end
	return if p0.universeId then formatExperienceIconModule(p0.iconUrl, p0.universeId) else p0.iconUrl
end