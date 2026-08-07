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

function showMoreWrapper.init(p0) --[[ line: 49 ]]
	-- upvalues: dictionary (ref), filterStatesModule (ref), updateFriendsWithWidthModule (ref), friendsPerLoadGroupModule (ref), buttonClickEventsModule (ref), friendsPerRowModule (ref), loadFriendGroupModule (ref), memoize (ref), limitFriendsModule (ref), roact (ref), showMoreButtonModule (ref)
	p0.state = {
		width = 100,
		selectedItemIndex = nil,
		filterFriendCounts = dictionary.map(filterStatesModule, function() --[[ line: 52 ]]
			-- upvalues: p0 (ref)
			return p0.props.visibleRows
		end)
	}
	
	function p0.updateWidth(p1) --[[ line: 58 ]]
		-- upvalues: p0 (ref), updateFriendsWithWidthModule (copy)
		p0:setState(updateFriendsWithWidthModule(p1.AbsoluteSize.X))
		
		if p0.props.onWidthUpdated then
			p0.props.onWidthUpdated(p1.AbsoluteSize.X)
		end
	end
	
	function p0.reset() --[[ line: 66 ]]
		-- upvalues: p0 (ref), dictionary (copy), friendsPerLoadGroupModule (copy)
		p0:setState(function(p2, p3) --[[ line: 67 ]]
			-- upvalues: dictionary (copy), p0 (copy), friendsPerLoadGroupModule (copy)
			return {
				filterFriendCounts = dictionary.join(p0.state.filterFriendCounts, { [p0.props.filter] = friendsPerLoadGroupModule(p2, p3) })
			}
		end)
	end
	
	function p0.showMore() --[[ line: 77 ]]
		-- upvalues: p0 (ref), buttonClickEventsModule (copy), friendsPerRowModule (copy), dictionary (copy), loadFriendGroupModule (copy)
		if p0.props.analytics then
			p0.props.analytics:buttonClick(buttonClickEventsModule.LoadMoreUsers, { sectionType = p0.props.sectionType })
		end
		if p0.props.fireOnShowMore then
			p0.props.fireOnShowMore(p0.props.sectionType)
		end
		if p0.props.handleShowMore then
			p0.props.handleShowMore(friendsPerRowModule(dictionary.join({ width = p0.state.width }, p0.props)))
			
			return
		end
		p0:setState(function(p4, p5) --[[ line: 95 ]]
			-- upvalues: dictionary (copy), loadFriendGroupModule (copy)
			return dictionary.join(loadFriendGroupModule(p4, p5), { selectedItemIndex = p4.filterFriendCounts[p5.filter] + 1 })
		end)
	end
	
	p0.limitFriends = memoize(limitFriendsModule)
	p0.renderShowMore = memoize(function(p6, p7, p8) --[[ line: 108 ]]
		-- upvalues: roact (copy), showMoreButtonModule (copy), p0 (ref)
		return function(p9) --[[ line: 109 ]]
			-- upvalues: p8 (ref), p7 (ref), p6 (ref), roact (copy), showMoreButtonModule (copy), p0 (copy)
			return if p7 < p6 or p8 and p8(p7) then roact.createElement(showMoreButtonModule, {
				layoutOrder = p9,
				onSizeChange = p0.updateWidth,
				onActivated = p0.showMore
			}) else roact.createElement("Frame", {
				Name = "showMoreSpacing",
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, p0.props.spacingIfEmpty),
				LayoutOrder = p9
			})
		end
	end)
	
	function p0.checkAndResetIfNeeded(p10) --[[ line: 130 ]]
		-- upvalues: p0 (ref)
		if #p0.props.friends ~= #p10.friends or p10.visibleRows ~= p0.props.visibleRows then
			p0.reset()
		end
	end
end

function showMoreWrapper.didUpdate(p11, p12) --[[ line: 137 ]]
	p11.checkAndResetIfNeeded(p12)
end

function showMoreWrapper.render(p13) --[[ line: 141 ]]
	-- upvalues: roact (ref), dictionary (ref)
	local filter = p13.state.filterFriendCounts[p13.props.filter]
	
	return roact.createElement(p13.props.listComponent, dictionary.join(p13.props, {
		friends = p13.limitFriends(filter, p13.props.friends),
		showMore = p13.showMore,
		totalFilteredFriends = #p13.props.friends,
		renderShowMore = p13.renderShowMore(#p13.props.friends, filter, p13.props.overrideRenderShowMore),
		resetShowMore = p13.reset,
		totalInactiveFriends = p13.props.totalInactiveFriends,
		selectedItemIndex = p13.state.selectedItemIndex
	}))
end

return function(p14) --[[ line: 159 | named "ShowMoreWrapperFn" ]]
	-- upvalues: useDesignTokens (ref), useUiModeInfo (ref), uiMode (ref), react (ref), gridMetrics (ref), showMoreWrapper (ref), llama (ref)
	local var13 = useDesignTokens()
	local var14 = useUiModeInfo().uiMode == uiMode.TenFoot
	local gridViewItemMetrics = var13.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics
	local gridHorizontalSpacing = var13.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing
	local gridVerticalSpacing = var13.LuaApps.FriendsLanding.FriendsLandingPage.GridVerticalSpacing
	local var15 = react.useMemo(function() --[[ line: 168 ]]
		-- upvalues: var14 (ref), gridMetrics (copy), gridViewItemMetrics (ref)
		return if var14 then gridMetrics.makeCustomMetricsGetter(gridViewItemMetrics) else nil
	end, { var14, gridViewItemMetrics })
	local var16, var17 = react.useState(100)
	
	return react.createElement(showMoreWrapper, llama.Dictionary.join({
		onWidthUpdated = if var14 then var17 else nil,
		itemSize = react.useMemo(function() --[[ line: 177 ]]
			-- upvalues: var14 (ref), var15 (ref), gridHorizontalSpacing (ref), var16 (ref)
			return if var14 and var15 and gridHorizontalSpacing then var15(var16, gridHorizontalSpacing).itemWidth else nil
		end, { var14, var15, var16, gridHorizontalSpacing }),
		getItemMetrics = var15,
		gridHorizontalSpacing = gridHorizontalSpacing,
		gridVerticalSpacing = gridVerticalSpacing
	}, p14))
end