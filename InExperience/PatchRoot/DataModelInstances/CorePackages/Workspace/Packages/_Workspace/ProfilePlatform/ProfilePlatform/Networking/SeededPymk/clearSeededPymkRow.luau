local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local FriendRecommendations = require(Parent.DataHydration.FriendsRecommendations).FriendRecommendations
local GetSeededPymkConfigKeyModule = require(script.Parent.getSeededPymkConfigKey)
local FFlagSduiReleaseSearchResultsPageState = require(Parent.SharedFlags).FFlagSduiReleaseSearchResultsPageState

return function(p1, p2)
	-- upvalues: GetSeededPymkConfigKeyModule (copy), FriendRecommendations (copy), FFlagSduiReleaseSearchResultsPageState (copy), GetSduiApiStoreFunction (copy)
	local SeededPymkConfigKeyModule = GetSeededPymkConfigKeyModule(p1, p2)
	FriendRecommendations.disposeStore(SeededPymkConfigKeyModule)
	
	if FFlagSduiReleaseSearchResultsPageState then
		GetSduiApiStoreFunction().releaseConfigKey(SeededPymkConfigKeyModule)
	end
end