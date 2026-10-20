local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local AddFriendsContainerModule = require(script.Parent.AddFriendsContainer)
local AddFriendsLayerExposureModule = require(script.Parent.AddFriendsLayerExposure)
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub

function AddFriendsScreen(p1)
	-- upvalues: UseNavigationFunction (copy), UseDesignTokensFunction (copy), FFlagCreateConnectionsHub (copy), AppPage (copy), ReactModule (copy), AddFriendsLayerExposureModule (copy), AddFriendsContainerModule (copy), DashModule (copy), FullscreenPageWithSafeArea (copy)
	local NavigateToLuaAppPages = p1.navigateToLuaAppPages
	local UseNavigationResult = UseNavigationFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local IsRouteNameMatch: boolean = FFlagCreateConnectionsHub and UseNavigationResult.state.routeName == AppPage.CoHubAddConnections
	
	return ReactModule.createElement(AddFriendsLayerExposureModule, {
		renderChild = function(p2)
			-- upvalues: IsRouteNameMatch (copy), ReactModule (upval), AddFriendsContainerModule (upval), DashModule (upval), NavigateToLuaAppPages (copy), FullscreenPageWithSafeArea (upval), UseDesignTokensResult (copy)
			return if IsRouteNameMatch then ReactModule.createElement(AddFriendsContainerModule, DashModule.join(p2 or {}, { navigateToLuaAppPages = NavigateToLuaAppPages })) else ReactModule.createElement(FullscreenPageWithSafeArea, {
				includeStatusBar = true,
				BackgroundColor3 = UseDesignTokensResult.LuaApps.App.Page.BackgroundColor,
				BackgroundTransparency = UseDesignTokensResult.LuaApps.App.Page.BackgroundTransparency
			}, {
				AddFriendsScreen = ReactModule.createElement(AddFriendsContainerModule, DashModule.join(p2 or {}, { navigateToLuaAppPages = NavigateToLuaAppPages }))
			})
		end
	})
end

return AddFriendsScreen