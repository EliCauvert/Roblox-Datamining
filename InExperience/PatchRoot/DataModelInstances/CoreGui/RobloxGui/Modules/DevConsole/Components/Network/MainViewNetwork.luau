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

function mainViewNetwork.init(p0) --[[ line: 20 ]]
	-- upvalues: roactModule (ref)
	function p0.onUtilTabHeightChanged(p1) --[[ line: 21 ]]
		-- upvalues: p0 (ref)
		p0:setState({ utilTabHeight = p1 })
	end
	
	function p0.onClientButton() --[[ line: 27 ]]
		-- upvalues: p0 (ref)
		p0.props.dispatchSetActiveTab("Network", true)
	end
	
	function p0.onServerButton() --[[ line: 31 ]]
		-- upvalues: p0 (ref)
		p0.props.dispatchSetActiveTab("Network", false)
	end
	
	function p0.onSearchTermChanged(p2) --[[ line: 35 ]]
		-- upvalues: p0 (ref)
		if p0.props.isClientView then
			p0.props.dispatchClientNetworkUpdateSearchFilter(p2, {})
			
			return
		end
		p0.props.dispatchServerNetworkUpdateSearchFilter(p2, {})
	end
	
	p0.utilRef = roactModule.createRef()
	p0.state = { utilTabHeight = 0 }
end

function mainViewNetwork.didMount(p3) --[[ line: 50 ]]
	p3:setState({ utilTabHeight = p3.utilRef.current.Size.Y.Offset })
end

function mainViewNetwork.didUpdate(p4) --[[ line: 57 ]]
	local size = p4.utilRef.current.Size
	
	if size.Y.Offset ~= p4.state.utilTabHeight then
		p4:setState({ utilTabHeight = size.Y.Offset })
	end
end

function mainViewNetwork.render(p5) --[[ line: 66 ]]
	-- upvalues: roactModule (ref), mainRowPadding (ref), utilAndTabModule (ref), clientNetworkModule (ref), serverNetworkModule (ref), constantsModule (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, mainRowPadding)
		})
	}
	local size = p5.props.size
	local formFactor = p5.props.formFactor
	local tabList = p5.props.tabList
	local isClientView = p5.props.isClientView
	local utilTabHeight = p5.state.utilTabHeight
	local var12 = if isClientView then p5.props.clientSearchTerm else p5.props.serverSearchTerm
	t.UtilAndTab = roactModule.createElement(utilAndTabModule, {
		layoutOrder = 1,
		windowWidth = size.X.Offset,
		formFactor = formFactor,
		tabList = tabList,
		isClientView = isClientView,
		searchTerm = var12,
		refForParent = p5.utilRef,
		onHeightChanged = p5.onUtilTabHeightChanged,
		onClientButton = p5.onClientButton,
		onServerButton = p5.onServerButton,
		onSearchTermChanged = p5.onSearchTermChanged
	})
	
	if utilTabHeight > 0 then
		if isClientView then
			t.ClientNetwork = roactModule.createElement(clientNetworkModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -utilTabHeight),
				searchTerm = var12
			})
		else
			t.ServerNetwork = roactModule.createElement(serverNetworkModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -utilTabHeight),
				searchTerm = var12
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

return roactRoduxModule.UNSTABLE_connect2(function(p6, _) --[[ line: 121 | named "mapStateToProps" ]]
	return {
		isClientView = p6.MainView.isClientView,
		clientSearchTerm = p6.NetworkData.clientSearchTerm,
		serverSearchTerm = p6.NetworkData.serverSearchTerm
	}
end, function(p7) --[[ line: 129 | named "mapDispatchToProps" ]]
	-- upvalues: clientNetworkUpdateSearchFilterModule (ref), serverNetworkUpdateSearchFilterModule (ref), setActiveTabModule (ref)
	return {
		dispatchClientNetworkUpdateSearchFilter = function(p8, p9) --[[ line: 131 ]]
			-- upvalues: p7 (ref), clientNetworkUpdateSearchFilterModule (copy)
			p7(clientNetworkUpdateSearchFilterModule(p8, p9))
		end,
		dispatchServerNetworkUpdateSearchFilter = function(p10, p11) --[[ line: 135 ]]
			-- upvalues: p7 (ref), serverNetworkUpdateSearchFilterModule (copy)
			p7(serverNetworkUpdateSearchFilterModule(p10, p11))
		end,
		dispatchSetActiveTab = function(value, p12) --[[ line: 138 ]]
			-- upvalues: p7 (ref), setActiveTabModule (copy)
			p7(setActiveTabModule(value, p12))
		end
	}
end)(mainViewNetwork)