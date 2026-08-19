local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local IXPService = game:GetService("IXPService")
local dependenciesModule = require(friendsLanding.dependencies)
local parent = friendsLanding.Parent
local IXPServiceWrapper = require(parent.IXPServiceWrapper).IXPServiceWrapper
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useGetFriendsCountByUserId = require(parent.FriendsHydrationReact).useGetFriendsCountByUserId
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
local fFlagFriendsCountDataHydrationMigrationEnabled = require(parent.SharedFlags).FFlagFriendsCountDataHydrationMigrationEnabled
local friendsLandingPageSize = game:DefineFastInt("FriendsLandingPageSize", 50)
local t = { skipFetch = true }
local t_1 = {
	[presenceType_1.Offline] = presenceType.Offline,
	[presenceType_1.Online] = presenceType.Online,
	[presenceType_1.InGame] = presenceType.InGame,
	[presenceType_1.InStudio] = presenceType.InStudio
}

function FriendsLandingContainer(_) --[[ line: 50 ]]
	-- upvalues: reactModule (ref), fFlagFixCohubExposureLayer (ref), IXPServiceWrapper (ref), appUserLayers (ref), IXPService (ref), useLocalUserId (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), useGetFriendsCountByUserId (ref), t (ref), useSelector (ref), getDeepValue (ref), useAppPolicy (ref), friendsLandingContextModule (ref), useFriendsListOrderedByPresence (ref), friendsLandingPageSize (ref), fFlagConnectionManagementChips (ref), useDecoratedTrustedConnections (ref), filterStatesModule (ref), cryoModule (ref), presenceType_1 (ref), getRbxthumbWithTypeSizeAndOptions (ref), userLibConstants (ref), t_1 (ref), presenceType (ref), friendsLandingPageModule (ref)
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: fFlagFixCohubExposureLayer (copy), IXPServiceWrapper (copy), appUserLayers (copy), IXPService (copy)
		if fFlagFixCohubExposureLayer then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
			
			return
		end
		IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
	end, {})
	local var12 = useLocalUserId()
	local var13 = if fFlagFriendsCountDataHydrationMigrationEnabled then useGetFriendsCountByUserId(if var12 then tostring(var12) else nil, t) or 0 else useSelector(function(p0) --[[ line: 66 ]]
		-- upvalues: getDeepValue (copy), var12 (ref)
		return getDeepValue(p0, `FriendsLanding.Friends.countsByUserId.{var12}`)
	end)
	local var14 = useAppPolicy(function(p1) --[[ line: 71 ]]
		return p1.getShowDisplayName()
	end)
	local var15 = reactModule.useContext(friendsLandingContextModule.Context)
	local var16 = useFriendsListOrderedByPresence({ userId = var12, pageSize = friendsLandingPageSize })
	local var17 = if fFlagConnectionManagementChips then useDecoratedTrustedConnections(var16.onlineFriends) else nil
	local var18 = reactModule.useMemo(function() --[[ line: 89 ]]
		-- upvalues: var16 (ref), var15 (ref), filterStatesModule (copy), cryoModule (copy), fFlagConnectionManagementChips (copy), var17 (write), presenceType_1 (copy)
		local t = {}
		
		if var16.onlineFriends and var16.offlineFriends then
			if var15.filter == filterStatesModule.All then
				return cryoModule.List.join(var16.onlineFriends, var16.offlineFriends)
			elseif var15.filter == filterStatesModule.Offline then
				return var16.offlineFriends
			elseif var15.filter == filterStatesModule.Online then
				return var16.onlineFriends
			elseif fFlagConnectionManagementChips and var15.filter == filterStatesModule.Trusted then
				return var17 or {}
			end
			t = cryoModule.List.filter(var16.onlineFriends, function(p2) --[[ line: 102 ]]
				-- upvalues: presenceType_1 (copy)
				return p2.presence and p2.presence.userPresenceType == presenceType_1.InGame
			end)
		end
		return t
	end, if fFlagConnectionManagementChips then {
		var15.filter,
		var16.onlineFriends,
		var16.offlineFriends,
		var17
	} else { var15.filter, var16.onlineFriends, var16.offlineFriends })
	local var19 = reactModule.useMemo(function() --[[ line: 115 ]]
		-- upvalues: cryoModule (copy), var18 (ref), getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t_1 (copy), presenceType (copy)
		return cryoModule.List.map(var18, function(p3, _) --[[ line: 116 ]]
			-- upvalues: getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t_1 (copy), presenceType (copy)
			return {
				username = "",
				id = p3.id,
				thumbnail = getRbxthumbWithTypeSizeAndOptions(p3.id, userLibConstants.RbxthumbTypes.Avatar, 352),
				userPresenceType = if p3.presence then t_1[p3.presence.userPresenceType] else presenceType.Offline,
				universeId = if p3.presence then p3.presence.universeId else nil,
				lastLocation = if p3.presence then p3.presence.lastLocation else nil
			}
		end)
	end, { var18 })
	
	return reactModule.createElement(friendsLandingPageModule, {
		totalFriendCount = var13,
		friends = if fFlagConnectionManagementChips then var19 or {} else var19,
		fetchMoreFriends = if var16 and not var16.isEndOfList then var16.fetchMoreFriends else nil,
		refreshFriends = var16.refreshFriendsData,
		enableDisplayNamePolicy = var14,
		localUserId = var12
	})
end

return FriendsLandingContainer