local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local roduxModule = require(socialExperienceJoin.Parent.Rodux)
local myRoduxNetworkingModule = require(socialExperienceJoin.Networking.myRoduxNetworking)
local gamesModule = require(socialExperienceJoin.Rodux.Games)
local presenceModule = require(socialExperienceJoin.Rodux.Presence)

return function() --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), myRoduxNetworkingModule (ref), gamesModule (ref), presenceModule (ref)
	return roduxModule.combineReducers({
		NetworkStatus = myRoduxNetworkingModule.installReducer(),
		Games = gamesModule.installReducer(),
		Presence = presenceModule.installReducer()
	})
end