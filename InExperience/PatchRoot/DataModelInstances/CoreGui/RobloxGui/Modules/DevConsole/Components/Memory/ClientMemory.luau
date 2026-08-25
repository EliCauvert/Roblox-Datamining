local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local memoryViewModule = require(components.Memory.MemoryView)
local clientMemory = roactModule.Component:extend("ClientMemory")

function clientMemory.render(p0)
	-- upvalues: roactModule (ref), memoryViewModule (ref)
	return roactModule.createElement(memoryViewModule, {
		layoutOrder = p0.props.layoutOrder,
		size = p0.props.size,
		searchTerm = p0.props.searchTerm,
		targetMemoryData = p0.props.ClientMemoryData
	})
end

return dataConsumerModule(clientMemory, "ClientMemoryData")