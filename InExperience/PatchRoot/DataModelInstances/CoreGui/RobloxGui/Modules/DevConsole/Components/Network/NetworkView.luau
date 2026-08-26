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

function networkView.init(p1, p2)
	-- upvalues: roactModule (ref)
	assert(p2.targetNetworkData, "Make sure the NetworkData is assigned for this NetworkView")
	local currentData = p2.targetNetworkData:getCurrentData()
	
	function p0.onSortChanged(p3)
		-- upvalues: p2 (ref), p1 (ref)
		if p3 == p2.targetNetworkData:getSortType() then
			p1:setState({ reverseSort = not p1.state.reverseSort })
			
			return
		end
		p2.targetNetworkData:setSortType(p3)
		p1:setState({ reverseSort = false })
	end
	
	function p0.onSummaryButton(_, _)
		-- upvalues: p1 (ref)
		p1:setState({ summaryExpanded = not p1.state.summaryExpanded })
	end
	
	function p0.onDetailButton(_, _)
		-- upvalues: p1 (ref)
		p1:setState({ entriesExpanded = not p1.state.entriesExpanded })
	end
	
	p1.ref = roactModule.createRef()
	p1.state = {
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

function networkView.didUpdate(p1)
	if p1.ref.current and p1.state.absWidth ~= p1.ref.current.AbsoluteSize.X then
		p1:setState({ absWidth = p1.ref.current.AbsoluteSize.X })
	end
end

function networkView.didMount(p1)
	p1.httpEntryAddedConnector = p1.props.targetNetworkData:Signal():Connect(function(p2, p3, p4)
		-- upvalues: p1 (ref)
		p1:setState({
			httpSummaryTable = p2,
			httpSummaryCount = p3,
			httpEntryList = p4
		})
	end)
	
	if p1.ref.current then
		p1:setState({ absWidth = p1.ref.current.AbsoluteSize.X })
	end
end

function networkView.willUnmount(p1)
	p1.httpEntryAddedConnector:Disconnect()
	p1.httpEntryAddedConnector = nil
end

function networkView.render(p1)
	-- upvalues: minFrameWidth (ref), summaryButtonHeight (ref), entryFrameHeight (ref), headerFrameHeight (ref), roactModule (ref), bannerButtonModule (ref), constantsModule (ref), mainWindow (ref), mainWindowHeader (ref), networkSummaryModule (ref), networkChartModule (ref)
	local layoutOrder = p1.props.layoutOrder
	local searchTerm = p1.props.searchTerm
	local size = p1.props.size
	local summaryExpanded = p1.state.summaryExpanded
	local entriesExpanded = p1.state.entriesExpanded
	local reverseSort = p1.state.reverseSort
	local httpSummaryTable = p1.state.httpSummaryTable
	local httpEntryList = p1.state.httpEntryList
	local httpSummaryCount = p1.state.httpSummaryCount
	local maxValue = math.max(minFrameWidth, p1.state.absWidth)
	local var1 = summaryButtonHeight * 2
	
	if summaryExpanded then
		var1 = var1 + httpSummaryCount * entryFrameHeight + headerFrameHeight
	end
	return roactModule.createElement("Frame", {
		Size = size,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = layoutOrder,
		[roactModule.Ref] = p1.ref
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
			onButtonPress = p1.onSummaryButton
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
			onButtonPress = p1.onDetailButton
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
			chartHeight = math.max(0, if p1.ref.current then p1.ref.current.AbsoluteSize.Y - var1 else size.Y.Offset - var1),
			width = maxValue,
			searchTerm = searchTerm,
			reverseSort = reverseSort,
			onSortChanged = p1.onSortChanged
		})
	})
end

return networkView