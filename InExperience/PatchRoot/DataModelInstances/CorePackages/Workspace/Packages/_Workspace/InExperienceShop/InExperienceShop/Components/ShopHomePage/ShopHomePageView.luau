local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FlatList = require(Parent.VirtualizedList).FlatList
local View = FoundationModule.View
local _ = require(InExperienceShop.Types)

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), FlatList (copy)
	return ReactModule.createElement(View, {
		tag = "fill size-full-0 padding-x-xlarge",
		testId = "ShopHomePageView",
		LayoutOrder = Frame.LayoutOrder,
		Visible = Frame.Visible
	}, {
		List = ReactModule.createElement(FlatList, {
			windowSize = 3,
			initialNumToRender = 2,
			maxToRenderPerBatch = 1,
			updateCellsBatchingPeriod = 100,
			renderItem = Frame.renderItem,
			data = Frame.data,
			keyExtractor = Frame.keyExtractor,
			onScroll = Frame.onScroll,
			contentContainerStyle = { BackgroundTransparency = 1 },
			style = { BackgroundTransparency = 1, ScrollBarThickness = 0 }
		})
	})
end