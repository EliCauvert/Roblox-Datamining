local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local LineGraphModule = require(Components.LineGraph)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ChartHeaderNames = ConstantsModule.ServerStatsFormatting.ChartHeaderNames
local ValueCellWidth = ConstantsModule.ServerStatsFormatting.ValueCellWidth
local CellPadding = ConstantsModule.ServerStatsFormatting.CellPadding
local ExpandArrowPadding = ConstantsModule.ServerStatsFormatting.ExpandArrowPadding
local HeaderFrameHeight = ConstantsModule.ServerStatsFormatting.HeaderFrameHeight
local EntryFrameHeight = ConstantsModule.ServerStatsFormatting.EntryFrameHeight
local LineGraphHeight = ConstantsModule.GeneralFormatting.LineGraphHeight
local NoResultSearchStr = ConstantsModule.GeneralFormatting.NoResultSearchStr
local ConvertTimeStampModule = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local ServerStats = RoactModule.Component:extend("ServerStats")

local function formatData(p1): string --[[ Line: 29 ]]
	return string.format("%.3f", p1)
end

local function getX(p1) --[[ Line: 32 ]]
	return p1.time
end

local function getY(p1) --[[ Line: 36 ]]
	return p1.value
end

function ServerStats.init(p1) --[[ Line: 40 ]]
	local CurrentData = p1.props.ServerStatsData:getCurrentData()
	
	function p1.getOnButtonPress(ExpandedEntry) --[[ Line: 43 ]]
		-- upvalues: p1 (copy)
		return function(_, _) --[[ Line: 44 ]]
			-- upvalues: p1 (upval), ExpandedEntry (copy)
			p1:setState({
				expandedEntry = p1.state.expandedEntry ~= ExpandedEntry and ExpandedEntry
			})
		end
	end
	
	p1.state = { serverStatsData = CurrentData }
end

function ServerStats.didMount(p1) --[[ Line: 56 ]]
	p1.statsConnector = p1.props.ServerStatsData:Signal():Connect(function(ServerStatsData) --[[ Line: 57 ]]
		-- upvalues: p1 (copy)
		p1:setState({ serverStatsData = ServerStatsData })
	end)
end

function ServerStats.willUnmount(p1) --[[ Line: 64 ]]
	p1.statsConnector:Disconnect()
	p1.statsConnector = nil
end

