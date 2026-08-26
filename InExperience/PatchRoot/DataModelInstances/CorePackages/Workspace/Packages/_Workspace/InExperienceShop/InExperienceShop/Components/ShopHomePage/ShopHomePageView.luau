local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local flatList = require(parent.VirtualizedList).FlatList
local view = require(parent.Foundation).View
local _ = require(inExperienceShop.Types)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), flatList (ref)
	return reactModule.createElement(view, {
		tag = "fill size-full-0 padding-x-xlarge",
		testId = "ShopHomePageView",
		LayoutOrder = p1.LayoutOrder,
		Visible = p1.Visible
	}, {
		List = reactModule.createElement(flatList, {
			windowSize = 3,
			initialNumToRender = 2,
			maxToRenderPerBatch = 1,
			updateCellsBatchingPeriod = 100,
			renderItem = p1.renderItem,
			data = p1.data,
			keyExtractor = p1.keyExtractor,
			onScroll = p1.onScroll,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = { BackgroundTransparency = 1, ScrollBarThickness = 0 }
		})
	})
end