local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local entryFrameHeight = constantsModule.NetworkFormatting.EntryFrameHeight
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local responseStrHeight = constantsModule.NetworkFormatting.ResponseStrHeight
local responseWidthRatio = constantsModule.NetworkFormatting.ResponseWidthRatio
local var2 = (1 - responseWidthRatio) / 2
local var3 = (1 - responseWidthRatio) / 4
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local headerButtonModule = require(components.HeaderButton)
local bannerButtonModule = require(components.BannerButton)

return function(p0)
	-- upvalues: roactModule (ref), cellLabelModule (ref), lineColor (ref), lineWidth (ref), entryFrameHeight (ref), bannerButtonModule (ref), var2 (ref), headerButtonModule (ref), responseStrHeight (ref), var3 (ref)
	local size = p0.size
	local entry = p0.entry
	local entryCellSize = p0.entryCellSize
	local cellOffset = p0.cellOffset
	local verticalOffsets = p0.verticalOffsets
	local layoutOrder = p0.layoutOrder
	local showResponse = p0.showResponse
	local responseBodyHeight = p0.responseBodyHeight
	local onButtonPress = p0.onButtonPress
	local t = {
		Num = roactModule.createElement(cellLabelModule, {
			text = entry.Num,
			size = entryCellSize[1],
			pos = cellOffset[1]
		}),
		Method = roactModule.createElement(cellLabelModule, {
			text = entry.Method,
			size = entryCellSize[2],
			pos = cellOffset[2]
		}),
		Status = roactModule.createElement(cellLabelModule, {
			text = entry.Status,
			size = entryCellSize[3],
			pos = cellOffset[3]
		}),
		Time = roactModule.createElement(cellLabelModule, {
			text = string.format("%.3f", entry.Time),
			size = entryCellSize[4],
			pos = cellOffset[4]
		}),
		RequestType = roactModule.createElement(cellLabelModule, {
			text = entry.RequestType,
			size = entryCellSize[5],
			pos = cellOffset[5]
		}),
		Url = roactModule.createElement(cellLabelModule, {
			text = entry.Url,
			size = entryCellSize[6],
			pos = cellOffset[6]
		}),
		LowerHorizontalLine = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = lineColor
		})
	}
	
	for i = 2, #verticalOffsets do
		t[string.format("VerticalLine_%d", i)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 0, entryFrameHeight),
			Position = verticalOffsets[i],
			BackgroundColor3 = lineColor
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Button = roactModule.createElement(bannerButtonModule, {
			size = UDim2.new(1, 0, 0, entryFrameHeight),
			pos = UDim2.new(),
			isExpanded = showResponse,
			onButtonPress = onButtonPress
		}, t),
		Response = showResponse and roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, responseBodyHeight),
			Position = UDim2.new(var2, 0, 0, entryFrameHeight)
		}, {
			Text = roactModule.createElement(headerButtonModule, {
				text = "Response Body:",
				size = UDim2.new(1, 0, 0, responseStrHeight),
				pos = UDim2.new(-var3, 0, 0, 0)
			}),
			ResponseBody = roactModule.createElement(cellLabelModule, {
				text = entry.Response,
				size = UDim2.new(0.8, 0, 1, -responseStrHeight),
				pos = UDim2.new(0, 0, 0, responseStrHeight)
			})
		})
	})
end