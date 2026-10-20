local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local SummaryHeaderNames = ConstantsModule.NetworkFormatting.SummaryHeaderNames
local SummaryCellWidths = ConstantsModule.NetworkFormatting.SummaryCellWidths
local HeaderFrameHeight = ConstantsModule.NetworkFormatting.HeaderFrameHeight
local EntryFrameHeight = ConstantsModule.NetworkFormatting.EntryFrameHeight
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local CellPadding: number = ConstantsModule.NetworkFormatting.CellPadding
local Text = ConstantsModule.Color.Text
local CellLabelModule = require(script.Parent.Parent.Parent.Components.CellLabel)
local HeaderButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local Total = 0

for _, summaryCellWidth in pairs(SummaryCellWidths) do
	Total += summaryCellWidth
end
local Negated = -Total
local List = {}
local List1 = {}
local List2 = {}
table.insert(List, UDim2.new(0, CellPadding, 0, 0))
table.insert(List1, UDim2.new(1, -Total - CellPadding, 0, HeaderFrameHeight))
table.insert(List2, UDim2.new(1, -Total - CellPadding, 0, EntryFrameHeight))

for _, summaryCellWidth1 in ipairs(SummaryCellWidths) do
	table.insert(List, UDim2.new(1, Negated + CellPadding, 0, 0))
	table.insert(List1, UDim2.new(0, summaryCellWidth1 - CellPadding, 0, HeaderFrameHeight))
	table.insert(List2, UDim2.new(0, summaryCellWidth1 - CellPadding, 0, EntryFrameHeight))
	Negated += summaryCellWidth1
end
local t = {}

for i, Vector in ipairs(List) do
	t[i] = UDim2.new(Vector.X.Scale, Vector.X.Offset - CellPadding, Vector.Y.Scale, Vector.Y.Offset)
end
local NetworkSummary = RoactModule.Component:extend("NetworkSummary")

function NetworkSummary.render(p1)
	-- upvalues: RoactModule (copy), LineWidth (copy), LineColor (copy), t (copy), HeaderFrameHeight (copy), SummaryHeaderNames (copy), HeaderButtonModule (copy), List1 (copy), List (copy), CellLabelModule (copy), EntryFrameHeight (copy), Text (copy)
	local Width = p1.props.width
	local HttpSummaryTable = p1.props.httpSummaryTable or {}
	local LayoutOrder = p1.props.layoutOrder
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local config1 = {
		UpperHorizontalLine = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, LineWidth),
			BackgroundColor3 = LineColor
		}),
		LowerHorizontalLine = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, LineWidth),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = LineColor
		})
	}
	
	for i = 2, #t do
		config1[string.format("VerticalLine_%d", i)] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 0, HeaderFrameHeight),
			Position = t[i],
			BackgroundColor3 = LineColor
		})
	end
	for i1, summaryHeaderName in ipairs(SummaryHeaderNames) do
		config1[summaryHeaderName] = RoactModule.createElement(HeaderButtonModule, {
			text = summaryHeaderName,
			size = List1[i1],
			pos = List[i1]
		})
	end
	config.Header = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(0, Width, 0, HeaderFrameHeight)
	}, config1)
	local Count = 0
	
	for _, Frames in pairs(HttpSummaryTable) do
		Count += 1
		local config2 = {
			RequestType = RoactModule.createElement(CellLabelModule, {
				text = Frames.RequestType,
				size = List1[1],
				pos = List[1]
			}),
			RequestCount = RoactModule.createElement(CellLabelModule, {
				text = Frames.RequestCount,
				size = List1[2],
				pos = List[2]
			}),
			FailedCount = RoactModule.createElement(CellLabelModule, {
				text = Frames.FailedCount,
				size = List1[3],
				pos = List[3]
			}),
			AverageTime = RoactModule.createElement(CellLabelModule, {
				text = string.format("%.3f", Frames.AverageTime),
				size = List1[4],
				pos = List[4]
			}),
			MinTime = RoactModule.createElement(CellLabelModule, {
				text = string.format("%.3f", Frames.MinTime),
				size = List1[5],
				pos = List[5]
			}),
			MaxTime = RoactModule.createElement(CellLabelModule, {
				text = string.format("%.3f", Frames.MaxTime),
				size = List1[6],
				pos = List[6]
			}),
			LowerHorizontalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = LineColor
			})
		}
		
		for i2 = 2, #t do
			config2[string.format("VerticalLine_%d", i2)] = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = t[i2],
				BackgroundColor3 = LineColor
			})
		end
		config[Frames.RequestType] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, Width, 0, EntryFrameHeight),
			LayoutOrder = Count + 1
		}, config2)
	end
	if Count == 0 then
		config.Padding = RoactModule.createElement("TextLabel", {
			Text = "No Summary Data Found",
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, Width, 0, EntryFrameHeight),
			TextColor3 = Text
		})
		Count = 1
	end
	return RoactModule.createElement("ScrollingFrame", {
		ScrollingEnabled = false,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, Count * EntryFrameHeight + HeaderFrameHeight),
		LayoutOrder = LayoutOrder
	}, config)
end

return NetworkSummary