local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameCollectionItemType = DiscoveryTypesModule.GameCollectionItemTypes.GameCollectionItemType
local OmniRecommendationsContentType = DiscoveryTypesModule.OmniRecommendationsContentType
local VideoEventInterfaceKeyModule = require(script.Parent.VideoEventInterfaceKey)
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile

return function(p1)
	-- upvalues: FFlagLuaAppEnableHomepageOneByTwoTile (copy), GameCollectionItemType (copy), VideoEventInterfaceKeyModule (copy), OmniRecommendationsContentType (copy)
	local IsTileTypeMatch: boolean = FFlagLuaAppEnableHomepageOneByTwoTile and p1.tileType == GameCollectionItemType.OneByTwoTile
	
	return if IsTileTypeMatch then if p1.contentType == OmniRecommendationsContentType.AdLink then VideoEventInterfaceKeyModule.OneByTwoTileAdLink else VideoEventInterfaceKeyModule.OneByTwoTileGame else VideoEventInterfaceKeyModule.DefaultGameTile
end