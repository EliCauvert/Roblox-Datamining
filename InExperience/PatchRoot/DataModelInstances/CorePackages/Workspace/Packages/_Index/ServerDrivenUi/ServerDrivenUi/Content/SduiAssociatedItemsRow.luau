local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p1)
	-- upvalues: getSduiComponentWrapper (ref), reactModule (ref), fFlagSduiExperienceDetailsSupport (ref), view (ref)
	local layoutOrder = p1.layoutOrder
	local t = {}
	
	for i, v in p1.items do
		t[`Item_${i}`] = reactModule.createElement(getSduiComponentWrapper(v), {
			componentConfig = v,
			sduiContext = p1.sduiContext,
			parentAnalyticsContext = p1.analyticsContext,
			extraLocalProps = { index = i, layoutOrder = i },
			debugName = `AssociatedItemsRow-Item-${i}`
		})
	end
	return if fFlagSduiExperienceDetailsSupport then reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = layoutOrder
	}, {
		ItemsScroll = reactModule.createElement("ScrollingFrame", {
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
			ItemsRow = reactModule.createElement(view, { tag = "row gap-small auto-xy size-full-0" }, t)
		}),
		Footer = p1.footerComponent
	}) else reactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		ScrollBarThickness = 0,
		AutomaticCanvasSize = Enum.AutomaticSize.X,
		LayoutOrder = layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		ScrollingDirection = Enum.ScrollingDirection.X
	}, {
		ItemsRow = reactModule.createElement(view, { tag = "row gap-small auto-xy size-full-0" }, t)
	})
end)