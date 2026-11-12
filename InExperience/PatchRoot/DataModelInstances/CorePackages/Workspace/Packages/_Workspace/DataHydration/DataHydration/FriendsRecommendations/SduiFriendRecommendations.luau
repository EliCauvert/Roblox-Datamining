local SduiFriendRecommendationsStoresByConfigKeyModule = require(script.Parent.SduiFriendRecommendationsStoresByConfigKey)
local FFlagPymkCarouselExtendProps = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagPymkCarouselExtendProps

return {
	RecommendationType = require(script.Parent.SduiRecommendationType),
	createStore = if FFlagPymkCarouselExtendProps then nil else require(script.Parent.createSduiFriendRecommendationsStore),
	getStore = if FFlagPymkCarouselExtendProps then SduiFriendRecommendationsStoresByConfigKeyModule.get else require(script.Parent.getSduiFriendRecommendationsStore),
	disposeStore = if FFlagPymkCarouselExtendProps then SduiFriendRecommendationsStoresByConfigKeyModule.dispose else nil,
	mapFromProto = require(script.Parent.mapSduiFriendRecommendationsFromProto)
}