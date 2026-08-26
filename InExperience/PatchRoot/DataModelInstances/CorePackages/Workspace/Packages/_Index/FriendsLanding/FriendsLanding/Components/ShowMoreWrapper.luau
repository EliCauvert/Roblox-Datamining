local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local llama = dependenciesModule.llama
local roact = dependenciesModule.Roact
local memoize = dependenciesModule.memoize
local dictionary = llama.Dictionary
local friendsLandingPageModule = require(friendsLanding.Components.FriendsLandingPage)
local limitFriendsModule = require(script.helpers.limitFriends)
local updateFriendsWithWidthModule = require(script.helpers.updateFriendsWithWidth)
local loadFriendGroupModule = require(script.helpers.loadFriendGroup)
local friendsPerRowModule = require(script.helpers.friendsPerRow)
local friendsPerLoadGroupModule = require(script.helpers.friendsPerLoadGroup)
local showMoreButtonModule = require(friendsLanding.Components.ShowMoreButton)
local buttonClickEventsModule = require(friendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local filterStatesModule = require(friendsLanding.Friends.filterStates)
local showMoreSectionTypeEnumModule = require(friendsLanding.Enums.ShowMoreSectionTypeEnum)
local react = dependenciesModule.React
local gridMetrics = dependenciesModule.UIBlox.App.Grid.GridMetrics
local useDesignTokens = require(parent.Style).useDesignTokens
local useUiModeInfo = require(parent.RobloxAppHooks).useUiModeInfo
local uiMode = require(parent.RobloxAppEnums).UiMode
local showMoreWrapper = roact.PureComponent:extend("ShowMoreWrapper")
showMoreWrapper.defaultProps = {
	itemSize = 175,
	visibleRows = 6,
	analytics = nil,
	overrideRenderShowMore = nil,
	handleShowMore = nil,
	spacingIfEmpty = 48,
	listComponent = friendsLandingPageModule,
	friends = {},
	filter = filterStatesModule.All,
	sectionType = showMoreSectionTypeEnumModule.Friends
}

function showMoreWrapper.init(p1)
	-- upvalues: dictionary (ref), filterStatesModule (ref), updateFriendsWithWidthModule (ref), friendsPerLoadGroupModule (ref), buttonClickEventsModule (ref), friendsPerRowModule (ref), loadFriendGroupModule (ref), memoize (ref), limitFriendsModule (ref), roact (ref), showMoreButtonModule (ref)
	p1.state = {
		width = 100,
		selectedItemIndex = nil,
		filterFriendCounts = dictionary.map(filterStatesModule, function()
			-- upvalues: p1 (ref)
			return p1.props.visibleRows
		end)
	}
	
	function p0.updateWidth(p2)
		-- upvalues: p1 (ref), updateFriendsWithWidthModule (copy)
		p1:setState(updateFriendsWithWidthModule(p2.AbsoluteSize.X))
		
		if p1.props.onWidthUpdated then
			p1.props.onWidthUpdated(p2.AbsoluteSize.X)
		end
	end
	
	function p0.reset()
		-- upvalues: p1 (ref), dictionary (copy), friendsPerLoadGroupModule (copy)
		p1:setState(function(p2, p3)
			-- upvalues: dictionary (copy), p1 (copy), friendsPerLoadGroupModule (copy)
			return {
				filterFriendCounts = dictionary.join(p1.state.filterFriendCounts, { [p1.props.filter] = friendsPerLoadGroupModule(p2, p3) })
			}
		end)
	end
	
	function p0.showMore()
		-- upvalues: p1 (ref), buttonClickEventsModule (copy), friendsPerRowModule (copy), dictionary (copy), loadFriendGroupModule (copy)
		if p1.props.analytics then
			p1.props.analytics:buttonClick(buttonClickEventsModule.LoadMoreUsers, { sectionType = p1.props.sectionType })
		end
		if p1.props.fireOnShowMore then
			p1.props.fireOnShowMore(p1.props.sectionType)
		end
		if p1.props.handleShowMore then
			p1.props.handleShowMore(friendsPerRowModule(dictionary.join({ width = p1.state.width }, p1.props)))
			
			return
		end
		p1:setState(function(p2, p3)
			-- upvalues: dictionary (copy), loadFriendGroupModule (copy)
			return dictionary.join(loadFriendGroupModule(p2, p3), { selectedItemIndex = p2.filterFriendCounts[p3.filter] + 1 })
		end)
	end
	
	p1.limitFriends = memoize(limitFriendsModule)
	p1.renderShowMore = memoize(function(p2, p3, p4)
		-- upvalues: roact (copy), showMoreButtonModule (copy), p1 (ref)
		return function(p5)
			-- upvalues: p4 (ref), p3 (ref), p2 (ref), roact (copy), showMoreButtonModule (copy), p1 (copy)
			return if p3 < p2 or p4 and p4(p3) then roact.createElement(showMoreButtonModule, {
				layoutOrder = p5,
				onSizeChange = p1.updateWidth,
				onActivated = p1.showMore
			}) else roact.createElement("Frame", {
				Name = "showMoreSpacing",
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, p1.props.spacingIfEmpty),
				LayoutOrder = p5
			})
		end
	end)
	
	function p0.checkAndResetIfNeeded(p2)
		-- upvalues: p1 (ref)
		if #p1.props.friends ~= #p2.friends or p2.visibleRows ~= p1.props.visibleRows then
			p1.reset()
		end
	end
