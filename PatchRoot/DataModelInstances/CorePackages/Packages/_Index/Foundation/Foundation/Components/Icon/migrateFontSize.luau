-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)

return function(p0, p1) --[[ line: 6 | named "migrateFontSize" ]]
	local size100 = p1.Size.Size_100
	local size600 = p1.Size.Size_600
	
	if size600 <= p0 and p0 <= p1.Size.Size_900 then
		p0 = size600
	end
	return math.round(p0 / size100) * size100
end