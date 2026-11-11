local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local MemoryViewModule = require(Components.Memory.MemoryView)
local ServerMemory = RoactModule.Component:extend("ServerMemory")

function ServerMemory.render(p1)
	-- upvalues: RoactModule (copy), MemoryViewModule (copy)
	return RoactModule.createElement(MemoryViewModule, {
		layoutOrder = p1.props.layoutOrder,
		size = p1.props.size,
		searchTerm = p1.props.searchTerm,
		targetMemoryData = p1.props.ServerMemoryData
	})
end

return DataConsumerModule(ServerMemory, "ServerMemoryData")