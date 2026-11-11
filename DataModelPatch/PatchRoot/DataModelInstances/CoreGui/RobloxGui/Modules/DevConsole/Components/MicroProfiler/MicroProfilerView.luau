local ImmutableModule = require(script.Parent.Parent.Parent.Immutable)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local LocalActionsViewModule = require(script.Parent.LocalActionsView)
local RecentlyCapturedDumpsViewModule = require(script.Parent.RecentlyCapturedDumpsView)
local RecordAndDumpViewModule = require(script.Parent.RecordAndDumpView)
local Column = RoactModule.Component:extend("Column")
local MicroProfilerView = RoactModule.Component:extend("MicroProfilerView")

function Column.render(p1)
	-- upvalues: RoactModule (copy), ImmutableModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		LayoutOrder = p1.props.LayoutOrder
	}, ImmutableModule.JoinDictionaries({
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 12),
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
	}, p1.props[RoactModule.Children]))
end

function MicroProfilerView.render(p1)
	-- upvalues: RoactModule (copy), Column (copy), LocalActionsViewModule (copy), RecordAndDumpViewModule (copy), RecentlyCapturedDumpsViewModule (copy)
	return RoactModule.createElement("Frame", {
		Size = p1.props.Size,
		BackgroundTransparency = p1.props.BackgroundTransparency,
		LayoutOrder = p1.props.LayoutOrder
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 8),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			VerticalFlex = Enum.UIFlexAlignment.Fill
		}),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		LeftColumn = RoactModule.createElement(Column, { LayoutOrder = 1 }, {
			LocalActionsView = RoactModule.createElement(LocalActionsViewModule, { LayoutOrder = 1 }),
			RecordAndDumpView = RoactModule.createElement(RecordAndDumpViewModule, { LayoutOrder = 2 })
		}),
		RightColumn = RoactModule.createElement(Column, { LayoutOrder = 2 }, {
			RecentlyCapturedDumpsView = RoactModule.createElement(RecentlyCapturedDumpsViewModule)
		})
	})
end

return MicroProfilerView