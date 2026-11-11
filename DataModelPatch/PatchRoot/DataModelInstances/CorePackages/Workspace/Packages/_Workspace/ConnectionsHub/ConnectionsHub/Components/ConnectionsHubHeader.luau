local Parent = script:FindFirstAncestor("ConnectionsHub").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local GetPageMarginFunction = require(Parent.UIBlox).App.Container.getPageMargin
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local AppHeaderBarModule = require(Parent.AppHeaderBar)
local UserSearchBarButton = require(Parent.SocialCommon).Components.UserSearchBar.UserSearchBarButton
local UseNavigationFunction = require(Parent.Navigation).useNavigation

return function()
	-- upvalues: UseTokensFunction (copy), UseScreenSizeFunction (copy), UseNavigationFunction (copy), GetPageMarginFunction (copy), ReactModule (copy), AppHeaderBarModule (copy), View (copy), AppPage (copy), Sources (copy), UserSearchBarButton (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseNavigationResult = UseNavigationFunction()
	local PageMargin = GetPageMarginFunction(UseScreenSizeResult.X)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AppHeaderBarModule (upval), UseResult (copy)
		return AppHeaderBarModule.makeBackButton(UseResult)
	end, { UseResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPage (upval), Sources (upval)
		UseNavigationResult.navigate(AppPage.UserSearch, {
			shouldShowUserSearchLandingPage = true,
			entryPoint = Sources.ConnectionsHub
		})
	end, { UseNavigationResult })
	
	return ReactModule.createElement(View, {
		tag = "row fill align-y-center gap-medium",
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1200)
	}, {
		pageMargins = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, PageMargin),
			PaddingRight = UDim.new(0, PageMargin)
		}),
		backButton = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), View (upval), UseMemoResult (copy)
			return ReactModule.createElement(View, { tag = "size-0 auto-xy align-x-left", LayoutOrder = 1 }, { button = UseMemoResult() })
		end, { UseMemoResult }),
		searchBar = ReactModule.useMemo(function()
			-- upvalues: ReactModule (upval), View (upval), UserSearchBarButton (upval), UseResult1 (copy)
			return ReactModule.createElement(View, {
				tag = "size-full-0 auto-y fill align-x-center",
				LayoutOrder = 2
			}, {
				bar = ReactModule.createElement(UserSearchBarButton, { onActivated = UseResult1 })
			})
		end, { UseResult1 })
	})
end