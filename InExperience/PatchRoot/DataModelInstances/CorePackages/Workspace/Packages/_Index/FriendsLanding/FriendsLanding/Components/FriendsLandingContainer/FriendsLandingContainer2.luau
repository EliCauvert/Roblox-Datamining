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
local fFlagFriendsPageUserListCtaEnabledModule = require(friendsLanding.Flags.FFlagFriendsPageUserListCtaEnabled)
local var1 = if fFlagFriendsPageUserListCtaEnabledModule then require(parent.UserList).Enums.EntityType else nil
local friendsLandingPageSize = game:DefineFastInt("FriendsLandingPageSize", 50)
local t = { skipFetch = true }
local t_1 = {
	[presenceType_1.Offline] = presenceType.Offline,
	[presenceType_1.Online] = presenceType.Online,
	[presenceType_1.InGame] = presenceType.InGame,
	[presenceType_1.InStudio] = presenceType.InStudio
}

function FriendsLandingContainer(_)
	-- upvalues: reactModule (ref), fFlagFixCohubExposureLayer (ref), IXPServiceWrapper (ref), appUserLayers (ref), IXPService (ref), useLocalUserId (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), useGetFriendsCountByUserId (ref), t (ref), useSelector (ref), getDeepValue (ref), useAppPolicy (ref), friendsLandingContextModule (ref), useFriendsListOrderedByPresence (ref), friendsLandingPageSize (ref), fFlagConnectionManagementChips (ref), useDecoratedTrustedConnections (ref), filterStatesModule (ref), cryoModule (ref), presenceType_1 (ref), getRbxthumbWithTypeSizeAndOptions (ref), userLibConstants (ref), t_1 (ref), presenceType (ref), fFlagFriendsPageUserListCtaEnabledModule (ref), var1 (ref), friendsLandingPageModule (ref)
	reactModule.useEffect(function()
		-- upvalues: fFlagFixCohubExposureLayer (copy), IXPServiceWrapper (copy), appUserLayers (copy), IXPService (copy)
		if fFlagFixCohubExposureLayer then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
			
			return
		end
		IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.ConnectionsHubExposureLayer)
	end, {})
	local var2 = useLocalUserId()
	local var3 = if fFlagFriendsCountDataHydrationMigrationEnabled then useGetFriendsCountByUserId(if var2 then tostring(var2) else nil, t) or 0 else useSelector(function(p1)
		-- upvalues: getDeepValue (copy), var2 (ref)
		return getDeepValue(p1, `FriendsLanding.Friends.countsByUserId.{var2}`)
	end)
	local var4 = useAppPolicy(function(p1)
		return p1.getShowDisplayName()
	end)
	local var5 = reactModule.useContext(friendsLandingContextModule.Context)
	local var6 = useFriendsListOrderedByPresence({ userId = var2, pageSize = friendsLandingPageSize })
	local var7 = if fFlagConnectionManagementChips then useDecoratedTrustedConnections(var6.onlineFriends) else nil
	local var8 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), var5 (ref), filterStatesModule (copy), cryoModule (copy), fFlagConnectionManagementChips (copy), var7 (write), presenceType_1 (copy)
		local t = {}
		
		if var6.onlineFriends and var6.offlineFriends then
			if var5.filter == filterStatesModule.All then
				return cryoModule.List.join(var6.onlineFriends, var6.offlineFriends)
			elseif var5.filter == filterStatesModule.Offline then
				return var6.offlineFriends
			elseif var5.filter == filterStatesModule.Online then
				return var6.onlineFriends
			elseif fFlagConnectionManagementChips and var5.filter == filterStatesModule.Trusted then
				return var7 or {}
			end
			t = cryoModule.List.filter(var6.onlineFriends, function(p1)
				-- upvalues: presenceType_1 (copy)
				return p1.presence and p1.presence.userPresenceType == presenceType_1.InGame
			end)
		end
		return t
	end, if fFlagConnectionManagementChips then {
		var5.filter,
		var6.onlineFriends,
		var6.offlineFriends,
		var7
	} else { var5.filter, var6.onlineFriends, var6.offlineFriends })
	local var9 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var8 (ref), getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t_1 (copy), presenceType (copy), fFlagFriendsPageUserListCtaEnabledModule (copy), var1 (copy)
		return cryoModule.List.map(var8, function(p1, _)
			-- upvalues: getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), t_1 (copy), presenceType (copy), fFlagFriendsPageUserListCtaEnabledModule (copy), var1 (copy)
			return {
				username = "",
				id = p1.id,
				type = if fFlagFriendsPageUserListCtaEnabledModule then var1.User else nil,
				thumbnail = getRbxthumbWithTypeSizeAndOptions(p1.id, userLibConstants.RbxthumbTypes.Avatar, 352),
				userPresenceType = if p1.presence then t_1[p1.presence.userPresenceType] else presenceType.Offline,
				universeId = if p1.presence then p1.presence.universeId else nil,
				lastLocation = if p1.presence then p1.presence.lastLocation else nil
			}
		end)
	end, { var8 })
	
	return reactModule.createElement(friendsLandingPageModule, {
		totalFriendCount = var3,
		friends = if fFlagConnectionManagementChips then var9 or {} else var9,
		fetchMoreFriends = if var6 and not var6.isEndOfList then var6.fetchMoreFriends else nil,
		refreshFriends = var6.refreshFriendsData,
		enableDisplayNamePolicy = var4,
		localUserId = var2
	})
end

return FriendsLandingContainer