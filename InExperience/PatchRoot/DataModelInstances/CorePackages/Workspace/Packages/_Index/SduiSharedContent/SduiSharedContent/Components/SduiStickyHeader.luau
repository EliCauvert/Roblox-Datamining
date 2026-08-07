local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local orientation = foundationModule.Enums.Orientation
local _ = require(parent.SduiCompat)
local _ = require(parent.SduiCoreSystem)
local buildSduiFeedChildrenModule = require(sduiSharedContent.Components.buildSduiFeedChildren)

return reactModule.memo(function(p0) --[[ line: 35 | named "SduiStickyHeader" ]]
	-- upvalues: buildSduiFeedChildrenModule (ref), reactModule (ref), divider (ref), orientation (ref), view (ref)
	local var4 = buildSduiFeedChildrenModule({
		componentType = "StickyHeader",
		negateImpressionIndex = true,
		configs = p0.stickyItems,
		sduiContext = p0.sduiContext,
		debugName = p0.debugName or "StickyHeader",
		extraLocalProps = p0.extraLocalProps,
		impressionsTag = p0.impressionsTag,
		selectionBehaviorLeft = p0.selectionBehaviorLeft,
		selectionBehaviorRight = p0.selectionBehaviorRight
	})
	var4.StickyDivider = reactModule.createElement(divider, {
		LayoutOrder = 1e999,
		orientation = orientation.Horizontal
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder or 1,
		ZIndex = p0.zIndex or 1
	}, {
		Content = reactModule.createElement(view, {
			tag = p0.contentTag,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			backgroundStyle = p0.backgroundStyle,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			TopSpacer = if p0.paddingTop and p0.paddingTop > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, p0.paddingTop)
			}) else nil,
			StickyContent = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p0.gapBetweenItems)
				}
			}, var4),
			BottomSpacer = if p0.paddingBottom and p0.paddingBottom > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, p0.paddingBottom)
			}) else nil
		})
	})
end)