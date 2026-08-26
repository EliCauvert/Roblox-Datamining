local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local gameCollectionItemType = discoveryTypesModule.GameCollectionItemTypes.GameCollectionItemType
local omniRecommendationsContentType = discoveryTypesModule.OmniRecommendationsContentType
local videoEventInterfaceKeyModule = require(script.Parent.VideoEventInterfaceKey)
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile

return function(p1)
	-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (ref), gameCollectionItemType (ref), videoEventInterfaceKeyModule (ref), omniRecommendationsContentType (ref)
	return if not (not fFlagLuaAppEnableHomepageOneByTwoTile or p1.tileType ~= gameCollectionItemType.OneByTwoTile) then if p1.contentType == omniRecommendationsContentType.AdLink then videoEventInterfaceKeyModule.OneByTwoTileAdLink else videoEventInterfaceKeyModule.OneByTwoTileGame else videoEventInterfaceKeyModule.DefaultGameTile
end