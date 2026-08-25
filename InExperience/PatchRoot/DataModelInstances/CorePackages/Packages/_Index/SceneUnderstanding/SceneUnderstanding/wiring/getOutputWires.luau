local _ = require(script:FindFirstAncestor("SceneUnderstanding").wiring.types)

return function(p0)
	local t = {}
	
	for i, v in p0:GetOutputPins() do
		for i_1, v_1 in p0:GetConnectedWires(v) do
			table.insert(t, v_1)
		end
	end
	return t
end