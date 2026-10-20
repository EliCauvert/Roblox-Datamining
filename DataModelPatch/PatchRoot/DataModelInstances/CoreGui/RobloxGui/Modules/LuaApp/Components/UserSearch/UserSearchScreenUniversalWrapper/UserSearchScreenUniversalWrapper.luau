local UserSearchScreen = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.UserSearch.api).UserSearchScreen
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local PlayerSearchModule = require(script.Parent.Parent.Players.PlayerSearch)
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusOnMountFunction = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useFocusOnMount

return function()
	-- upvalues: FFlagLuaAppsDefaultSelection (copy), ReactFocusNavigationModule (copy), UseFocusOnMountFunction (copy), ReactModule (copy), PlayerSearchModule (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), AppPage (copy), UserSearchScreen (copy)
	local v1 = nil
	local v2 = nil
	
	if FFlagLuaAppsDefaultSelection then
		local UseMostRecentOrDefaultFocusBehaviorResult
		UseMostRecentOrDefaultFocusBehaviorResult, v9 = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior()
		v1 = UseFocusOnMountFunction(UseMostRecentOrDefaultFocusBehaviorResult)
	end
	return ReactModule.createElement(UserSearchScreen, {
		renderUserSearchResults = ReactModule.useCallback(function(p1)
			-- upvalues: ReactModule (upval), PlayerSearchModule (upval), FFlagLuaAppSearchPeopleUnifiedSchemaFields (upval), AppPage (upval), FFlagLuaAppsDefaultSelection (upval), v1 (ref)
			return ReactModule.createElement(PlayerSearchModule, {
				searchParameters = { searchKeyword = p1.searchKeyword },
				shouldShowUserSearchLandingPage = p1.shouldShowUserSearchLandingPage,
				searchUuid = p1.searchUuid,
				appPage = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then AppPage.UserSearch else nil,
				defaultFocusRef = if FFlagLuaAppsDefaultSelection then v1 else nil
			})
		end, { if FFlagLuaAppsDefaultSelection then v1 else nil }),
		containerRef = if FFlagLuaAppsDefaultSelection then v2 else nil
	})
end