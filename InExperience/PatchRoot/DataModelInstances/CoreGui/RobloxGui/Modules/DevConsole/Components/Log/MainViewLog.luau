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

function mainViewLog.init(p0)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p1)
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onClientButton()
		-- upvalues: p0 (ref)
		p0.props.dispatchSetActiveTab("Log", true)
	end
	
	function p0.onServerButton()
		-- upvalues: p0 (ref)
		p0.props.dispatchSetActiveTab("Log", false)
	end
	
	function p0.onCheckboxChanged(p2, p3)
		-- upvalues: p0 (ref)
		if p0.props.isClientView then
			p0.props.ClientLogData:setFilter(p2, p3)
			
			return
		end
		p0.props.ServerLogData:setFilter(p2, p3)
	end
	
	function p0.filterUpdated()
		-- upvalues: p0 (ref)
		if p0.forceUpdate then
			p0:forceUpdate()
			
			return
		end
		p0:setState({})
	end
	
	function p0.onSearchTermChanged(p4)
		-- upvalues: p0 (ref)
		if p0.props.isClientView then
			p0.props.ClientLogData:setSearchTerm(p4)
			
			return
		end
		p0.props.ServerLogData:setSearchTerm(p4)
	end
	
	p0.clientFilterConnection = p0.props.ClientLogData:filterUpdatedSignal():Connect(p0.filterUpdated)
	p0.serverFilterConnection = p0.props.ServerLogData:filterUpdatedSignal():Connect(p0.filterUpdated)
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0 }
end

function mainViewLog.didMount(p5)
	p5:setState({ utilTabHeight = p5.utilRef.current.Size.Y.Offset })
end

function mainViewLog.didUpdate(p6)
	local size = p6.utilRef.current.Size
	
	if size.Y.Offset ~= p6.state.utilTabHeight then
		p6:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewLog.willUnmount(p7)
	if p7.clientFilterConnection then
		p7.clientFilterConnection:Disconnect()
		p7.clientFilterConnection = nil
	end
	if p7.serverFilterConnection then
		p7.serverFilterConnection:Disconnect()
		p7.serverFilterConnection = nil
	end
end

function mainViewLog.render(p8)
	-- upvalues: roactModule (ref), mainRowPadding (ref), msgTypeNamesOrdered (ref), utilAndTabModule (ref), clientLogModule (ref), serverLogModule (ref), constantsModule (ref)
	local size = p8.props.size
	local formFactor = p8.props.formFactor
	local isDeveloperView = p8.props.isDeveloperView
	local tabList = p8.props.tabList
	local isClientView = p8.props.isClientView
	local utilTabHeight = p8.state.utilTabHeight
	local var10 = if isClientView then p8.props.ClientLogData:getSearchTerm() else p8.props.ServerLogData:getSearchTerm()
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		})
	}
	local var12 = if isClientView then p8.props.ClientLogData:getFilters() else p8.props.ServerLogData:getFilters()
	local t_1 = {}
	
	for i, v in ipairs(msgTypeNamesOrdered) do
		t_1[i] = { name = v, state = var12[v] }
	end
	t.UtilAndTab = roactModule.createElement(utilAndTabModule, {
		layoutOrder = 1,
		windowWidth = size.X.Offset,
		formFactor = formFactor,
		tabList = tabList,
		orderedCheckboxState = t_1,
		isClientView = isClientView,
		searchTerm = var10,
		refForParent = p8.utilRef,
		onClientButton = isDeveloperView and p8.onClientButton,
		onServerButton = isDeveloperView and p8.onServerButton,
		onCheckboxChanged = p8.onCheckboxChanged,
		onSearchTermChanged = p8.onSearchTermChanged
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

return roactRoduxModule.UNSTABLE_connect2(function(p9, _)
	return { isClientView = p9.MainView.isClientView }
end, function(p10)
	-- upvalues: setActiveTabModule (ref)
	return {
		dispatchSetActiveTab = function(value, p11)
			-- upvalues: p10 (ref), setActiveTabModule (copy)
			p10(setActiveTabModule(value, p11))
		end
	}
end)(dataConsumerModule(mainViewLog, "ClientLogData", "ServerLogData"))