local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local ClientLogModule = require(Components.Log.ClientLog)
local ServerLogModule = require(Components.Log.ServerLog)
local UtilAndTabModule = require(Components.UtilAndTab)
local DataConsumerModule = require(Components.DataConsumer)
local SetActiveTabModule = require(script.Parent.Parent.Parent.Actions.SetActiveTab)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MsgTypeNamesOrdered = ConstantsModule.MsgTypeNamesOrdered
local MainViewLog = RoactModule.PureComponent:extend("MainViewLog")

function MainViewLog.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onClientButton()
		-- upvalues: p1 (copy)
		p1.props.dispatchSetActiveTab("Log", true)
	end
	
	function p1.onServerButton()
		-- upvalues: p1 (copy)
		p1.props.dispatchSetActiveTab("Log", false)
	end
	
	function p1.onCheckboxChanged(p2, p3)
		-- upvalues: p1 (copy)
		if p1.props.isClientView then
			p1.props.ClientLogData:setFilter(p2, p3)
			
			return
		else
			p1.props.ServerLogData:setFilter(p2, p3)
		end
	end
	
	function p1.filterUpdated()
		-- upvalues: p1 (copy)
		if p1.forceUpdate then
			p1:forceUpdate()
			
			return
		else
			p1:setState({})
		end
	end
	
	function p1.onSearchTermChanged(p2)
		-- upvalues: p1 (copy)
		if p1.props.isClientView then
			p1.props.ClientLogData:setSearchTerm(p2)
			
			return
		else
			p1.props.ServerLogData:setSearchTerm(p2)
		end
	end
	
	p1.clientFilterConnection = p1.props.ClientLogData:filterUpdatedSignal():Connect(p1.filterUpdated)
	p1.serverFilterConnection = p1.props.ServerLogData:filterUpdatedSignal():Connect(p1.filterUpdated)
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewLog.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewLog.didUpdate(p1)
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewLog.willUnmount(p1)
	if p1.clientFilterConnection then
		p1.clientFilterConnection:Disconnect()
		p1.clientFilterConnection = nil
	end
	if p1.serverFilterConnection then
		p1.serverFilterConnection:Disconnect()
		p1.serverFilterConnection = nil
	end
end

function MainViewLog.render(p1)
	-- upvalues: RoactModule (copy), MainRowPadding (copy), MsgTypeNamesOrdered (copy), UtilAndTabModule (copy), ClientLogModule (copy), ServerLogModule (copy), ConstantsModule (copy)
	local Size = p1.props.size
	local FormFactor = p1.props.formFactor
	local IsDeveloperView = p1.props.isDeveloperView
	local TabList = p1.props.tabList
	local IsClientView = p1.props.isClientView
	local UtilTabHeight: number = p1.state.utilTabHeight
	local SearchTerm = if IsClientView then p1.props.ClientLogData:getSearchTerm() else p1.props.ServerLogData:getSearchTerm()
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		})
	}
	local Filters = if IsClientView then p1.props.ClientLogData:getFilters() else p1.props.ServerLogData:getFilters()
	local OrderedCheckboxState = {}
	
	for i, Name in ipairs(MsgTypeNamesOrdered) do
		OrderedCheckboxState[i] = { name = Name, state = Filters[Name] }
	end
	config.UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
		layoutOrder = 1,
		windowWidth = Size.X.Offset,
		formFactor = FormFactor,
		tabList = TabList,
		orderedCheckboxState = OrderedCheckboxState,
		isClientView = IsClientView,
		searchTerm = SearchTerm,
		refForParent = p1.utilRef,
		onClientButton = IsDeveloperView and p1.onClientButton,
		onServerButton = IsDeveloperView and p1.onServerButton,
		onCheckboxChanged = p1.onCheckboxChanged,
		onSearchTermChanged = p1.onSearchTermChanged
	})
	
	if UtilTabHeight > 0 then
		if IsClientView then
			config.ClientLog = RoactModule.createElement(ClientLogModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -UtilTabHeight)
			})
		else
			config.ServerLog = RoactModule.createElement(ServerLogModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -UtilTabHeight)
			})
		end
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = Size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray
	}, config)
end

return RoactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return { isClientView = p2.MainView.isClientView }
end, function(Callback)
	-- upvalues: SetActiveTabModule (copy)
	return {
		dispatchSetActiveTab = function(p2, p3)
			-- upvalues: Callback (copy), SetActiveTabModule (upval)
			Callback(SetActiveTabModule(p2, p3))
		end
	}
end)(DataConsumerModule(MainViewLog, "ClientLogData", "ServerLogData"))