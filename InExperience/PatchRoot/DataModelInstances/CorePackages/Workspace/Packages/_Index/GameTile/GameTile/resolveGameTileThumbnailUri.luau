local gameTile = script:FindFirstAncestor("GameTile")
local formatExperienceIconModule = require(gameTile.formatExperienceIcon)
local formatExperienceThumbnailModule = require(gameTile.formatExperienceThumbnail)
local resolveWideAssetIdModule = require(gameTile.resolveWideAssetId)

return function(p1)
	-- upvalues: resolveWideAssetIdModule (ref), formatExperienceThumbnailModule (ref), formatExperienceIconModule (ref)
	if p1.useGridTile then
		local var1 = resolveWideAssetIdModule(p1.perEntryWideAssetId, p1.game, p1.topicId)
		
		return if var1 or p1.placeId then formatExperienceThumbnailModule(var1, p1.placeId, p1.isEmphasized) else nil
	end
	return if p1.universeId then formatExperienceIconModule(p1.iconUrl, p1.universeId) else p1.iconUrl
end