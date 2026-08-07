-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

local getTextHeightModule = require(script.Parent.Parent.GetTextHeight)

return {
	getExpandableTextHeights = function(p0, p1, p2, p3) --[[ line: 4 ]]
		-- upvalues: getTextHeightModule (ref)
		local var1 = p0.BaseSize * p0.Body.RelativeSize
		
		return getTextHeightModule(p2, p0.Body.Font, var1, p1), p3 * var1
	end,
	getCanExpand = function(p4, p5, p6, p7) --[[ line: 14 ]]
		-- upvalues: getTextHeightModule (ref)
		local var2 = p4.BaseSize * p4.Body.RelativeSize
		
		return p7 * var2 < getTextHeightModule(p6, p4.Body.Font, var2, p5)
	end
}