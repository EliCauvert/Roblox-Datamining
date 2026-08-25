local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local dataConsumerModule = require(script.Parent.Parent.Parent.Components.DataConsumer)
local networkViewModule = require(script.Parent.NetworkView)
local clientNetwork = roactModule.Component:extend("ClientNetwork")

function clientNetwork.init(p0, _)
	p0.state = { targetNetworkData = p0.props.ClientNetworkData }
end

function clientNetwork.render(p1)
	-- upvalues: roactModule (ref), networkViewModule (ref)
	return roactModule.createElement(networkViewModule, {
		size = p1.props.size,
		searchTerm = p1.props.searchTerm,
		layoutOrder = p1.props.layoutOrder,
		targetNetworkData = p1.state.targetNetworkData
	})
end

return dataConsumerModule(clientNetwork, "ClientNetworkData")