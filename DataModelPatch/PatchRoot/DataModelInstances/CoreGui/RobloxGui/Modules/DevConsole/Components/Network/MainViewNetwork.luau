local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Components = script.Parent.Parent.Parent.Components
local ClientNetworkModule = require(Components.Network.ClientNetwork)
local ServerNetworkModule = require(Components.Network.ServerNetwork)
local UtilAndTabModule = require(Components.UtilAndTab)
local Actions = script.Parent.Parent.Parent.Actions
local ClientNetworkUpdateSearchFilterModule = require(Actions.ClientNetworkUpdateSearchFilter)
local ServerNetworkUpdateSearchFilterModule = require(Actions.ServerNetworkUpdateSearchFilter)
local SetActiveTabModule = require(Actions.SetActiveTab)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local MainViewNetwork = RoactModule.Component:extend("MainViewNetwork")

function MainViewNetwork.init(p1)
	-- upvalues: RoactModule (copy)
	function p1.onUtilTabHeightChanged(UtilTabHeight)
		-- upvalues: p1 (copy)
		p1:setState({ utilTabHeight = UtilTabHeight })
	end
	
	function p1.onClientButton()
		-- upvalues: p1 (copy)
		p1.props.dispatchSetActiveTab("Network", true)
	end
	
	function p1.onServerButton()
		-- upvalues: p1 (copy)
		p1.props.dispatchSetActiveTab("Network", false)
	end
	
	function p1.onSearchTermChanged(p2)
		-- upvalues: p1 (copy)
		if p1.props.isClientView then
			p1.props.dispatchClientNetworkUpdateSearchFilter(p2, {})
			
			return
		else
			p1.props.dispatchServerNetworkUpdateSearchFilter(p2, {})
		end
	end
	
	p1.utilRef = RoactModule.createRef()
	p1.state = { utilTabHeight = 0 }
end

function MainViewNetwork.didMount(p1)
	p1:setState({ utilTabHeight = p1.utilRef.current.Size.Y.Offset })
end

function MainViewNetwork.didUpdate(p1)
	local Size = p1.utilRef.current.Size
	
	if Size.Y.Offset ~= p1.state.utilTabHeight then
		p1:setState({ utilTabHeight = Size.Y.Offset })
	end
end

function MainViewNetwork.render(p1)
	-- upvalues: RoactModule (copy), MainRowPadding (copy), UtilAndTabModule (copy), ClientNetworkModule (copy), ServerNetworkModule (copy), ConstantsModule (copy)
	local Size = p1.props.size
	local IsClientView = p1.props.isClientView
	local UtilTabHeight: number = p1.state.utilTabHeight
	local ClientSearchTerm = IsClientView and p1.props.clientSearchTerm or p1.props.serverSearchTerm
	local config = {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		}),
		UtilAndTab = RoactModule.createElement(UtilAndTabModule, {
			layoutOrder = 1,
			windowWidth = Size.X.Offset,
			formFactor = p1.props.formFactor,
			tabList = p1.props.tabList,
			isClientView = IsClientView,
			searchTerm = ClientSearchTerm,
			refForParent = p1.utilRef,
			onHeightChanged = p1.onUtilTabHeightChanged,
			onClientButton = p1.onClientButton,
			onServerButton = p1.onServerButton,
			onSearchTermChanged = p1.onSearchTermChanged
		})
	}
	
	if UtilTabHeight > 0 then
		if IsClientView then
			config.ClientNetwork = RoactModule.createElement(ClientNetworkModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -UtilTabHeight),
				searchTerm = ClientSearchTerm
			})
		else
			config.ServerNetwork = RoactModule.createElement(ServerNetworkModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 1, -UtilTabHeight),
				searchTerm = ClientSearchTerm
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

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		isClientView = p1.MainView.isClientView,
		clientSearchTerm = p1.NetworkData.clientSearchTerm,
		serverSearchTerm = p1.NetworkData.serverSearchTerm
	}
end, function(Callback)
	-- upvalues: ClientNetworkUpdateSearchFilterModule (copy), ServerNetworkUpdateSearchFilterModule (copy), SetActiveTabModule (copy)
	return {
		dispatchClientNetworkUpdateSearchFilter = function(p1, p2)
			-- upvalues: Callback (copy), ClientNetworkUpdateSearchFilterModule (upval)
			Callback(ClientNetworkUpdateSearchFilterModule(p1, p2))
		end,
		dispatchServerNetworkUpdateSearchFilter = function(p1, p2)
			-- upvalues: Callback (copy), ServerNetworkUpdateSearchFilterModule (upval)
			Callback(ServerNetworkUpdateSearchFilterModule(p1, p2))
		end,
		dispatchSetActiveTab = function(p1, p2)
			-- upvalues: Callback (copy), SetActiveTabModule (upval)
			Callback(SetActiveTabModule(p1, p2))
		end
	}
end)(MainViewNetwork)