-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0) --[[ line: 12 | named "ContextStack" ]]
	-- upvalues: reactModule (ref)
	local children = p0.children
	
	for i = #p0.providers, 1, -1 do
		children = reactModule.cloneElement(p0.providers[i], nil, children)
	end
	return children
end