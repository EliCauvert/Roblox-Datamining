-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("SceneUnderstanding").wiring.types)

return function(p0) --[[ line: 7 | named "getOutputWires" ]]
	local t = {}
	
	for i, v in p0:GetOutputPins() do
		for i_1, v_1 in p0:GetConnectedWires(v) do
			table.insert(t, v_1)
		end
	end
	return t
end