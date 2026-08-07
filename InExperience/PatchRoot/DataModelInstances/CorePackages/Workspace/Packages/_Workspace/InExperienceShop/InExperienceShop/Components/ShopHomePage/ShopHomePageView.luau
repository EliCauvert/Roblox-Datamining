local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local flatList = require(parent.VirtualizedList).FlatList
local view = require(parent.Foundation).View
local _ = require(inExperienceShop.Types)

return function(p0) --[[ line: 26 | named "ShopHomePageView" ]]
	-- upvalues: reactModule (ref), view (ref), flatList (ref)
	return reactModule.createElement(view, {
		tag = "fill size-full-0 padding-x-xlarge",
		testId = "ShopHomePageView",
		LayoutOrder = p0.LayoutOrder,
		Visible = p0.Visible
	}, {
		List = reactModule.createElement(flatList, {
			windowSize = 3,
			initialNumToRender = 2,
			maxToRenderPerBatch = 1,
			updateCellsBatchingPeriod = 100,
			renderItem = p0.renderItem,
			data = p0.data,
			keyExtractor = p0.keyExtractor,
			onScroll = p0.onScroll,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = { BackgroundTransparency = 1, ScrollBarThickness = 0 }
		})
	})
end