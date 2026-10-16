local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local RoduxModule = require(SocialExperienceJoin.Parent.Rodux)
local MyRoduxNetworkingModule = require(SocialExperienceJoin.Networking.myRoduxNetworking)
local GamesModule = require(SocialExperienceJoin.Rodux.Games)
local PresenceModule = require(SocialExperienceJoin.Rodux.Presence)
local FFlagSocialExperienceJoinPresenceStoreMigrationModule = require(SocialExperienceJoin.Flags.FFlagSocialExperienceJoinPresenceStoreMigration)

return function() --[[ Line: 17 ]]
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy), GamesModule (copy), FFlagSocialExperienceJoinPresenceStoreMigrationModule (copy), PresenceModule (copy)
	return RoduxModule.combineReducers({
		NetworkStatus = MyRoduxNetworkingModule.installReducer(),
		Games = GamesModule.installReducer(),
		Presence = if FFlagSocialExperienceJoinPresenceStoreMigrationModule then nil else PresenceModule.installReducer()
	})
end