end

function showMoreWrapper.didUpdate(p1, p2)
	p1.checkAndResetIfNeeded(p2)
end

function showMoreWrapper.render(p1)
	-- upvalues: roact (ref), dictionary (ref)
	local filter = p1.state.filterFriendCounts[p1.props.filter]
	
	return roact.createElement(p1.props.listComponent, dictionary.join(p1.props, {
		friends = p1.limitFriends(filter, p1.props.friends),
		showMore = p1.showMore,
		totalFilteredFriends = #p1.props.friends,
		renderShowMore = p1.renderShowMore(#p1.props.friends, filter, p1.props.overrideRenderShowMore),
		resetShowMore = p1.reset,
		totalInactiveFriends = p1.props.totalInactiveFriends,
		selectedItemIndex = p1.state.selectedItemIndex
	}))
end

return function(p1)
	-- upvalues: useDesignTokens (ref), useUiModeInfo (ref), uiMode (ref), react (ref), gridMetrics (ref), showMoreWrapper (ref), llama (ref)
	local var1 = useDesignTokens()
	local var2 = useUiModeInfo().uiMode == uiMode.TenFoot
	local gridViewItemMetrics = var1.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics
	local gridHorizontalSpacing = var1.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing
	local gridVerticalSpacing = var1.LuaApps.FriendsLanding.FriendsLandingPage.GridVerticalSpacing
	local var3 = react.useMemo(function()
		-- upvalues: var2 (ref), gridMetrics (copy), gridViewItemMetrics (ref)
		return if var2 then gridMetrics.makeCustomMetricsGetter(gridViewItemMetrics) else nil
	end, { var2, gridViewItemMetrics })
	local var4, var5 = react.useState(100)
	
	return react.createElement(showMoreWrapper, llama.Dictionary.join({
		onWidthUpdated = if var2 then var5 else nil,
		itemSize = react.useMemo(function()
			-- upvalues: var2 (ref), var3 (ref), gridHorizontalSpacing (ref), var4 (ref)
			return if var2 and var3 and gridHorizontalSpacing then var3(var4, gridHorizontalSpacing).itemWidth else nil
		end, { var2, var3, var4, gridHorizontalSpacing }),
		getItemMetrics = var3,
		gridHorizontalSpacing = gridHorizontalSpacing,
		gridVerticalSpacing = gridVerticalSpacing
	}, p1))
end