local _ = require(script:FindFirstAncestor("SceneUnderstanding").wiring.types)

return function(p1)
	local List = {}
	
	for _, outputPin in p1:GetOutputPins() do
		for _, connectedWire in p1:GetConnectedWires(outputPin) do
			table.insert(List, connectedWire)
		end
	end
	return List
end