local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper

return ReactModule.memo(function(p1) --[[ Line: 25 | Named "SduiAssociatedItemsRow" ]]
	-- upvalues: GetSduiComponentWrapperFunction (copy), ReactModule (copy), View (copy)
	local LayoutOrder = p1.layoutOrder
	local Elements = {}
	
	for Index, item in p1.items do
		Elements[`Item_${Index}`] = ReactModule.createElement(GetSduiComponentWrapperFunction(item), {
			componentConfig = item,
			sduiContext = p1.sduiContext,
			parentAnalyticsContext = p1.analyticsContext,
			extraLocalProps = { index = Index, layoutOrder = Index },
			debugName = `AssociatedItemsRow-Item-${Index}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = LayoutOrder
	}, {
		ItemsScroll = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ClipsDescendants = false,
			ScrollBarThickness = 0,
			Selectable = false,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X
		}, {
			ItemsRow = ReactModule.createElement(View, { tag = "row gap-small auto-xy size-full-0" }, Elements)
		}),
		Footer = p1.footerComponent
	})
end)