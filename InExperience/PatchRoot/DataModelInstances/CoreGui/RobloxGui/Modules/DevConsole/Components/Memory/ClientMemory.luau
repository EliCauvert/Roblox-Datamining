local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local DataConsumerModule = require(Components.DataConsumer)
local MemoryViewModule = require(Components.Memory.MemoryView)
local ClientMemory = RoactModule.Component:extend("ClientMemory")

function ClientMemory.render(p1) --[[ Line: 10 ]]
	-- upvalues: RoactModule (copy), MemoryViewModule (copy)
	return RoactModule.createElement(MemoryViewModule, {
		layoutOrder = p1.props.layoutOrder,
		size = p1.props.size,
		searchTerm = p1.props.searchTerm,
		targetMemoryData = p1.props.ClientMemoryData
	})
end

return DataConsumerModule(ClientMemory, "ClientMemoryData")