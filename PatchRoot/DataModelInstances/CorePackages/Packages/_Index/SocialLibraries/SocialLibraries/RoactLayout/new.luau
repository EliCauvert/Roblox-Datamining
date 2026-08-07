-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact

return function(p0, p1) --[[ line: 5 | named "new" ]]
	-- upvalues: roact (ref)
	local t = { blockLayout = p0 }
	
	for i, v in ipairs(p1 or {}) do
		t[i .. "-block"] = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = v.size,
			LayoutOrder = i
		}, { child = v.element })
	end
	return t
end