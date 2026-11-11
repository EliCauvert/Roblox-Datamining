local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local Orientation = FoundationModule.Enums.Orientation
local _ = require(Parent.SduiCompat)
local _ = require(Parent.SduiCoreSystem)
local BuildSduiFeedChildrenModule = require(SduiSharedContent.Components.buildSduiFeedChildren)

return ReactModule.memo(function(p1)
	-- upvalues: BuildSduiFeedChildrenModule (copy), ReactModule (copy), Divider (copy), Orientation (copy), View (copy)
	local SduiFeedChildrenModule = BuildSduiFeedChildrenModule({
		componentType = "StickyHeader",
		negateImpressionIndex = true,
		configs = p1.stickyItems,
		sduiContext = p1.sduiContext,
		debugName = p1.debugName or "StickyHeader",
		extraLocalProps = p1.extraLocalProps,
		impressionsTag = p1.impressionsTag,
		selectionBehaviorLeft = p1.selectionBehaviorLeft,
		selectionBehaviorRight = p1.selectionBehaviorRight
	})
	SduiFeedChildrenModule.StickyDivider = ReactModule.createElement(Divider, {
		LayoutOrder = 1e999,
		orientation = Orientation.Horizontal
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder or 1,
		ZIndex = p1.zIndex or 1
	}, {
		Content = ReactModule.createElement(View, {
			tag = p1.contentTag,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			backgroundStyle = p1.backgroundStyle,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			TopSpacer = if p1.paddingTop and p1.paddingTop > 0 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, p1.paddingTop)
			}) else nil,
			StickyContent = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p1.gapBetweenItems)
				}
			}, SduiFeedChildrenModule),
			BottomSpacer = if p1.paddingBottom and p1.paddingBottom > 0 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, p1.paddingBottom)
			}) else nil
		})
	})
end)