local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local Parent = FriendsLanding.Parent
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseGetFriendsCountByUserIdFunction = require(Parent.FriendsHydrationReact).useGetFriendsCountByUserId
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local GetRbxthumbWithTypeSizeAndOptionsFunction = DependenciesModule.getRbxthumbWithTypeSizeAndOptions
local UserLibConstants = DependenciesModule.UserLibConstants
local FriendsLandingPageModule = require(FriendsLanding.Components.FriendsLandingPage)
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local PresenceType1 = require(Parent.GraphQLServer).types.PresenceType
local FriendsCommonModule = require(Parent.FriendsCommon)
local UseFriendsListOrderedByPresenceFunction = FriendsCommonModule.Hooks.useFriendsListOrderedByPresence
local UseDecoratedTrustedConnectionsFunction = FriendsCommonModule.Hooks.useDecoratedTrustedConnections
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local FFlagFriendsLandingLayerExposureModule = require(FriendsLanding.Flags.FFlagFriendsLandingLayerExposure)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips
local FFlagFriendsCountDataHydrationMigrationEnabled = require(Parent.SharedFlags).FFlagFriendsCountDataHydrationMigrationEnabled
local FFlagFriendsPageUserListCtaEnabledModule = require(FriendsLanding.Flags.FFlagFriendsPageUserListCtaEnabled)
local EntityType = if FFlagFriendsPageUserListCtaEnabledModule then require(Parent.UserList).Enums.EntityType else nil
local FriendsLandingPageSize = game:DefineFastInt("FriendsLandingPageSize", 50)
local config = { skipFetch = true }
local config1 = {
	[PresenceType1.Offline] = PresenceType.Offline,
	[PresenceType1.Online] = PresenceType.Online,
	[PresenceType1.InGame] = PresenceType.InGame,
	[PresenceType1.InStudio] = PresenceType.InStudio
}

function FriendsLandingContainer(_)
	-- upvalues: ReactModule (copy), IXPServiceWrapper (copy), AppUserLayers (copy), FFlagFriendsLandingLayerExposureModule (copy), UseLocalUserIdFunction (copy), FFlagFriendsCountDataHydrationMigrationEnabled (copy), UseGetFriendsCountByUserIdFunction (copy), config (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), UseAppPolicyFunction (copy), FriendsLandingContextModule (copy), UseFriendsListOrderedByPresenceFunction (copy), FriendsLandingPageSize (copy), FFlagConnectionManagementChips (copy), UseDecoratedTrustedConnectionsFunction (copy), FilterStatesModule (copy), CryoModule (copy), PresenceType1 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), UserLibConstants (copy), config1 (copy), PresenceType (copy), FFlagFriendsPageUserListCtaEnabledModule (copy), EntityType (copy), FriendsLandingPageModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: IXPServiceWrapper (upval), AppUserLayers (upval), FFlagFriendsLandingLayerExposureModule (upval)
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.ConnectionsHubExposureLayer)
		
		if FFlagFriendsLandingLayerExposureModule then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.SocialFriendsLandingLayer)
		end
	end, {})
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getShowDisplayName()
	end)
	local UseContextResult = ReactModule.useContext(FriendsLandingContextModule.Context)
	local UseFriendsListOrderedByPresenceResult = UseFriendsListOrderedByPresenceFunction({
		userId = UseLocalUserIdResult,
		pageSize = FriendsLandingPageSize
	})
	local UseDecoratedTrustedConnectionsResult = if FFlagConnectionManagementChips then UseDecoratedTrustedConnectionsFunction(UseFriendsListOrderedByPresenceResult.onlineFriends) else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseFriendsListOrderedByPresenceResult (copy), UseContextResult (copy), FilterStatesModule (upval), CryoModule (upval), FFlagConnectionManagementChips (upval), UseDecoratedTrustedConnectionsResult (ref), PresenceType1 (upval)
		local FilterResult = {}
		
		if UseFriendsListOrderedByPresenceResult.onlineFriends and UseFriendsListOrderedByPresenceResult.offlineFriends then
			if UseContextResult.filter == FilterStatesModule.All then
				return (CryoModule.List.join(UseFriendsListOrderedByPresenceResult.onlineFriends, UseFriendsListOrderedByPresenceResult.offlineFriends))
			end
			if UseContextResult.filter == FilterStatesModule.Offline then
				return UseFriendsListOrderedByPresenceResult.offlineFriends
			end
			if UseContextResult.filter == FilterStatesModule.Online then
				return UseFriendsListOrderedByPresenceResult.onlineFriends
			end
			if FFlagConnectionManagementChips and UseContextResult.filter == FilterStatesModule.Trusted then
				return UseDecoratedTrustedConnectionsResult or {}
			end
			FilterResult = CryoModule.List.filter(UseFriendsListOrderedByPresenceResult.onlineFriends, function(p1): boolean
				-- upvalues: PresenceType1 (upval)
				return p1.presence and p1.presence.userPresenceType == PresenceType1.InGame
			end)
		end
		return FilterResult
	end, if FFlagConnectionManagementChips then {
		UseContextResult.filter,
		UseFriendsListOrderedByPresenceResult.onlineFriends,
		UseFriendsListOrderedByPresenceResult.offlineFriends,
		UseDecoratedTrustedConnectionsResult
	} else {
		UseContextResult.filter,
		UseFriendsListOrderedByPresenceResult.onlineFriends,
		UseFriendsListOrderedByPresenceResult.offlineFriends
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseMemoResult (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), UserLibConstants (upval), config1 (upval), PresenceType (upval), FFlagFriendsPageUserListCtaEnabledModule (upval), EntityType (upval)
		return CryoModule.List.map(UseMemoResult, function(p1, _)
			-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (upval), UserLibConstants (upval), config1 (upval), PresenceType (upval), FFlagFriendsPageUserListCtaEnabledModule (upval), EntityType (upval)
			return {
				username = "",
				id = p1.id,
				type = if FFlagFriendsPageUserListCtaEnabledModule then EntityType.User else nil,
				thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.id, UserLibConstants.RbxthumbTypes.Avatar, 352),
				userPresenceType = if p1.presence then config1[p1.presence.userPresenceType] else PresenceType.Offline,
				universeId = p1.presence and p1.presence.universeId or nil,
				lastLocation = if p1.presence then p1.presence.lastLocation else nil
			}
		end)
	end, { UseMemoResult })
	
	return ReactModule.createElement(FriendsLandingPageModule, {
		totalFriendCount = if FFlagFriendsCountDataHydrationMigrationEnabled then UseGetFriendsCountByUserIdFunction(if UseLocalUserIdResult then tostring(UseLocalUserIdResult) else nil, config) or 0 else UseSelectorFunction(function(p1)
			-- upvalues: GetDeepValueFunction (upval), UseLocalUserIdResult (copy)
			return GetDeepValueFunction(p1, `FriendsLanding.Friends.countsByUserId.{UseLocalUserIdResult}`)
		end),
		friends = if FFlagConnectionManagementChips then UseMemoResult1 or {} else UseMemoResult1,
		fetchMoreFriends = if UseFriendsListOrderedByPresenceResult and not UseFriendsListOrderedByPresenceResult.isEndOfList then UseFriendsListOrderedByPresenceResult.fetchMoreFriends else nil,
		refreshFriends = UseFriendsListOrderedByPresenceResult.refreshFriendsData,
		enableDisplayNamePolicy = UseAppPolicyResult,
		localUserId = UseLocalUserIdResult
	})
end

return FriendsLandingContainer