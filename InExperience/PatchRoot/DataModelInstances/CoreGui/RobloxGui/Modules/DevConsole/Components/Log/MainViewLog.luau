local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local clientLogModule = require(components.Log.ClientLog)
local serverLogModule = require(components.Log.ServerLog)
local utilAndTabModule = require(components.UtilAndTab)
local dataConsumerModule = require(components.DataConsumer)
local setActiveTabModule = require(script.Parent.Parent.Parent.Actions.SetActiveTab)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local msgTypeNamesOrdered = constantsModule.MsgTypeNamesOrdered
local mainViewLog = roactModule.PureComponent:extend("MainViewLog")

function mainViewLog.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onClientButton()
		-- upvalues: p1 (ref)
		p1.props.dispatchSetActiveTab("Log", true)
	end
	
	function p0.onServerButton()
		-- upvalues: p1 (ref)
		p1.props.dispatchSetActiveTab("Log", false)
	end
	
	function p0.onCheckboxChanged(p2, p3)
		-- upvalues: p1 (ref)
		if p1.props.isClientView then
			p1.props.ClientLogData:setFilter(p2, p3)
			
			return
		end
		p1.props.ServerLogData:setFilter(p2, p3)
	end
	
	function p0.filterUpdated()
		-- upvalues: p1 (ref)
		if p1.forceUpdate then
			p1:forceUpdate()
			
			return
		end
		p1:setState({})
	end
	
	function p0.onSearchTermChanged(p2)
		-- upvalues: p1 (ref)
		if p1.props.isClientView then
			p1.props.ClientLogData:setSearchTerm(p2)
			
			return
		end
		p1.props.ServerLogData:setSearchTerm(p2)
	end
	
	p1.clientFilterConnection = p1.props.ClientLogData:filterUpdatedSignal():Connect(p1.filterUpdated)
	p1.serverFilterConnection = p1.props.ServerLogData:filterUpdatedSignal():Connect(p1.filterUpdated)
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function mainViewLog.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewLog.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewLog.willUnmount(p1)
	if p1.clientFilterConnection then
		p1.clientFilterConnection:Disconnect()
		p1.clientFilterConnection = nil
	end
	if p1.serverFilterConnection then
		p1.serverFilterConnection:Disconnect()
		p1.serverFilterConnection = nil
	end
end

function mainViewLog.render(p1)
	-- upvalues: roactModule (ref), mainRowPadding (ref), msgTypeNamesOrdered (ref), utilAndTabModule (ref), clientLogModule (ref), serverLogModule (ref), constantsModule (ref)
	local size = p1.props.size
	local formFactor = p1.props.formFactor
	local isDeveloperView = p1.props.isDeveloperView
	local tabList = p1.props.tabList
	local isClientView = p1.props.isClientView
	local utilTabHeight = p1.state.utilTabHeight
	local var1 = if isClientView then p1.props.ClientLogData:getSearchTerm() else p1.props.ServerLogData:getSearchTerm()
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		})
	}
	local var2 = if isClientView then p1.props.ClientLogData:getFilters() else p1.props.ServerLogData:getFilters()
	local t_1 = {}
	
	for i, v in ipairs(msgTypeNamesOrdered) do
		t_1[i] = { name = v, state = var2[v] }
	end
	t.UtilAndTab = roactModule.createElement(utilAndTabModule, {
		layoutOrder = 1,
		windowWidth = size.X.Offset,
		formFactor = formFactor,
		tabList = tabList,
		orderedCheckboxState = t_1,
		isClientView = isClientView,
		searchTerm = var1,
		refForParent = p1.utilRef,
		onClientButton = isDeveloperView and p1.onClientButton,
		onServerButton = isDeveloperView and p1.onServerButton,
		onCheckboxChanged = p1.onCheckboxChanged,
		onSearchTermChanged = p1.onSearchTermChanged
	})
	
	if utilTabHeight > 0 then
		if isClientView then
			t.ClientLog = roactModule.createElement(clientLogModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -utilTabHeight)
			})
		else
			t.ServerLog = roactModule.createElement(serverLogModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -utilTabHeight)
			})
		end
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = size,
		BackgroundColor3 = constantsModule.Color.BaseGray
	}, t)
end

return roactRoduxModule.UNSTABLE_connect2(function(p2, _)
	return { isClientView = p2.MainView.isClientView }
end, function(p2)
	-- upvalues: setActiveTabModule (ref)
	return {
		dispatchSetActiveTab = function(value, p3)
			-- upvalues: p2 (ref), setActiveTabModule (copy)
			p2(setActiveTabModule(value, p3))
		end
	}
end)(dataConsumerModule(mainViewLog, "ClientLogData", "ServerLogData"))