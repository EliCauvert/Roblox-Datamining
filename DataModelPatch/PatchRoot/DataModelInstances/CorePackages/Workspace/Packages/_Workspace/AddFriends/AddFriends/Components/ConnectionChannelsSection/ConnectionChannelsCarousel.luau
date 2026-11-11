local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local GetPageMarginFunction = require(Parent.UIBlox).App.Container.getPageMargin
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagFixCohubUiBugs = require(Parent.SharedFlags).FFlagFixCohubUiBugs
local FFlagAFPConnectionsChannelsHeader = require(Parent.SharedFlags).FFlagAFPConnectionsChannelsHeader

return function(p1)
	-- upvalues: FFlagAFPConnectionsChannelsHeader (copy), FFlagFixCohubUiBugs (copy), UseScreenSizeFunction (copy), UseSelectorFunction (copy), GetPageMarginFunction (copy), ReactModule (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), UseTokensFunction (copy), CollectionCarousel (copy)
	local LayoutOrder = p1.layoutOrder
	local Items = p1.items
	local RenderItem = p1.renderItem
	local ContextualInfoHeight = p1.contextualInfoHeight
	local HeaderComponent = if FFlagAFPConnectionsChannelsHeader then p1.headerComponent else nil
	local v1: Vector2? = nil
	
	if FFlagFixCohubUiBugs then
		local UseScreenSizeResult = UseScreenSizeFunction()
		v1 = Vector2.new(UseScreenSizeResult.X - 2 * GetPageMarginFunction(UseScreenSizeResult.X) - UseSelectorFunction(function(p2)
			return p2.GlobalGuiInset and p2.GlobalGuiInset.left or 0
		end), 1)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseCollectionLayoutParamsResult = UseCollectionLayoutParamsFunction(CollectionItemSize.XSmall, UseStateResult, true, { sideMargin = 0 }, nil, if FFlagFixCohubUiBugs then v1 else nil)
	local UseTokensResult = UseTokensFunction()
	local v2 = nil
	local UseStateResult2_1 = nil
	local UseResult = nil
	
	if FFlagFixCohubUiBugs then
		v2, UseStateResult2_1 = ReactModule.useState(false)
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (ref)
			UseStateResult2_1(true)
		end, {})
	end
	return ReactModule.createElement(CollectionCarousel, {
		LayoutOrder = LayoutOrder,
		containerRef = UseStateResult2,
		items = if FFlagFixCohubUiBugs and not v2 then {} else Items,
		numColumns = UseCollectionLayoutParamsResult.numColumns,
		fractionalItemAmount = UseCollectionLayoutParamsResult.fractionalItemAmount,
		columnGap = UseCollectionLayoutParamsResult.columnGap,
		onContainerSizeChanged = if FFlagFixCohubUiBugs then UseResult else nil,
		headerComponent = if FFlagAFPConnectionsChannelsHeader then HeaderComponent else nil,
		renderItem = RenderItem,
		getItemHeight = function(p2)
			-- upvalues: ContextualInfoHeight (copy), UseTokensResult (copy)
			return p2 + ContextualInfoHeight * UseTokensResult.Config.UI.Scale
		end
	})
end