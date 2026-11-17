local Parent = script:FindFirstAncestor("TrustedFriendCandidates").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UserListModule = require(Parent.UserList)
local _ = require(Parent.AppCommonLib)
local ScreenSizeImpressionsTracker = require(Parent.Impressions).ScreenSizeImpressionsTracker
local UserListLayoutAdaptor = UserListModule.UserListLayoutAdaptor
local LayoutMode = UserListModule.Enums.LayoutMode

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), UserListLayoutAdaptor (copy), LayoutMode (copy), ScreenSizeImpressionsTracker (copy)
	return if p1.isVisible then ReactModule.createElement(FoundationModule.View, {
		tag = "col size-full-0 auto-y padding-top-xlarge",
		testId = "TrustedFriendCandidatesSectionView",
		LayoutOrder = p1.layoutOrder,
		ref = p1.containerRef,
		onAbsolutePositionChanged = p1.onLayoutChanged,
		onAbsoluteSizeChanged = p1.onLayoutChanged
	}, {
		UserList = ReactModule.createElement(UserListLayoutAdaptor, {
			isScrollEnabled = false,
			layoutMode = LayoutMode.Vertical,
			header = { title = p1.title },
			entities = p1.entities,
			hasMore = p1.hasMore,
			onLoadMore = p1.onLoadMore,
			renderRow = p1.renderRow,
			onRowSelectedOverride = p1.onRowSelected
		}),
		ImpressionsTracker = ReactModule.createElement(ScreenSizeImpressionsTracker, {
			parentRef = p1.containerRef,
			pageContext = p1.impressions.pageContext,
			dataUpdatedTimestamp = p1.impressions.dataUpdatedTimestamp,
			impressionsTag = p1.impressions.impressionsTag,
			sendImpressions = p1.impressions.sendImpressions,
			scrollViewPositionChangedSignal = p1.impressions.scrollViewPositionChangedSignal
		})
	}) else nil
end