local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameCollectionItemType = DiscoveryTypesModule.GameCollectionItemTypes.GameCollectionItemType
local OmniRecommendationsContentType = DiscoveryTypesModule.OmniRecommendationsContentType
local VideoEventInterfaceKeyModule = require(script.Parent.VideoEventInterfaceKey)
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning

return function(p1)
	-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (copy), GameCollectionItemType (copy), VideoEventInterfaceKeyModule (copy), OmniRecommendationsContentType (copy)
	local IsTileTypeMatch: boolean = FFlagLuaAppEnableNxMRoduxApportioning and p1.tileType == GameCollectionItemType.OneByTwoTile
	
	return if IsTileTypeMatch then if p1.contentType == OmniRecommendationsContentType.AdLink then VideoEventInterfaceKeyModule.OneByTwoTileAdLink else VideoEventInterfaceKeyModule.OneByTwoTileGame else VideoEventInterfaceKeyModule.DefaultGameTile
end