local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local RoduxModule = require(SocialExperienceJoin.Parent.Rodux)
local MyRoduxNetworkingModule = require(SocialExperienceJoin.Networking.myRoduxNetworking)
local GamesModule = require(SocialExperienceJoin.Rodux.Games)
local PresenceModule = require(SocialExperienceJoin.Rodux.Presence)

return function()
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy), GamesModule (copy), PresenceModule (copy)
	return RoduxModule.combineReducers({
		NetworkStatus = MyRoduxNetworkingModule.installReducer(),
		Games = GamesModule.installReducer(),
		Presence = PresenceModule.installReducer()
	})
end