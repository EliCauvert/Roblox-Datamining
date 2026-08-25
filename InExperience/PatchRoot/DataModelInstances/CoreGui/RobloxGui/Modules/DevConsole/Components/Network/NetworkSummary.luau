local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local summaryHeaderNames = constantsModule.NetworkFormatting.SummaryHeaderNames
local summaryCellWidths = constantsModule.NetworkFormatting.SummaryCellWidths
local headerFrameHeight = constantsModule.NetworkFormatting.HeaderFrameHeight
local entryFrameHeight = constantsModule.NetworkFormatting.EntryFrameHeight
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local cellPadding = constantsModule.NetworkFormatting.CellPadding
local text = constantsModule.Color.Text
local cellLabelModule = require(script.Parent.Parent.Parent.Components.CellLabel)
local headerButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local var4 = 0

for i, v in pairs(summaryCellWidths) do
	var4 += v
end
local var5 = -var4
local t = {}
local t_1 = {}
local t_2 = {}
table.insert(t, UDim2.new(0, cellPadding, 0, 0))
table.insert(t_1, UDim2.new(1, (-var4) - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(1, (-var4) - cellPadding, 0, entryFrameHeight))

for i_1, v_1 in ipairs(summaryCellWidths) do
	table.insert(t, UDim2.new(1, var5 + cellPadding, 0, 0))
	table.insert(t_1, UDim2.new(0, v_1 - cellPadding, 0, headerFrameHeight))
	table.insert(t_2, UDim2.new(0, v_1 - cellPadding, 0, entryFrameHeight))
	var5 += v_1
end
local t_3 = {}

for i_2, v_2 in ipairs(t) do
	t_3[i_2] = UDim2.new(v_2.X.Scale, v_2.X.Offset - cellPadding, v_2.Y.Scale, v_2.Y.Offset)
end
local networkSummary = roactModule.Component:extend("NetworkSummary")

function networkSummary.render(p0)
	-- upvalues: roactModule (ref), lineWidth (ref), lineColor (ref), t_3 (ref), headerFrameHeight (ref), summaryHeaderNames (ref), headerButtonModule (ref), t_1 (ref), t (ref), cellLabelModule (ref), entryFrameHeight (ref), text (ref)
	local width = p0.props.width
	local httpSummaryTable = p0.props.httpSummaryTable or {}
	local layoutOrder = p0.props.layoutOrder
	local t_2 = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local t_4 = {
		UpperHorizontalLine = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, lineWidth),
			BackgroundColor3 = lineColor
		}),
		LowerHorizontalLine = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, lineWidth),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = lineColor
		})
	}
	
	for i = 2, #t_3 do
		t_4[string.format("VerticalLine_%d", i)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 0, headerFrameHeight),
			Position = t_3[i],
			BackgroundColor3 = lineColor
		})
	end
	for i_1, v in ipairs(summaryHeaderNames) do
		t_4[v] = roactModule.createElement(headerButtonModule, { text = v, size = t_1[i_1], pos = t[i_1] })
	end
	t_2.Header = roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(0, width, 0, headerFrameHeight)
	}, t_4)
	local var14 = 0
	
	for i_2, v_1 in pairs(httpSummaryTable) do
		var14 += 1
		local t_5 = {
			RequestType = roactModule.createElement(cellLabelModule, { text = v_1.RequestType, size = t_1[1], pos = t[1] }),
			RequestCount = roactModule.createElement(cellLabelModule, { text = v_1.RequestCount, size = t_1[2], pos = t[2] }),
			FailedCount = roactModule.createElement(cellLabelModule, { text = v_1.FailedCount, size = t_1[3], pos = t[3] }),
			AverageTime = roactModule.createElement(cellLabelModule, {
				text = string.format("%.3f", v_1.AverageTime),
				size = t_1[4],
				pos = t[4]
			}),
			MinTime = roactModule.createElement(cellLabelModule, {
				text = string.format("%.3f", v_1.MinTime),
				size = t_1[5],
				pos = t[5]
			}),
			MaxTime = roactModule.createElement(cellLabelModule, {
				text = string.format("%.3f", v_1.MaxTime),
				size = t_1[6],
				pos = t[6]
			}),
			LowerHorizontalLine = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = lineColor
			})
		}
		
		for i_3 = 2, #t_3 do
			t_5[string.format("VerticalLine_%d", i_3)] = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = t_3[i_3],
				BackgroundColor3 = lineColor
			})
		end
		t_2[v_1.RequestType] = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, width, 0, entryFrameHeight),
			LayoutOrder = var14 + 1
		}, t_5)
	end
	if var14 == 0 then
		t_2.Padding = roactModule.createElement("TextLabel", {
			Text = "No Summary Data Found",
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, width, 0, entryFrameHeight),
			TextColor3 = text
		})
		var14 = 1
	end
	return roactModule.createElement("ScrollingFrame", {
		ScrollingEnabled = false,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var14 * entryFrameHeight + headerFrameHeight),
		LayoutOrder = layoutOrder
	}, t_2)
end

return networkSummary