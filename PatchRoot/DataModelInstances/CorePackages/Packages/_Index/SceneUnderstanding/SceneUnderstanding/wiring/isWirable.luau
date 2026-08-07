-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 | named "isWirable" ]]
	return pcall(function() --[[ line: 2 ]]
		-- upvalues: p0 (ref)
		p0:GetInputPins()
		p0:GetOutputPins()
		p0:GetConnectedWires("Foo")
	end)
end