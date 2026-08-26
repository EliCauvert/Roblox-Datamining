local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local components = script.Parent.Parent.Parent.Components
local clientNetworkModule = require(components.Network.ClientNetwork)
local serverNetworkModule = require(components.Network.ServerNetwork)
local utilAndTabModule = require(components.UtilAndTab)
local actions = script.Parent.Parent.Parent.Actions
local clientNetworkUpdateSearchFilterModule = require(actions.ClientNetworkUpdateSearchFilter)
local serverNetworkUpdateSearchFilterModule = require(actions.ServerNetworkUpdateSearchFilter)
local setActiveTabModule = require(actions.SetActiveTab)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainRowPadding = constantsModule.GeneralFormatting.MainRowPadding
local mainViewNetwork = roactModule.Component:extend("MainViewNetwork")

function mainViewNetwork.init(p1)
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ utilTabHeight = p2 })
	end
	
	function p0.onClientButton()
		-- upvalues: p1 (ref)
		p1.props.dispatchSetActiveTab("Network", true)
	end
	
	function p0.onServerButton()
		-- upvalues: p1 (ref)
		p1.props.dispatchSetActiveTab("Network", false)
	end
	
	function p0.onSearchTermChanged(p2)
		-- upvalues: p1 (ref)
		if p1.props.isClientView then
			p1.props.dispatchClientNetworkUpdateSearchFilter(p2, {})
			
			return
		end
		p1.props.dispatchServerNetworkUpdateSearchFilter(p2, {})
	end
	
	p1.utilRef = roactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function mainViewNetwork.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function mainViewNetwork.didUpdate(p1)
	local size = p1.utilRef.current.Size
	
	if size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewNetwork.render(p1)
	-- upvalues: roactModule (ref), mainRowPadding (ref), utilAndTabModule (ref), clientNetworkModule (ref), serverNetworkModule (ref), constantsModule (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		})
	}
	local size = p1.props.size
	local formFactor = p1.props.formFactor
	local tabList = p1.props.tabList
	local isClientView = p1.props.isClientView
	local utilTabHeight = p1.state.utilTabHeight
	local var1 = if isClientView then p1.props.clientSearchTerm else p1.props.serverSearchTerm
	t.UtilAndTab = roactModule.createElement(utilAndTabModule, {
		layoutOrder = 1,
		windowWidth = size.X.Offset,
		formFactor = formFactor,
		tabList = tabList,
		isClientView = isClientView,
		searchTerm = var1,
		refForParent = p1.utilRef,
		onHeightChanged = p1.onUtilTabHeightChanged,
		onClientButton = p1.onClientButton,
		onServerButton = p1.onServerButton,
		onSearchTermChanged = p1.onSearchTermChanged
	})
	
	if utilTabHeight > 0 then
		if isClientView then
			t.ClientNetwork = roactModule.createElement(clientNetworkModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -utilTabHeight),
				searchTerm = var1
			})
		else
			t.ServerNetwork = roactModule.createElement(serverNetworkModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -utilTabHeight),
				searchTerm = var1
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

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		isClientView = p1.MainView.isClientView,
		clientSearchTerm = p1.NetworkData.clientSearchTerm,
		serverSearchTerm = p1.NetworkData.serverSearchTerm
	}
end, function(p1)
	-- upvalues: clientNetworkUpdateSearchFilterModule (ref), serverNetworkUpdateSearchFilterModule (ref), setActiveTabModule (ref)
	return {
		dispatchClientNetworkUpdateSearchFilter = function(p2, p3)
			-- upvalues: p1 (ref), clientNetworkUpdateSearchFilterModule (copy)
			p1(clientNetworkUpdateSearchFilterModule(p2, p3))
		end,
		dispatchServerNetworkUpdateSearchFilter = function(p2, p3)
			-- upvalues: p1 (ref), serverNetworkUpdateSearchFilterModule (copy)
			p1(serverNetworkUpdateSearchFilterModule(p2, p3))
		end,
		dispatchSetActiveTab = function(value, p2)
			-- upvalues: p1 (ref), setActiveTabModule (copy)
			p1(setActiveTabModule(value, p2))
		end
	}
end)(mainViewNetwork)