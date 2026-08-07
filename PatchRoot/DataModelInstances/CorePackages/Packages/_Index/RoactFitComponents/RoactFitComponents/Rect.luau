-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

return {
	rectangle = function(vectorA, vectorB) --[[ line: 2 ]]
		return {
			top = vectorB,
			bottom = vectorB,
			left = vectorA,
			right = vectorA
		}
	end,
	square = function(p0) --[[ line: 10 ]]
		return { top = p0, bottom = p0, left = p0, right = p0 }
	end,
	quad = function(p1, p2, p3, p4) --[[ line: 18 ]]
		return { top = p1, bottom = p3, left = p4, right = p2 }
	end
}