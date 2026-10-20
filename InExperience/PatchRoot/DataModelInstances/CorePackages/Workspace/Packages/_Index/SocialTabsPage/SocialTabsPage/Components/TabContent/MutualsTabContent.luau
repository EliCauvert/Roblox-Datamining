local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local UserListModule = require(Parent.UserList)
local UserListLayoutAdaptor = UserListModule.UserListLayoutAdaptor
local LayoutMode = UserListModule.Enums.LayoutMode
local EntityType = UserListModule.Enums.EntityType
local RowDataProviderModule = require(SocialTabsPage.Components.RowDataProvider)
local UseSocialTabsContextModule = require(SocialTabsPage.Contexts.useSocialTabsContext)
local UseMutualsListModule = require(SocialTabsPage.Hooks.useMutualsList)
local UseSortedEntitiesByPresenceModule = require(SocialTabsPage.Hooks.useSortedEntitiesByPresence)
local UseUserListCTAsModule = require(SocialTabsPage.Hooks.useUserListCTAs)
local UseCTAActionHandlersModule = require(SocialTabsPage.Hooks.useCTAActionHandlers)
local SocialTabsCtaConfigModule = require(SocialTabsPage.Common.SocialTabsCtaConfig)
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled

return function()
	-- upvalues: UseSocialTabsContextModule (copy), UseMutualsListModule (copy), ReactModule (copy), DashModule (copy), EntityType (copy), UseSortedEntitiesByPresenceModule (copy), FFlagUserListCtaIntegrationEnabled (copy), UseUserListCTAsModule (copy), UseCTAActionHandlersModule (copy), RowDataProviderModule (copy), View (copy), Loading (copy), UserListLayoutAdaptor (copy), LayoutMode (copy), SocialTabsCtaConfigModule (copy)
	local UseMutualsListModuleResult = UseMutualsListModule(UseSocialTabsContextModule().profileId)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UseMutualsListModuleResult (copy), EntityType (upval)
		return DashModule.map(UseMutualsListModuleResult.mutualFriends, function(p1)
			-- upvalues: EntityType (upval)
			return { id = p1.id, type = EntityType.User }
		end)
	end, { UseMutualsListModuleResult.mutualFriends })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), UseMemoResult (copy)
		return DashModule.map(UseMemoResult, function(p1)
			return p1.id
		end)
	end, { UseMemoResult })
	local UseSortedEntitiesByPresenceModuleResult = UseSortedEntitiesByPresenceModule(UseMemoResult)
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
	return if UseMutualsListModuleResult.isLoading and #UseMemoResult == 0 then ReactModule.createElement(View, { tag = "col align-x-center align-y-center size-full" }, { LoadingIndicator = ReactModule.createElement(Loading) }) else ReactModule.createElement(View, { tag = "col size-full padding-x-xlarge" }, {
		MutualsList = ReactModule.createElement(UserListLayoutAdaptor, {
			isScrollEnabled = true,
			entities = UseSortedEntitiesByPresenceModuleResult,
			layoutMode = LayoutMode.Vertical,
			hasMore = UseMutualsListModuleResult.hasMore,
			onLoadMore = if UseMutualsListModuleResult.hasMore then UseMutualsListModuleResult.loadMore else nil,
			renderRow = UseResult,
			ctaConfig = if FFlagUserListCtaIntegrationEnabled then SocialTabsCtaConfigModule.Mutuals else nil
		})
	})
end