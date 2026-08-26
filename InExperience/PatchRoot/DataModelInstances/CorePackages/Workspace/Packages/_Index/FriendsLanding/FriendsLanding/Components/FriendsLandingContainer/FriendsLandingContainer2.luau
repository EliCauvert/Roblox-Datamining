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

function FriendsLandingContainer(_)
	-- upvalues: reactModule (ref), fFlagFixCohubExposureLayer (ref), IXPServiceWrapper (ref), appUserLayers (ref), IXPService (ref), useLocalUserId (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), useGetFriendsCountByUserId (ref), t (ref), useSelector (ref), getDeepValue (ref), useAppPolicy (ref), friendsLandingContextModule (ref), useFriendsListOrderedByPresence (ref), friendsLandingPageSize (ref), fFlagConnectionManagementChips (ref), useDecoratedTrustedConnections (ref), filterStatesModule (ref), cryoModule (ref), presenceType_1 (ref), getRbxthumbWithTypeSizeAndOptions (ref), userLibConstants (ref), t_1 (ref), presenceType (ref), friendsLandingPageModule (ref)
	reactModule.useEffect(function()
		-- upvalues: fFlagFixCohubExposureLayer (copy), IXPServiceWrapper (copy), appUserLayers (copy), IXPService (copy)
		if fFlagFixCohubExposureLayer then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
			
			return
		end
		IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
	end, {})
	local var1 = useLocalUserId()
	local var2 = if fFlagFriendsCountDataHydrationMigrationEnabled then useGetFriendsCountByUserId(if var1 then tostring(var1) else nil, t) or 0 else useSelector(function(p1)
		-- upvalues: getDeepValue (copy), var1 (ref)
		return getDeepValue(p1, `FriendsLanding.Friends.countsByUserId.{var1}`)
	end)
	local var3 = useAppPolicy(function(p1)
		return p1.getShowDisplayName()
	end)
	local var4 = reactModule.useContext(friendsLandingContextModule.Context)
	local var5 = useFriendsListOrderedByPresence({ userId = var1, pageSize = friendsLandingPageSize })
	local var6 = if fFlagConnectionManagementChips then useDecoratedTrustedConnections(var5.onlineFriends) else nil
	local var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var4 (ref), filterStatesModule (copy), cryoModule (copy), fFlagConnectionManagementChips (copy), var6 (write), presenceType_1 (copy)
		local t = {}
		
		if var5.onlineFriends and var5.offlineFriends then
			if var4.filter == filterStatesModule.All then
				return cryoModule.List.join(var5.onlineFriends, var5.offlineFriends)
			elseif var4.filter == filterStatesModule.Offline then
				return var5.offlineFriends
			elseif var4.filter == filterStatesModule.Online then
				return var5.onlineFriends
			elseif fFlagConnectionManagementChips and var4.filter == filterStatesModule.Trusted then
				return var6 or {}
			end
			t = cryoModule.List.filter(var5.onlineFriends, function(p1)
				-- upvalues: presenceType_1 (copy)
				return p1.presence and p1.presence.userPresenceType == presenceType_1.InGame
			end)
		end
		return t
	end, if fFlagConnectionManagementChips then {
		var4.filter,
		var5.onlineFriends,
		var5.offlineFriends,
		var6
	} else { var4.filter, var5.onlineFriends, var5.offlineFriends })
	local var8 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var7 (ref), getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t_1 (copy), presenceType (copy)
		return cryoModule.List.map(var7, function(p1, _)
			-- upvalues: getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t_1 (copy), presenceType (copy)
			return {
				username = "",
				id = p1.id,
				thumbnail = getRbxthumbWithTypeSizeAndOptions(p1.id, userLibConstants.RbxthumbTypes.Avatar, 352),
				userPresenceType = if p1.presence then t_1[p1.presence.userPresenceType] else presenceType.Offline,
				universeId = if p1.presence then p1.presence.universeId else nil,
				lastLocation = if p1.presence then p1.presence.lastLocation else nil
			}
		end)
	end, { var7 })
	
	return reactModule.createElement(friendsLandingPageModule, {
		totalFriendCount = var2,
		friends = if fFlagConnectionManagementChips then var8 or {} else var8,
		fetchMoreFriends = if var5 and not var5.isEndOfList then var5.fetchMoreFriends else nil,
		refreshFriends = var5.refreshFriendsData,
		enableDisplayNamePolicy = var3,
		localUserId = var1
	})
end

return FriendsLandingContainer