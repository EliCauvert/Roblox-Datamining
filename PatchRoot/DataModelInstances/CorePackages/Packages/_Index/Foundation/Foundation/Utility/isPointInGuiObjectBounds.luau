-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "isPointInGuiObjectBounds" ]]
	if p0 then
		local absolutePosition = p0.AbsolutePosition
		local absoluteSize = p0.AbsoluteSize
		
		return absolutePosition.X <= p1.X and (p1.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p1.Y and p1.Y <= absolutePosition.Y + absoluteSize.Y))
	end
	return false
end