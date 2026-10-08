local httpService = game:GetService("HttpService")
local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local reactModule = require(parent.React)
local appPage = require(parent.RobloxAppEnums).AppPage
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local useNavigation = require(parent.Navigation).useNavigation
local userSearchHeaderBarModule = require(userSearch.Components.UserSearchHeaderBar)
local analyticsModule = require(userSearch.Analytics)
local eventNames = analyticsModule.EventNames
local useUserSearchAnalytics = analyticsModule.useUserSearchAnalytics
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection

return function(p1)
	-- upvalues: useNavigation (ref), useStyle (ref), fFlagLuaAppsDefaultSelection (ref), reactModule (ref), httpService (ref), useUserSearchAnalytics (ref), eventNames (ref), appPage (ref), fullscreenPageWithSafeArea (ref), userSearchHeaderBarModule (ref)
	local var1, var2
	local renderUserSearchResults = p1.renderUserSearchResults
	local var3 = useNavigation()
	local var4 = useStyle()
	local tokens = var4.Tokens
	local searchKeyword = var3.getParam("searchKeyword")
	local shouldShowUserSearchLandingPage = var3.getParam("shouldShowUserSearchLandingPage")
	local entryPoint = var3.getParam("entryPoint")
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppsDefaultSelection then
		var1 = reactModule.useRef(httpService:GenerateGUID(false))
		var2 = useUserSearchAnalytics({
			currentPage = entryPoint,
			userSearchSessionId = var1.current
		})
	else
		var2 = useUserSearchAnalytics({ currentPage = entryPoint })
		var1 = var2.getInfoForAllEvents().userSearchSessionId
	end
	reactModule.useEffect(function()
		-- upvalues: shouldShowUserSearchLandingPage (ref), var2 (write), eventNames (copy)
		if shouldShowUserSearchLandingPage then
			var2.fireAnalyticsEvent(eventNames.UserSearchBarOpen)
		end
	end, {})
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var4.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var4.Theme.BackgroundDefault.Transparency,
		buttonRef = if fFlagLuaAppsDefaultSelection then p1.containerRef else nil
	}, {
		UserSearchHeaderBar = reactModule.createElement(userSearchHeaderBarModule, {
			searchKeyword = searchKeyword,
			focusOnSearchInput = shouldShowUserSearchLandingPage,
			onSubmitSearch = reactModule.useCallback(function(p2)
				-- upvalues: var3 (ref), appPage (copy), entryPoint (ref), var2 (write), eventNames (copy)
				var3.replace(appPage.UserSearch, { searchKeyword = p2, entryPoint = entryPoint })
				var2.fireAnalyticsEvent(eventNames.UserSearchBarSubmit, { kwd = p2 })
			end, { entryPoint }),
			onBackClick = reactModule.useCallback(function()
				-- upvalues: var3 (ref), var2 (write), eventNames (copy)
				var3.pop()
				var2.fireAnalyticsEvent(eventNames.UserSearchBarCancel)
			end, {}),
			headerHeight = tokens.Size.Size_1200
		}),
		PageContent = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, tokens.Size.Size_1200),
			Size = UDim2.new(1, 0, 1, -tokens.Size.Size_1200)
		}, {
			UserSearchPage = reactModule.useMemo(function()
				-- upvalues: renderUserSearchResults (ref), searchKeyword (ref), shouldShowUserSearchLandingPage (ref), fFlagLuaAppsDefaultSelection (copy), var1 (write)
				return renderUserSearchResults({
					searchKeyword = searchKeyword,
					shouldShowUserSearchLandingPage = shouldShowUserSearchLandingPage,
					searchUuid = if fFlagLuaAppsDefaultSelection then var1.current else var1
				})
			end, { searchKeyword, shouldShowUserSearchLandingPage, var1 })
		})
	})
end