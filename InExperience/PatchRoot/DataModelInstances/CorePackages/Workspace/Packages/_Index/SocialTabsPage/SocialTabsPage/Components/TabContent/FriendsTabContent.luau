local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserListModule = require(Parent.UserList)
local UserListLayoutAdaptor = UserListModule.UserListLayoutAdaptor
local LayoutMode = UserListModule.Enums.LayoutMode
local EntityType = UserListModule.Enums.EntityType
local SocialTabsEmptyStateModule = require(SocialTabsPage.Components.SocialTabsEmptyState)
local RowDataProviderModule = require(SocialTabsPage.Components.RowDataProvider)
local UseSocialTabsContextModule = require(SocialTabsPage.Contexts.useSocialTabsContext)
local UseFriendsListModule = require(SocialTabsPage.Hooks.useFriendsList)
local UseUserListCTAsModule = require(SocialTabsPage.Hooks.useUserListCTAs)
local UseCTAActionHandlersModule = require(SocialTabsPage.Hooks.useCTAActionHandlers)
local SocialTabsCtaConfigModule = require(SocialTabsPage.Common.SocialTabsCtaConfig)
local TextKeysModule = require(SocialTabsPage.Common.TextKeys)
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled

return function()
	-- upvalues: UseSocialTabsContextModule (copy), UseFriendsListModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), DashModule (copy), EntityType (copy), FFlagUserListCtaIntegrationEnabled (copy), UseUserListCTAsModule (copy), UseCTAActionHandlersModule (copy), RowDataProviderModule (copy), View (copy), Loading (copy), SocialTabsEmptyStateModule (copy), UserListLayoutAdaptor (copy), LayoutMode (copy), SocialTabsCtaConfigModule (copy)
	local UseSocialTabsContextModuleResult = UseSocialTabsContextModule()
	local Title = UseSocialTabsContextModuleResult.title
	local UseFriendsListModuleResult = UseFriendsListModule({
		targetUserId = UseSocialTabsContextModuleResult.profileId
	})
	local Friends = UseFriendsListModuleResult.friends
	local Loading1 = UseFriendsListModuleResult.loading
	local HasMore = UseFriendsListModuleResult.hasMore
	local FetchMore = UseFriendsListModuleResult.fetchMore
	local UseLocalizationResult = UseLocalizationFunction({
		emptyText = { TextKeysModule.NoFriendsYet, name = Title or "" }
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), Friends (copy), EntityType (upval)
		return DashModule.map(Friends, function(p1)
			-- upvalues: EntityType (upval)
			return { id = tostring(p1.id), type = EntityType.User }
		end)
	end, { Friends })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UseMemoResult (copy)
		return DashModule.map(UseMemoResult, function(p1)
			return p1.id
		end)
	end, { UseMemoResult })
	local UseResult = nil
	
	if not FFlagUserListCtaIntegrationEnabled then
		local UseUserListCTAsModuleResult = UseUserListCTAsModule(UseMemoResult1)
		local UseCTAActionHandlersModuleResult = UseCTAActionHandlersModule()
		UseResult = ReactModule.useCallback(function(CreateRow, Entity, _)
			-- upvalues: ReactModule (upval), RowDataProviderModule (upval), UseUserListCTAsModuleResult (copy), UseCTAActionHandlersModuleResult (copy)
			return ReactModule.createElement(RowDataProviderModule, {
				createRow = CreateRow,
				entity = Entity,
				ctaResult = UseUserListCTAsModuleResult[Entity.id],
				actionHandlers = UseCTAActionHandlersModuleResult
			})
		end, {
			UseUserListCTAsModuleResult,
			UseCTAActionHandlersModuleResult
		})
	end
	return if Loading1 and #UseMemoResult == 0 then ReactModule.createElement(View, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = ReactModule.createElement(Loading) }) elseif Loading1 or #UseMemoResult ~= 0 then ReactModule.createElement(View, { tag = "col size-full padding-x-xlarge" }, {
		FriendsList = ReactModule.createElement(UserListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = UseMemoResult,
			layoutMode = LayoutMode.Vertical,
			hasMore = HasMore,
			onLoadMore = if HasMore then FetchMore else nil,
			renderRow = UseResult,
			ctaConfig = if FFlagUserListCtaIntegrationEnabled then SocialTabsCtaConfigModule.Friends else nil
		})
	}) else ReactModule.createElement(SocialTabsEmptyStateModule, { text = UseLocalizationResult.emptyText })
end