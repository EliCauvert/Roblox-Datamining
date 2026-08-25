local immutableModule = require(script.Parent.Parent.Parent.Immutable)
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local localActionsViewModule = require(script.Parent.LocalActionsView)
local recentlyCapturedDumpsViewModule = require(script.Parent.RecentlyCapturedDumpsView)
local recordAndDumpViewModule = require(script.Parent.RecordAndDumpView)
local column = roactModule.Component:extend("Column")
local microProfilerView = roactModule.Component:extend("MicroProfilerView")

function column.render(p0)
	-- upvalues: roactModule (ref), immutableModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		LayoutOrder = p0.props.LayoutOrder
	}, immutableModule.JoinDictionaries({
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 12),
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
	}, p0.props[roactModule.Children]))
end

function microProfilerView.render(p1)
	-- upvalues: roactModule (ref), column (ref), localActionsViewModule (ref), recordAndDumpViewModule (ref), recentlyCapturedDumpsViewModule (ref)
	return roactModule.createElement("Frame", {
		Size = p1.props.Size,
		BackgroundTransparency = p1.props.BackgroundTransparency,
		LayoutOrder = p1.props.LayoutOrder
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 8),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			VerticalFlex = Enum.UIFlexAlignment.Fill
		}),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8)
		}),
		LeftColumn = roactModule.createElement(column, { LayoutOrder = 1 }, {
			LocalActionsView = roactModule.createElement(localActionsViewModule, { LayoutOrder = 1 }),
			RecordAndDumpView = roactModule.createElement(recordAndDumpViewModule, { LayoutOrder = 2 })
		}),
		RightColumn = roactModule.createElement(column, { LayoutOrder = 2 }, {
			RecentlyCapturedDumpsView = roactModule.createElement(recentlyCapturedDumpsViewModule)
		})
	})
end

return microProfilerView