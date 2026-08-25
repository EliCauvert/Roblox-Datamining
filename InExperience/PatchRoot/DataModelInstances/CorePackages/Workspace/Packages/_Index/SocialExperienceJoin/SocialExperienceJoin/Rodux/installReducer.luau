local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local roduxModule = require(socialExperienceJoin.Parent.Rodux)
local myRoduxNetworkingModule = require(socialExperienceJoin.Networking.myRoduxNetworking)
local gamesModule = require(socialExperienceJoin.Rodux.Games)
local presenceModule = require(socialExperienceJoin.Rodux.Presence)
local fFlagSocialExperienceJoinPresenceStoreMigrationModule = require(socialExperienceJoin.Flags.FFlagSocialExperienceJoinPresenceStoreMigration)

return function()
	-- upvalues: roduxModule (ref), myRoduxNetworkingModule (ref), gamesModule (ref), fFlagSocialExperienceJoinPresenceStoreMigrationModule (ref), presenceModule (ref)
	return roduxModule.combineReducers({
		NetworkStatus = myRoduxNetworkingModule.installReducer(),
		Games = gamesModule.installReducer(),
		Presence = if fFlagSocialExperienceJoinPresenceStoreMigrationModule then nil else presenceModule.installReducer()
	})
end