function ServerStats.render(p1) --[[ Line: 69 ]]
	-- upvalues: EntryFrameHeight (copy), LineGraphHeight (copy), RoactModule (copy), BannerButtonModule (copy), CellLabelModule (copy), ValueCellWidth (copy), CellPadding (copy), ExpandArrowPadding (copy), LineWidth (copy), LineColor (copy), LineGraphModule (copy), getX (copy), getY (copy), ConvertTimeStampModule (copy), formatData (copy), ConstantsModule (copy), NoResultSearchStr (copy), HeaderFrameHeight (copy), ChartHeaderNames (copy)
	local Frames = {}
	local SearchTerm: string = p1.props.searchTerm
	local LayoutOrder = p1.props.layoutOrder
	local Size = p1.props.size
	local ExpandedEntry = p1.state.expandedEntry
	local ServerStatsData = p1.state.serverStatsData
	local LayoutOrder1 = 1
	local Count = 0
	local v1 = 0
	
	if ServerStatsData then
		for Text, value in pairs(ServerStatsData) do
			Count += 1
			
			if not SearchTerm or string.find(Text:lower(), SearchTerm:lower()) ~= nil then
				LayoutOrder1 += 1
				local IsExpandedEntryMatch = ExpandedEntry == Text
				v1 = IsExpandedEntryMatch and v1 + 1 or v1
				Frames[Text] = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, IsExpandedEntryMatch and EntryFrameHeight + LineGraphHeight or EntryFrameHeight),
					LayoutOrder = LayoutOrder1
				}, {
					DataButton = RoactModule.createElement(BannerButtonModule, {
						size = UDim2.new(1, 0, 0, EntryFrameHeight),
						pos = UDim2.new(),
						isExpanded = IsExpandedEntryMatch,
						onButtonPress = p1.getOnButtonPress(Text)
					}, {
						[Text] = RoactModule.createElement(CellLabelModule, {
							text = Text,
							size = UDim2.new(1 - ValueCellWidth, -CellPadding - ExpandArrowPadding, 1, 0),
							pos = UDim2.new(0, CellPadding + ExpandArrowPadding, 0, 0)
						}),
						Data = RoactModule.createElement(CellLabelModule, {
							text = string.format("%.3f", value.dataSet:back().value),
							size = UDim2.new(ValueCellWidth, -CellPadding, 1, 0),
							pos = UDim2.new(1 - ValueCellWidth, CellPadding, 0, 0)
						}),
						VerticalLine = RoactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(0, LineWidth, 1, 0),
							Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
							BackgroundColor3 = LineColor
						}),
						HorizontalAlignment = RoactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, LineWidth),
							Position = UDim2.new(0, 0, 1, 0),
							BackgroundColor3 = LineColor
						})
					}),
					Graph = IsExpandedEntryMatch and RoactModule.createElement(LineGraphModule, {
						axisLabelX = "Timestamp",
						pos = UDim2.new(0, 0, 0, EntryFrameHeight),
						size = UDim2.new(1, 0, 1, -EntryFrameHeight),
						graphData = value.dataSet,
						minY = value.min,
						maxY = value.max,
						getX = getX,
						getY = getY,
						axisLabelY = Text,
						stringFormatX = ConvertTimeStampModule,
						stringFormatY = formatData
					})
				})
			end
		end
	end
	if LayoutOrder1 == 1 then
		if Count == 0 then
			return RoactModule.createElement("TextLabel", {
				Text = "Awaiting Server Stats",
				BackgroundTransparency = 1,
				Size = Size,
				Position = UDim2.new(0, 0, 0, 0),
				TextColor3 = ConstantsModule.Color.Text,
				LayoutOrder = LayoutOrder
			})
		end
		Frames.emptyResult = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = Size,
			Text = string.format(NoResultSearchStr, SearchTerm),
			TextColor3 = ConstantsModule.Color.Text
		})
	end
	Frames.UIListLayout = RoactModule.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		LayoutOrder = LayoutOrder
	}, {
		Header = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, HeaderFrameHeight)
		}, {
			[ChartHeaderNames[1]] = RoactModule.createElement(CellLabelModule, {
				text = ChartHeaderNames[1],
				size = UDim2.new(1 - ValueCellWidth, -CellPadding - ExpandArrowPadding, 1, 0),
				pos = UDim2.new(0, CellPadding + ExpandArrowPadding, 0, 0)
			}),
			[ChartHeaderNames[2]] = RoactModule.createElement(CellLabelModule, {
				text = ChartHeaderNames[2],
				size = UDim2.new(ValueCellWidth, -CellPadding, 1, 0),
				pos = UDim2.new(1 - ValueCellWidth, CellPadding, 0, 0)
			}),
			upperHorizontalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				BackgroundColor3 = LineColor
			}),
			VerticalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, LineWidth, 1, 0),
				Position = UDim2.new(1 - ValueCellWidth, 0, 0, 0),
				BackgroundColor3 = LineColor
			}),
			lowerHorizontalLine = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, LineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = LineColor
			})
		}),
		mainFrame = RoactModule.createElement("ScrollingFrame", {
			ScrollBarThickness = 5,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, HeaderFrameHeight),
			Size = UDim2.new(1, 0, 1, -HeaderFrameHeight),
			CanvasSize = UDim2.new(1, 0, 0, Count * EntryFrameHeight + v1 * LineGraphHeight)
		}, Frames)
	})
end

return DataConsumerModule(ServerStats, "ServerStatsData")