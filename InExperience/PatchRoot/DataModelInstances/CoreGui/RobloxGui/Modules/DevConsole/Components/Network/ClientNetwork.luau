local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local DataConsumerModule = require(script.Parent.Parent.Parent.Components.DataConsumer)
local NetworkViewModule = require(script.Parent.NetworkView)
local ClientNetwork = RoactModule.Component:extend("ClientNetwork")

function ClientNetwork.init(p1, _) --[[ Line: 10 ]]
	p1.state = { targetNetworkData = p1.props.ClientNetworkData }
end

function ClientNetwork.render(p1) --[[ Line: 16 ]]
	-- upvalues: RoactModule (copy), NetworkViewModule (copy)
	return RoactModule.createElement(NetworkViewModule, {
		size = p1.props.size,
		searchTerm = p1.props.searchTerm,
		layoutOrder = p1.props.layoutOrder,
		targetNetworkData = p1.state.targetNetworkData
	})
end

return DataConsumerModule(ClientNetwork, "ClientNetworkData")