local SocialProof = script:FindFirstAncestor("SocialProof")
local Parent = SocialProof.Parent
local ReactModule = require(Parent.React)
local UseEntityConnectionsPaginationModule = require(SocialProof.Hooks.useEntityConnectionsPagination)
local UserListViewAdaptor = require(Parent.UserList).Components.UserListViewAdaptor
local FFlagUserListUseSheet = require(Parent.SharedFlags).FFlagUserListUseSheet
local UserListSheetModule = require(script.Parent.UserListSheet)
local EnumsModule = require(SocialProof.Common.Enums)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ConstantsModule = require(SocialProof.Common.Constants)
local config = {
	position = UDim2.fromScale(0.6, 0),
	size = UDim2.fromScale(0.4, 1),
	anchorPoint = Vector2.new(0, 0)
}
local config1 = {
	position = UDim2.fromScale(0.5, 0),
	size = UDim2.new(0, 640, 1, 0),
	anchorPoint = Vector2.new(0.5, 0)
}

return function(_)
	-- upvalues: UseDispatchFunction (copy), UseNavigationPropsFunction (copy), UseEntityConnectionsPaginationModule (copy), EnumsModule (copy), ReactModule (copy), config1 (copy), config (copy), AppPage (copy), ConstantsModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UseLocalizationFunction (copy), FFlagUserListUseSheet (copy), UserListSheetModule (copy), UserListViewAdaptor (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
		return {
			entityId = p1.entityId,
			entityType = p1.entityType,
			source = p1.source
		}
	end)
	local UseEntityConnectionsPaginationModuleResult = UseEntityConnectionsPaginationModule({
		initialCursor = nil,
		entityId = UseNavigationPropsResult.entityId,
		entityType = UseNavigationPropsResult.entityType,
		connectionType = EnumsModule.ConnectionType.Friend
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseNavigationPropsResult (copy), config1 (upval), config (upval)
		return if UseNavigationPropsResult.source == "profile" then config1 else config
	end, { UseNavigationPropsResult.source })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseEntityConnectionsPaginationModuleResult (copy)
		if UseEntityConnectionsPaginationModuleResult.hasMore and not UseEntityConnectionsPaginationModuleResult.isLoading then
			UseEntityConnectionsPaginationModuleResult.fetchPage()
		end
	end, {
		UseEntityConnectionsPaginationModuleResult.hasMore,
		UseEntityConnectionsPaginationModuleResult.isLoading,
		UseEntityConnectionsPaginationModuleResult.fetchPage
	})
	local UseResult1 = ReactModule.useCallback(function(Detail)
		-- upvalues: AppPage (upval), ConstantsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		local config = {
			name = AppPage.ProfilePlatform,
			detail = Detail,
			extraProps = {
				profileType = ConstantsModule.PROFILE_TYPE,
				source = ConstantsModule.ITEM_DETAILS_PAGE_SOURCE
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, { UseDispatchResult })
	local UseLocalizationResult = UseLocalizationFunction({
		singleConnectionOwns = "Feature.Friends.Label.FriendOwns",
		connectionsOwn = {
			"Feature.Friends.Label.FriendsOwn",
			numberOfConnections = UseEntityConnectionsPaginationModuleResult.totalConnections
		}
	})
	local SingleConnectionOwns = if UseEntityConnectionsPaginationModuleResult.totalConnections == 1 then UseLocalizationResult.singleConnectionOwns else UseLocalizationResult.connectionsOwn
	
	return if UseEntityConnectionsPaginationModuleResult.totalConnections == 0 then nil elseif FFlagUserListUseSheet then ReactModule.createElement(UserListSheetModule, {
		users = UseEntityConnectionsPaginationModuleResult.userIds,
		title = SingleConnectionOwns,
		onLoadMore = UseResult,
		onUserSelected = UseResult1,
		hasMore = UseEntityConnectionsPaginationModuleResult.hasMore
	}) else ReactModule.createElement(UserListViewAdaptor, {
		users = UseEntityConnectionsPaginationModuleResult.userIds,
		title = SingleConnectionOwns,
		totalCount = UseEntityConnectionsPaginationModuleResult.totalConnections,
		onLoadMore = UseResult,
		onUserSelected = UseResult1,
		hasMore = UseEntityConnectionsPaginationModuleResult.hasMore,
		wideModePeekViewLayout = UseMemoResult
	})
end