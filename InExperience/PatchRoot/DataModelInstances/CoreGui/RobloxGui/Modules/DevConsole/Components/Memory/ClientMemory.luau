local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local memoryViewModule = require(components.Memory.MemoryView)
local clientMemory = roactModule.Component:extend("ClientMemory")

function clientMemory.render(p1)
	-- upvalues: roactModule (ref), memoryViewModule (ref)
	return roactModule.createElement(memoryViewModule, {
		layoutOrder = p1.props.layoutOrder,
		size = p1.props.size,
		searchTerm = p1.props.searchTerm,
		targetMemoryData = p1.props.ClientMemoryData
	})
end

return dataConsumerModule(clientMemory, "ClientMemoryData")