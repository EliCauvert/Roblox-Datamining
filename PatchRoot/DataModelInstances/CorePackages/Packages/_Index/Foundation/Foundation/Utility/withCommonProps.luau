-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:30 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return function(p0, p1) --[[ line: 6 | named "withCommonProps" ]]
	if type(p1) == "table" then
		p1.AnchorPoint = p0.AnchorPoint
		p1.LayoutOrder = p0.LayoutOrder
		p1.Position = p0.Position
		p1.Visible = p0.Visible
		p1.ZIndex = p0.ZIndex
		p1.onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged
		p1.onAbsolutePositionChanged = p0.onAbsolutePositionChanged
		p1.testId = p0.testId
	end
	return p1
end