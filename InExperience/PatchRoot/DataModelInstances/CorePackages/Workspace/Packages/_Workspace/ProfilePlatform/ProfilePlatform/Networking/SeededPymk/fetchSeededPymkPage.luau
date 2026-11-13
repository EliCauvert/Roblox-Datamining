local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local FriendRecommendations = require(Parent.DataHydration.FriendsRecommendations).FriendRecommendations
local GetSeededPymkConfigKeyModule = require(script.Parent.getSeededPymkConfigKey)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "friend-recommendations/v1/seeded-recommendations",
	base = require(Parent.Http).Url.APIS_URL,
	query = { seedUserId = "{seedUserId}" }
})

return function(p1, SeedUserId, SurfaceKey)
	-- upvalues: GetSeededPymkConfigKeyModule (copy), Parent (copy), SduiLoadTimer (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), NewResult (copy), FriendRecommendations (copy)
	local SeededPymkConfigKeyModule = GetSeededPymkConfigKeyModule(p1, SeedUserId)
	local SeededPymk = SduiLoadTimer.createLoadTimer("SeededPymk")
	
	return GetSduiApiStoreFunction().fetchIfNeeded({
		allowNoConfigsBuilt = true,
		clearOnEmptyResponse = true,
		replaceOnFetch = true,
		responseType = SduiResponseType.ProtobufJson,
		url = NewResult({ seedUserId = SeedUserId }),
		surfaceKey = SurfaceKey,
		configKey = SeededPymkConfigKeyModule,
		loadTimer = SeededPymk,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.friendrecommendations.seeded_recommendations_page.SeededRecommendationsResponse,
		onSuccess = function(_, p2)
			-- upvalues: FriendRecommendations (upval), SeededPymkConfigKeyModule (copy), SeededPymk (copy)
			local HydrationData = if p2 then p2.hydration_data else nil
			local FriendRecommendation = if HydrationData then HydrationData.friend_recommendation else nil
			FriendRecommendations.getStore(SeededPymkConfigKeyModule).replaceFriendRecommendations(if FriendRecommendation then FriendRecommendations.mapFromProto(FriendRecommendation) else {})
			SeededPymk.logRefreshComplete()
		end
	})
end