-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return reactModule.memo(function(p0) --[[ line: 13 | named "StyleRule" ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("StyleRule", {
		Priority = p0.Priority or 1,
		Selector = p0.Selector,
		ref = reactModule.useCallback(function(p1) --[[ line: 14 ]]
			-- upvalues: p0 (ref)
			if p1 ~= nil then
				p1:SetProperties(p0.properties)
			end
		end, { p0.properties })
	})
end)