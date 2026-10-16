local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local EntryFrameHeight = ConstantsModule.NetworkFormatting.EntryFrameHeight
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ResponseStrHeight = ConstantsModule.NetworkFormatting.ResponseStrHeight
local ResponseWidthRatio: number = ConstantsModule.NetworkFormatting.ResponseWidthRatio
local XScale = (1 - ResponseWidthRatio) / 2
local ResponseWidthRatioRatio = (1 - ResponseWidthRatio) / 4
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local HeaderButtonModule = require(Components.HeaderButton)
local BannerButtonModule = require(Components.BannerButton)

return function(p1) --[[ Line: 21 ]]
	-- upvalues: RoactModule (copy), CellLabelModule (copy), LineColor (copy), LineWidth (copy), EntryFrameHeight (copy), BannerButtonModule (copy), XScale (copy), HeaderButtonModule (copy), ResponseStrHeight (copy), ResponseWidthRatioRatio (copy)
	local Size = p1.size
	local Entry = p1.entry
	local EntryCellSize = p1.entryCellSize
	local CellOffset = p1.cellOffset
	local VerticalOffsets = p1.verticalOffsets
	local LayoutOrder = p1.layoutOrder
	local ShowResponse = p1.showResponse
	local ResponseBodyHeight = p1.responseBodyHeight
	local OnButtonPress = p1.onButtonPress
	local config = {
		Num = RoactModule.createElement(CellLabelModule, {
			text = Entry.Num,
			size = EntryCellSize[1],
			pos = CellOffset[1]
		}),
		Method = RoactModule.createElement(CellLabelModule, {
			text = Entry.Method,
			size = EntryCellSize[2],
			pos = CellOffset[2]
		}),
		Status = RoactModule.createElement(CellLabelModule, {
			text = Entry.Status,
			size = EntryCellSize[3],
			pos = CellOffset[3]
		}),
		Time = RoactModule.createElement(CellLabelModule, {
			text = string.format("%.3f", Entry.Time),
			size = EntryCellSize[4],
			pos = CellOffset[4]
		}),
		RequestType = RoactModule.createElement(CellLabelModule, {
			text = Entry.RequestType,
			size = EntryCellSize[5],
			pos = CellOffset[5]
		}),
		Url = RoactModule.createElement(CellLabelModule, {
			text = Entry.Url,
			size = EntryCellSize[6],
			pos = CellOffset[6]
		}),
		LowerHorizontalLine = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = LineColor
		})
	}
	
	for i = 2, #VerticalOffsets do
		config[string.format("VerticalLine_%d", i)] = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, LineWidth, 0, EntryFrameHeight),
			Position = VerticalOffsets[i],
			BackgroundColor3 = LineColor
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		Button = RoactModule.createElement(BannerButtonModule, {
			size = UDim2.new(1, 0, 0, EntryFrameHeight),
			pos = UDim2.new(),
			isExpanded = ShowResponse,
			onButtonPress = OnButtonPress
		}, config),
		Response = ShowResponse and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, ResponseBodyHeight),
			Position = UDim2.new(XScale, 0, 0, EntryFrameHeight)
		}, {
			Text = RoactModule.createElement(HeaderButtonModule, {
				text = "Response Body:",
				size = UDim2.new(1, 0, 0, ResponseStrHeight),
				pos = UDim2.new(-ResponseWidthRatioRatio, 0, 0, 0)
			}),
			ResponseBody = RoactModule.createElement(CellLabelModule, {
				text = Entry.Response,
				size = UDim2.new(0.8, 0, 1, -ResponseStrHeight),
				pos = UDim2.new(0, 0, 0, ResponseStrHeight)
			})
		})
	})
end