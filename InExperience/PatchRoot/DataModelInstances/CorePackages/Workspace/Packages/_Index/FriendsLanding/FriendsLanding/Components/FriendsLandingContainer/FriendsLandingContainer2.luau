local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local IXPService = game:GetService("IXPService")
local dependenciesModule = require(friendsLanding.dependencies)
local parent = friendsLanding.Parent
local IXPServiceWrapper = require(parent.IXPServiceWrapper).IXPServiceWrapper
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local getRbxthumbWithTypeSizeAndOptions = dependenciesModule.getRbxthumbWithTypeSizeAndOptions
local userLibConstants = dependenciesModule.UserLibConstants
local friendsLandingPageModule = require(friendsLanding.Components.FriendsLandingPage)
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local presenceType = dependenciesModule.RoduxPresence.Enums.PresenceType
local presenceType_1 = require(parent.GraphQLServer).types.PresenceType
local friendsCommonModule = require(parent.FriendsCommon)
local useFriendsListOrderedByPresence = friendsCommonModule.Hooks.useFriendsListOrderedByPresence
local useDecoratedTrustedConnections = friendsCommonModule.Hooks.useDecoratedTrustedConnections
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local fFlagFixCohubExposureLayer = require(parent.SharedFlags).FFlagFixCohubExposureLayer
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips
local friendsLandingPageSize = game:DefineFastInt("FriendsLandingPageSize", 50)
local t = {
	[presenceType_1.Offline] = presenceType.Offline,
	[presenceType_1.Online] = presenceType.Online,
	[presenceType_1.InGame] = presenceType.InGame,
	[presenceType_1.InStudio] = presenceType.InStudio
}

function FriendsLandingContainer(_) --[[ line: 46 ]]
	-- upvalues: reactModule (ref), fFlagFixCohubExposureLayer (ref), IXPServiceWrapper (ref), appUserLayers (ref), IXPService (ref), useLocalUserId (ref), useSelector (ref), getDeepValue (ref), useAppPolicy (ref), friendsLandingContextModule (ref), useFriendsListOrderedByPresence (ref), friendsLandingPageSize (ref), fFlagConnectionManagementChips (ref), useDecoratedTrustedConnections (ref), filterStatesModule (ref), cryoModule (ref), presenceType_1 (ref), getRbxthumbWithTypeSizeAndOptions (ref), userLibConstants (ref), t (ref), presenceType (ref), friendsLandingPageModule (ref)
	reactModule.useEffect(function() --[[ line: 47 ]]
		-- upvalues: fFlagFixCohubExposureLayer (copy), IXPServiceWrapper (copy), appUserLayers (copy), IXPService (copy)
		if fFlagFixCohubExposureLayer then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
			
			return
		end
		IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
	end, {})
	local var11 = useLocalUserId()
	local var12 = useSelector(function(p0) --[[ line: 56 ]]
		-- upvalues: getDeepValue (copy), var11 (ref)
		return getDeepValue(p0, `FriendsLanding.Friends.countsByUserId.{var11}`)
	end)
	local var13 = useAppPolicy(function(p1) --[[ line: 60 ]]
		return p1.getShowDisplayName()
	end)
	local var14 = reactModule.useContext(friendsLandingContextModule.Context)
	local var15 = useFriendsListOrderedByPresence({ userId = var11, pageSize = friendsLandingPageSize })
	local var16 = if fFlagConnectionManagementChips then useDecoratedTrustedConnections(var15.onlineFriends) else nil
	local var17 = reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: var15 (ref), var14 (ref), filterStatesModule (copy), cryoModule (copy), fFlagConnectionManagementChips (copy), var16 (write), presenceType_1 (copy)
		local t = {}
		
		if var15.onlineFriends and var15.offlineFriends then
			if var14.filter == filterStatesModule.All then
				return cryoModule.List.join(var15.onlineFriends, var15.offlineFriends)
			elseif var14.filter == filterStatesModule.Offline then
				return var15.offlineFriends
			elseif var14.filter == filterStatesModule.Online then
				return var15.onlineFriends
			elseif fFlagConnectionManagementChips and var14.filter == filterStatesModule.Trusted then
				return var16 or {}
			end
			t = cryoModule.List.filter(var15.onlineFriends, function(p2) --[[ line: 91 ]]
				-- upvalues: presenceType_1 (copy)
				return p2.presence and p2.presence.userPresenceType == presenceType_1.InGame
			end)
		end
		return t
	end, if fFlagConnectionManagementChips then {
		var14.filter,
		var15.onlineFriends,
		var15.offlineFriends,
		var16
	} else { var14.filter, var15.onlineFriends, var15.offlineFriends })
	local var18 = reactModule.useMemo(function() --[[ line: 104 ]]
		-- upvalues: cryoModule (copy), var17 (ref), getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t (copy), presenceType (copy)
		return cryoModule.List.map(var17, function(p3, _) --[[ line: 105 ]]
			-- upvalues: getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t (copy), presenceType (copy)
			return {
				username = "",
				id = p3.id,
				thumbnail = getRbxthumbWithTypeSizeAndOptions(p3.id, userLibConstants.RbxthumbTypes.Avatar, 352),
				userPresenceType = if p3.presence then t[p3.presence.userPresenceType] else presenceType.Offline,
				universeId = if p3.presence then p3.presence.universeId else nil,
				lastLocation = if p3.presence then p3.presence.lastLocation else nil
			}
		end)
	end, { var17 })
	
	return reactModule.createElement(friendsLandingPageModule, {
		totalFriendCount = var12,
		friends = if fFlagConnectionManagementChips then var18 or {} else var18,
		fetchMoreFriends = if var15 and not var15.isEndOfList then var15.fetchMoreFriends else nil,
		refreshFriends = var15.refreshFriendsData,
		enableDisplayNamePolicy = var13,
		localUserId = var11
	})
end

return FriendsLandingContainer