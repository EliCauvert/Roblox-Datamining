-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 10 ]]
	if p0.SliceCenter then
		p0.SliceCenter = Rect.new(p0.SliceCenter.Min * p1, p0.SliceCenter.Max * p1)
		p0.SliceScale = (p0.SliceScale or 1) / p1
	end
	return p0
end