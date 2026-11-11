local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local HeaderFrameHeight = ConstantsModule.NetworkFormatting.HeaderFrameHeight
local EntryFrameHeight = ConstantsModule.NetworkFormatting.EntryFrameHeight
local SummaryButtonHeight = ConstantsModule.NetworkFormatting.SummaryButtonHeight
local MinFrameWidth = ConstantsModule.NetworkFormatting.MinFrameWidth
local MainWindow = ConstantsModule.DefaultFontSize.MainWindow
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local Components = script.Parent.Parent.Parent.Components
local BannerButtonModule = require(Components.BannerButton)
local NetworkSummaryModule = require(Components.Network.NetworkSummary)
local NetworkChartModule = require(Components.Network.NetworkChart)
local NetworkView = RoactModule.Component:extend("NetworkView")

function NetworkView.init(p1, p2)
	-- upvalues: RoactModule (copy)
	assert(p2.targetNetworkData, "Make sure the NetworkData is assigned for this NetworkView")
	local CurrentData = p2.targetNetworkData:getCurrentData()
	
	function p1.onSortChanged(SortType)
		-- upvalues: p2 (copy), p1 (copy)
		if SortType == p2.targetNetworkData:getSortType() then
			p1:setState({ reverseSort = not p1.state.reverseSort })
			
			return
		else
			p2.targetNetworkData:setSortType(SortType)
			p1:setState({ reverseSort = false })
		end
	end
	
	function p1:onSummaryButton(_)
		-- upvalues: p1 (copy)
		p1:setState({ summaryExpanded = not p1.state.summaryExpanded })
	end
	
	function p1:onDetailButton(_)
		-- upvalues: p1 (copy)
		p1:setState({ entriesExpanded = not p1.state.entriesExpanded })
	end
	
	p1.ref = RoactModule.createRef()
	p1.state = {
		summaryExpanded = true,
		entriesExpanded = true,
		indexOfEntryExpanded = 0,
		reverseSort = false,
		absWidth = 0,
		httpSummaryTable = CurrentData.summaryTable,
		httpSummaryCount = CurrentData.summaryCount,
		httpEntryList = CurrentData.entryList
	}
end

function NetworkView.didUpdate(p1)
	if p1.ref.current and p1.state.absWidth ~= p1.ref.current.AbsoluteSize.X then
		p1:setState({ absWidth = p1.ref.current.AbsoluteSize.X })
	end
end

function NetworkView.didMount(p1)
	p1.httpEntryAddedConnector = p1.props.targetNetworkData:Signal():Connect(function(HttpSummaryTable, HttpSummaryCount, HttpEntryList)
		-- upvalues: p1 (copy)
		p1:setState({
			httpSummaryTable = HttpSummaryTable,
			httpSummaryCount = HttpSummaryCount,
			httpEntryList = HttpEntryList
		})
	end)
	
	if p1.ref.current then
		p1:setState({ absWidth = p1.ref.current.AbsoluteSize.X })
	end
end

function NetworkView.willUnmount(p1)
	p1.httpEntryAddedConnector:Disconnect()
	p1.httpEntryAddedConnector = nil
end

function NetworkView.render(p1)
	-- upvalues: MinFrameWidth (copy), SummaryButtonHeight (copy), EntryFrameHeight (copy), HeaderFrameHeight (copy), RoactModule (copy), BannerButtonModule (copy), ConstantsModule (copy), MainWindow (copy), MainWindowHeader (copy), NetworkSummaryModule (copy), NetworkChartModule (copy)
	local LayoutOrder = p1.props.layoutOrder
	local SearchTerm = p1.props.searchTerm
	local Size = p1.props.size
	local SummaryExpanded = p1.state.summaryExpanded
	local EntriesExpanded = p1.state.entriesExpanded
	local ReverseSort = p1.state.reverseSort
	local HttpSummaryTable = p1.state.httpSummaryTable
	local HttpEntryList = p1.state.httpEntryList
	local HttpSummaryCount = p1.state.httpSummaryCount
	local Largest = math.max(MinFrameWidth, p1.state.absWidth)
	local ScaledSummaryButtonHeight = SummaryButtonHeight * 2
	
	if SummaryExpanded then
		ScaledSummaryButtonHeight = ScaledSummaryButtonHeight + HttpSummaryCount * EntryFrameHeight + HeaderFrameHeight
	end
	local Largest1 = math.max(0, if p1.ref.current then p1.ref.current.AbsoluteSize.Y - ScaledSummaryButtonHeight else Size.Y.Offset - ScaledSummaryButtonHeight)
	
	return RoactModule.createElement("Frame", {
		Size = Size,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		LayoutOrder = LayoutOrder,
		[RoactModule.Ref] = p1.ref
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SummaryButton = RoactModule.createElement(BannerButtonModule, {
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, SummaryButtonHeight),
			pos = UDim2.new(),
			isExpanded = SummaryExpanded,
			onButtonPress = p1.onSummaryButton
		}, {
			Text = RoactModule.createElement("TextLabel", {
				Text = "Summary",
				BackgroundTransparency = 1,
				TextColor3 = ConstantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = MainWindow,
				Font = MainWindowHeader,
				Size = UDim2.new(1, -30, 0, SummaryButtonHeight),
				Position = UDim2.new(0, 30, 0, 0)
			})
		}),
		Summary = SummaryExpanded and RoactModule.createElement(NetworkSummaryModule, {
			layoutOrder = 2,
			width = Largest,
			httpSummaryTable = HttpSummaryTable
		}),
		DetailsButton = RoactModule.createElement(BannerButtonModule, {
			layoutOrder = 3,
			size = UDim2.new(1, 0, 0, SummaryButtonHeight),
			pos = UDim2.new(),
			isExpanded = EntriesExpanded,
			onButtonPress = p1.onDetailButton
		}, {
			Text = RoactModule.createElement("TextLabel", {
				Text = "Details",
				BackgroundTransparency = 1,
				TextColor3 = ConstantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextSize = MainWindow,
				Font = MainWindowHeader,
				Size = UDim2.new(1, -30, 0, SummaryButtonHeight),
				Position = UDim2.new(0, 30, 0, 0)
			})
		}),
		Entries = EntriesExpanded and RoactModule.createElement(NetworkChartModule, {
			layoutOrder = 4,
			httpEntryList = HttpEntryList,
			chartHeight = Largest1,
			width = Largest,
			searchTerm = SearchTerm,
			reverseSort = ReverseSort,
			onSortChanged = p1.onSortChanged
		})
	})
end

return NetworkView