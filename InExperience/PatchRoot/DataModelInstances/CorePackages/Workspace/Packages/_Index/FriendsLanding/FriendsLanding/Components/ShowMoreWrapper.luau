local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local Llama = DependenciesModule.llama
local Roact = DependenciesModule.Roact
local MemoizeFunction = DependenciesModule.memoize
local Dictionary = Llama.Dictionary
local LimitFriendsModule = require(script.helpers.limitFriends)
local UpdateFriendsWithWidthModule = require(script.helpers.updateFriendsWithWidth)
local LoadFriendGroupModule = require(script.helpers.loadFriendGroup)
local FriendsPerRowModule = require(script.helpers.friendsPerRow)
local FriendsPerLoadGroupModule = require(script.helpers.friendsPerLoadGroup)
local ShowMoreButtonModule = require(FriendsLanding.Components.ShowMoreButton)
local ButtonClickEventsModule = require(FriendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local FilterStatesModule = require(FriendsLanding.Friends.filterStates)
local React = DependenciesModule.React
local GridMetrics = DependenciesModule.UIBlox.App.Grid.GridMetrics
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseUiModeInfoFunction = require(Parent.RobloxAppHooks).useUiModeInfo
local UiMode = require(Parent.RobloxAppEnums).UiMode
local ShowMoreWrapper = Roact.PureComponent:extend("ShowMoreWrapper")
ShowMoreWrapper.defaultProps = {
	itemSize = 175,
	visibleRows = 6,
	analytics = nil,
	overrideRenderShowMore = nil,
	handleShowMore = nil,
	spacingIfEmpty = 48,
	listComponent = require(FriendsLanding.Components.FriendsLandingPage),
	friends = {},
	filter = FilterStatesModule.All,
	sectionType = require(FriendsLanding.Enums.ShowMoreSectionTypeEnum).Friends
}

function ShowMoreWrapper.init(p1) --[[ Line: 49 ]]
	-- upvalues: Dictionary (copy), FilterStatesModule (copy), UpdateFriendsWithWidthModule (copy), FriendsPerLoadGroupModule (copy), ButtonClickEventsModule (copy), FriendsPerRowModule (copy), LoadFriendGroupModule (copy), MemoizeFunction (copy), LimitFriendsModule (copy), Roact (copy), ShowMoreButtonModule (copy)
	p1.state = {
		width = 100,
		selectedItemIndex = nil,
		filterFriendCounts = Dictionary.map(FilterStatesModule, function() --[[ Line: 52 ]]
			-- upvalues: p1 (copy)
			return p1.props.visibleRows
		end)
	}
	
	function p1.updateWidth(Frame: Frame) --[[ Line: 58 ]]
		-- upvalues: p1 (copy), UpdateFriendsWithWidthModule (upval)
		p1:setState(UpdateFriendsWithWidthModule(Frame.AbsoluteSize.X))
		
		if p1.props.onWidthUpdated then
			p1.props.onWidthUpdated(Frame.AbsoluteSize.X)
		end
	end
	
	function p1.reset() --[[ Line: 66 ]]
		-- upvalues: p1 (copy), Dictionary (upval), FriendsPerLoadGroupModule (upval)
		p1:setState(function(p2, p3) --[[ Line: 67 ]]
			-- upvalues: Dictionary (upval), p1 (upval), FriendsPerLoadGroupModule (upval)
			return {
				filterFriendCounts = Dictionary.join(p1.state.filterFriendCounts, { [p1.props.filter] = FriendsPerLoadGroupModule(p2, p3) })
			}
		end)
	end
	
	function p1.showMore() --[[ Line: 77 ]]
		-- upvalues: p1 (copy), ButtonClickEventsModule (upval), FriendsPerRowModule (upval), Dictionary (upval), LoadFriendGroupModule (upval)
		if p1.props.analytics then
			p1.props.analytics:buttonClick(ButtonClickEventsModule.LoadMoreUsers, { sectionType = p1.props.sectionType })
		end
		if p1.props.fireOnShowMore then
			p1.props.fireOnShowMore(p1.props.sectionType)
		end
		if p1.props.handleShowMore then
			p1.props.handleShowMore(FriendsPerRowModule(Dictionary.join({ width = p1.state.width }, p1.props)))
			
			return
		else
			p1:setState(function(p2, p3) --[[ Line: 95 ]]
				-- upvalues: Dictionary (upval), LoadFriendGroupModule (upval)
				return Dictionary.join(LoadFriendGroupModule(p2, p3), { selectedItemIndex = p2.filterFriendCounts[p3.filter] + 1 })
			end)
		end
	end
	
	p1.limitFriends = MemoizeFunction(LimitFriendsModule)
	p1.renderShowMore = MemoizeFunction(function(p2, p3, Callback) --[[ Line: 108 ]]
		-- upvalues: Roact (upval), ShowMoreButtonModule (upval), p1 (copy)
		return function(LayoutOrder) --[[ Line: 109 ]]
			-- upvalues: Callback (copy), p3 (copy), p2 (copy), Roact (upval), ShowMoreButtonModule (upval), p1 (upval)
			local CallbackResult = Callback and Callback(p3)
			
			return if p3 < p2 or CallbackResult then Roact.createElement(ShowMoreButtonModule, {
				layoutOrder = LayoutOrder,
				onSizeChange = p1.updateWidth,
				onActivated = p1.showMore
			}) else Roact.createElement("Frame", {
				Name = "showMoreSpacing",
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, p1.props.spacingIfEmpty),
				LayoutOrder = LayoutOrder
			})
		end
	end)
	
	function p1.checkAndResetIfNeeded(DefaultProps) --[[ Line: 130 ]]
		-- upvalues: p1 (copy)
		if #p1.props.friends ~= #DefaultProps.friends or DefaultProps.visibleRows ~= p1.props.visibleRows then
			p1.reset()
		end
	end
