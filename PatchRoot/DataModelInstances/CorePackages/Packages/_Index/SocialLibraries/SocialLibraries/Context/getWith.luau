-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:24 2026 Pacific Standard Time.

local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(p0) --[[ line: 5 ]]
	-- upvalues: roact (ref)
	return function(p1) --[[ line: 6 ]]
		-- upvalues: roact (copy), p0 (ref)
		assert(type(p1) == "function", "Expect renderCallback to be a function.")
		
		return roact.createElement(p0.Consumer, { render = p1 })
	end
end