local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local headerFrameHeight = constantsModule.NetworkFormatting.HeaderFrameHeight
local entryFrameHeight = constantsModule.NetworkFormatting.EntryFrameHeight
local summaryButtonHeight = constantsModule.NetworkFormatting.SummaryButtonHeight
local minFrameWidth = constantsModule.NetworkFormatting.MinFrameWidth
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local components = script.Parent.Parent.Parent.Components
local bannerButtonModule = require(components.BannerButton)
local networkSummaryModule = require(components.Network.NetworkSummary)
local networkChartModule = require(components.Network.NetworkChart)
local networkView = roactModule.Component:extend("NetworkView")

function networkView.init(p0, p1) --[[ line: 22 ]]
	-- upvalues: roactModule (ref)
	assert(p1.targetNetworkData, "Make sure the NetworkData is assigned for this NetworkView")
	local currentData = p1.targetNetworkData:getCurrentData()
	
	function p0.onSortChanged(p2) --[[ line: 27 ]]
		-- upvalues: p1 (ref), p0 (ref)
		if p2 == p1.targetNetworkData:getSortType() then
			p0:setState({ reverseSort = not p0.state.reverseSort })
			
			return
		end
		p1.targetNetworkData:setSortType(p2)
		p0:setState({ reverseSort = false })
	end
	
	function p0.onSummaryButton(_, _) --[[ line: 41 ]]
		-- upvalues: p0 (ref)
		p0:setState({ summaryExpanded = not p0.state.summaryExpanded })
	end
	
	function p0.onDetailButton(_, _) --[[ line: 47 ]]
		-- upvalues: p0 (ref)
		p0:setState({ entriesExpanded = not p0.state.entriesExpanded })
	end
	
	p0.ref = roactModule.createRef()
	p0.state = {
		summaryExpanded = true,
		entriesExpanded = true,
		indexOfEntryExpanded = 0,
		reverseSort = false,
		absWidth = 0,
		httpSummaryTable = currentData.summaryTable,
		httpSummaryCount = currentData.summaryCount,
		httpEntryList = currentData.entryList
	}
end

function networkView.didUpdate(p3) --[[ line: 67 ]]
	if p3.ref.current and p3.state.absWidth ~= p3.ref.current.AbsoluteSize.X then
		p3:setState({ absWidth = p3.ref.current.AbsoluteSize.X })
	end
end

function networkView.didMount(p4) --[[ line: 77 ]]
	p4.httpEntryAddedConnector = p4.props.targetNetworkData:Signal():Connect(function(p5, p6, p7) --[[ line: 79 ]]
		-- upvalues: p4 (ref)
		p4:setState({
			httpSummaryTable = p5,
			httpSummaryCount = p6,
			httpEntryList = p7
		})
	end)
	
	if p4.ref.current then
		p4:setState({ absWidth = p4.ref.current.AbsoluteSize.X })
	end
end

function networkView.willUnmount(p8) --[[ line: 94 ]]
	p8.httpEntryAddedConnector:Disconnect()
	p8.httpEntryAddedConnector = nil
end

function networkView.render(p9) --[[ line: 99 ]]
	-- upvalues: minFrameWidth (ref), summaryButtonHeight (ref), entryFrameHeight (ref), headerFrameHeight (ref), roactModule (ref), bannerButtonModule (ref), constantsModule (ref), mainWindow (ref), mainWindowHeader (ref), networkSummaryModule (ref), networkChartModule (ref)
	local layoutOrder = p9.props.layoutOrder
	local searchTerm = p9.props.searchTerm
	local size = p9.props.size
	local summaryExpanded = p9.state.summaryExpanded
	local entriesExpanded = p9.state.entriesExpanded
	local reverseSort = p9.state.reverseSort
	local httpSummaryTable = p9.state.httpSummaryTable
	local httpEntryList = p9.state.httpEntryList
	local httpSummaryCount = p9.state.httpSummaryCount
	local maxValue = math.max(minFrameWidth, p9.state.absWidth)
	local var8 = summaryButtonHeight * 2
	
	if summaryExpanded then
		var8 = var8 + httpSummaryCount * entryFrameHeight + headerFrameHeight
	end
	return roactModule.createElement("Frame", {
		Size = size,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = layoutOrder,
		[roactModule.Ref] = p9.ref
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SummaryButton = roactModule.createElement(bannerButtonModule, {
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, summaryButtonHeight),
			pos = UDim2.new(),
			isExpanded = summaryExpanded,
			onButtonPress = p9.onSummaryButton
		}, {
			Text = roactModule.createElement("TextLabel", {
				Text = "Summary",
				BackgroundTransparency = 1,
				TextColor3 = constantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = mainWindow,
				Font = mainWindowHeader,
				Size = UDim2.new(1, -30, 0, summaryButtonHeight),
				Position = UDim2.new(0, 30, 0, 0)
			})
		}),
		Summary = summaryExpanded and roactModule.createElement(networkSummaryModule, {
			layoutOrder = 2,
			width = maxValue,
			httpSummaryTable = httpSummaryTable
		}),
		DetailsButton = roactModule.createElement(bannerButtonModule, {
			layoutOrder = 3,
			size = UDim2.new(1, 0, 0, summaryButtonHeight),
			pos = UDim2.new(),
			isExpanded = entriesExpanded,
			onButtonPress = p9.onDetailButton
		}, {
			Text = roactModule.createElement("TextLabel", {
				Text = "Details",
				BackgroundTransparency = 1,
				TextColor3 = constantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = mainWindow,
				Font = mainWindowHeader,
				Size = UDim2.new(1, -30, 0, summaryButtonHeight),
				Position = UDim2.new(0, 30, 0, 0)
			})
		}),
		Entries = entriesExpanded and roactModule.createElement(networkChartModule, {
			layoutOrder = 4,
			httpEntryList = httpEntryList,
			chartHeight = math.max(0, if p9.ref.current then p9.ref.current.AbsoluteSize.Y - var8 else size.Y.Offset - var8),
			width = maxValue,
			searchTerm = searchTerm,
			reverseSort = reverseSort,
			onSortChanged = p9.onSortChanged
		})
	})
end

return networkView