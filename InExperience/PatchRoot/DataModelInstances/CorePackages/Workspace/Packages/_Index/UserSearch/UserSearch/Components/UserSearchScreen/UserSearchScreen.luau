local HttpService = game:GetService("HttpService")
local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UserSearchHeaderBarModule = require(UserSearch.Components.UserSearchHeaderBar)
local AnalyticsModule = require(UserSearch.Analytics)
local EventNames = AnalyticsModule.EventNames
local UseUserSearchAnalyticsFunction = AnalyticsModule.useUserSearchAnalytics
local FFlagLuaAppsDefaultSelection = require(Parent.SharedFlags).FFlagLuaAppsDefaultSelection

return function(p1) --[[ Line: 35 | Named "UserSearchScreen" ]]
	-- upvalues: UseNavigationFunction (copy), UseStyleFunction (copy), FFlagLuaAppsDefaultSelection (copy), ReactModule (copy), HttpService (copy), UseUserSearchAnalyticsFunction (copy), EventNames (copy), AppPage (copy), FullscreenPageWithSafeArea (copy), UserSearchHeaderBarModule (copy)
	local RenderUserSearchResultsFunction = p1.renderUserSearchResults
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local Tokens = UseStyleResult.Tokens
	local SearchKeywordParam = UseNavigationResult.getParam("searchKeyword")
	local ShouldShowUserSearchLandingPageParam = UseNavigationResult.getParam("shouldShowUserSearchLandingPage")
	local EntryPointParam = UseNavigationResult.getParam("entryPoint")
	local UseRefResult = nil
	local UseUserSearchAnalyticsResult = nil
	
	if FFlagLuaAppsDefaultSelection then
		UseRefResult = ReactModule.useRef(HttpService:GenerateGUID(false))
		UseUserSearchAnalyticsResult = UseUserSearchAnalyticsFunction({
			currentPage = EntryPointParam,
			userSearchSessionId = UseRefResult.current
		})
	else
		UseUserSearchAnalyticsResult = UseUserSearchAnalyticsFunction({ currentPage = EntryPointParam })
		UseRefResult = UseUserSearchAnalyticsResult.getInfoForAllEvents().userSearchSessionId
	end
	ReactModule.useEffect(function() --[[ Line: 61 ]]
		-- upvalues: ShouldShowUserSearchLandingPageParam (copy), UseUserSearchAnalyticsResult (ref), EventNames (upval)
		if ShouldShowUserSearchLandingPageParam then
			UseUserSearchAnalyticsResult.fireAnalyticsEvent(EventNames.UserSearchBarOpen)
		end
	end, {})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		buttonRef = if FFlagLuaAppsDefaultSelection then p1.containerRef else nil
	}, {
		UserSearchHeaderBar = ReactModule.createElement(UserSearchHeaderBarModule, {
			searchKeyword = SearchKeywordParam,
			focusOnSearchInput = ShouldShowUserSearchLandingPageParam,
			onSubmitSearch = ReactModule.useCallback(function(Kwd) --[[ Line: 67 ]]
				-- upvalues: UseNavigationResult (copy), AppPage (upval), EntryPointParam (copy), UseUserSearchAnalyticsResult (ref), EventNames (upval)
				UseNavigationResult.replace(AppPage.UserSearch, { searchKeyword = Kwd, entryPoint = EntryPointParam })
				UseUserSearchAnalyticsResult.fireAnalyticsEvent(EventNames.UserSearchBarSubmit, { kwd = Kwd })
			end, { EntryPointParam }),
			onBackClick = ReactModule.useCallback(function() --[[ Line: 76 ]]
				-- upvalues: UseNavigationResult (copy), UseUserSearchAnalyticsResult (ref), EventNames (upval)
				UseNavigationResult.pop()
				UseUserSearchAnalyticsResult.fireAnalyticsEvent(EventNames.UserSearchBarCancel)
			end, {}),
			headerHeight = Tokens.Size.Size_1200
		}),
		PageContent = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, Tokens.Size.Size_1200),
			Size = UDim2.new(1, 0, 1, -Tokens.Size.Size_1200)
		}, {
			UserSearchPage = ReactModule.useMemo(function() --[[ Line: 83 ]]
				-- upvalues: RenderUserSearchResultsFunction (copy), SearchKeywordParam (copy), ShouldShowUserSearchLandingPageParam (copy), FFlagLuaAppsDefaultSelection (upval), UseRefResult (ref)
				return RenderUserSearchResultsFunction({
					searchKeyword = SearchKeywordParam,
					shouldShowUserSearchLandingPage = ShouldShowUserSearchLandingPageParam,
					searchUuid = if FFlagLuaAppsDefaultSelection then UseRefResult.current else UseRefResult
				})
			end, {
				SearchKeywordParam,
				ShouldShowUserSearchLandingPageParam,
				UseRefResult
			})
		})
	})
end