local friendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local parent = friendsCarousel.Parent
local dependenciesModule = require(friendsCarousel.dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local roduxUserPermissions = dependenciesModule.RoduxUserPermissions
local roduxAnalytics = dependenciesModule.RoduxAnalytics
local usersModule = require(script.Parent.Users)
local friendsModule = require(script.Parent.Friends)
local presenceModule = require(script.Parent.Presence)
local showContactImporterParams = dependenciesModule.ShowContactImporterParams
local fFlagFriendsCarouselDeprecateUnusedReducers = require(parent.SharedFlags).FFlagFriendsCarouselDeprecateUnusedReducers

return function() --[[ line: 19 ]]
	-- upvalues: rodux (ref), fFlagFriendsCarouselDeprecateUnusedReducers (ref), usersModule (ref), friendsModule (ref), presenceModule (ref), roduxUserPermissions (ref), roduxNetworking (ref), showContactImporterParams (ref), roduxAnalytics (ref)
	return rodux.combineReducers({
		Users = if fFlagFriendsCarouselDeprecateUnusedReducers then nil else usersModule,
		Friends = friendsModule,
		Presence = if fFlagFriendsCarouselDeprecateUnusedReducers then nil else presenceModule,
		UserPermissions = if fFlagFriendsCarouselDeprecateUnusedReducers then nil else roduxUserPermissions.installReducer(),
		NetworkStatus = roduxNetworking.installReducer(),
		ShowContactImporterParams = if fFlagFriendsCarouselDeprecateUnusedReducers then nil else showContactImporterParams,
		Analytics = if fFlagFriendsCarouselDeprecateUnusedReducers then nil else roduxAnalytics.installReducer()
	})
end