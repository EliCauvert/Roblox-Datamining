local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local dataConsumerModule = require(components.DataConsumer)
local memoryViewModule = require(components.Memory.MemoryView)
local serverMemory = roactModule.Component:extend("ServerMemory")

function serverMemory.render(p0) --[[ line: 10 ]]
	-- upvalues: roactModule (ref), memoryViewModule (ref)
	return roactModule.createElement(memoryViewModule, {
		layoutOrder = p0.props.layoutOrder,
		size = p0.props.size,
		searchTerm = p0.props.searchTerm,
		targetMemoryData = p0.props.ServerMemoryData
	})
end

return dataConsumerModule(serverMemory, "ServerMemoryData")