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
	getCircularSlotTag = function(p0)
		-- upvalues: t (ref)
		return t[p0]
	end,
	getPageLabelTag = function(p1)
		-- upvalues: t_1 (ref)
		return `auto-xy {t_1[p1]} content-default text-align-x-center text-align-y-center`
	end,
	getPageLabelTextTag = function(p2)
		-- upvalues: t_1 (ref)
		return `auto-xy {t_1[p2]} text-align-x-center text-align-y-center`
	end,
	getSlotCursor = function(p3)
		return {
			radius = UDim.new(0, p3.Radius.Circle),
			offset = p3.Size.Size_150,
			borderWidth = math.floor(p3.Stroke.Thicker)
		}
	end,
	needsWidePageSlot = function(p4)
		return p4 > 999
	end
}