end

function ShowMoreWrapper.didUpdate(p1, p2) --[[ Line: 137 ]]
	p1.checkAndResetIfNeeded(p2)
end

function ShowMoreWrapper.render(p1) --[[ Line: 141 ]]
	-- upvalues: Roact (copy), Dictionary (copy)
	local FilterFriendCount = p1.state.filterFriendCounts[p1.props.filter]
	
	return Roact.createElement(p1.props.listComponent, Dictionary.join(p1.props, {
		friends = p1.limitFriends(FilterFriendCount, p1.props.friends),
		showMore = p1.showMore,
		totalFilteredFriends = #p1.props.friends,
		renderShowMore = p1.renderShowMore(#p1.props.friends, FilterFriendCount, p1.props.overrideRenderShowMore),
		resetShowMore = p1.reset,
		totalInactiveFriends = p1.props.totalInactiveFriends,
		selectedItemIndex = p1.state.selectedItemIndex
	}))
end

return function(p1) --[[ Line: 159 | Named "ShowMoreWrapperFn" ]]
	-- upvalues: UseDesignTokensFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), React (copy), GridMetrics (copy), ShowMoreWrapper (copy), Llama (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local GridViewItemMetrics = UseDesignTokensResult.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics
	local GridHorizontalSpacing = UseDesignTokensResult.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing
	local GridVerticalSpacing = UseDesignTokensResult.LuaApps.FriendsLanding.FriendsLandingPage.GridVerticalSpacing
	local UseMemoResult = React.useMemo(function() --[[ Line: 168 ]]
		-- upvalues: IsUiModeMatch (copy), GridMetrics (upval), GridViewItemMetrics (copy)
		return if IsUiModeMatch then GridMetrics.makeCustomMetricsGetter(GridViewItemMetrics) else nil
	end, { IsUiModeMatch, GridViewItemMetrics })
	local UseStateResult, UseStateResult2 = React.useState(100)
	
	return React.createElement(ShowMoreWrapper, Llama.Dictionary.join({
		onWidthUpdated = if IsUiModeMatch then UseStateResult2 else nil,
		itemSize = React.useMemo(function() --[[ Line: 177 ]]
			-- upvalues: IsUiModeMatch (copy), UseMemoResult (copy), GridHorizontalSpacing (copy), UseStateResult (copy)
			return if IsUiModeMatch and UseMemoResult and GridHorizontalSpacing then UseMemoResult(UseStateResult, GridHorizontalSpacing).itemWidth else nil
		end, {
			IsUiModeMatch,
			UseMemoResult,
			UseStateResult,
			GridHorizontalSpacing
		}),
		getItemMetrics = UseMemoResult,
		gridHorizontalSpacing = GridHorizontalSpacing,
		gridVerticalSpacing = GridVerticalSpacing
	}, p1))
end