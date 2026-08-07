-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local paginationSizeModule = require(foundation.Enums.PaginationSize)
local _ = require(foundation.Providers.Style.Tokens)
local t = {
	[paginationSizeModule.Small] = "row align-x-center align-y-center radius-circle size-600-600",
	[paginationSizeModule.Medium] = "row align-x-center align-y-center radius-circle size-800-800"
}
local t_1 = {
	[paginationSizeModule.Small] = "text-label-small",
	[paginationSizeModule.Medium] = "text-label-medium"
}

return {
	getCircularSlotTag = function(p0) --[[ line: 21 ]]
		-- upvalues: t (ref)
		return t[p0]
	end,
	getPageLabelTag = function(p1) --[[ line: 25 ]]
		-- upvalues: t_1 (ref)
		return `auto-xy {t_1[p1]} content-default text-align-x-center text-align-y-center`
	end,
	getPageLabelTextTag = function(p2) --[[ line: 29 ]]
		-- upvalues: t_1 (ref)
		return `auto-xy {t_1[p2]} text-align-x-center text-align-y-center`
	end,
	getSlotCursor = function(p3) --[[ line: 37 ]]
		return {
			radius = UDim.new(0, p3.Radius.Circle),
			offset = p3.Size.Size_150,
			borderWidth = math.floor(p3.Stroke.Thicker)
		}
	end,
	needsWidePageSlot = function(p4) --[[ line: 33 ]]
		return p4 > 999
	end
}