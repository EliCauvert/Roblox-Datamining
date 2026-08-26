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
	getCircularSlotTag = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end,
	getPageLabelTag = function(p1)
		-- upvalues: t_1 (ref)
		return `auto-xy {t_1[p1]} content-default text-align-x-center text-align-y-center`
	end,
	getPageLabelTextTag = function(p1)
		-- upvalues: t_1 (ref)
		return `auto-xy {t_1[p1]} text-align-x-center text-align-y-center`
	end,
	getSlotCursor = function(p1)
		return {
			radius = UDim.new(0, p1.Radius.Circle),
			offset = p1.Size.Size_150,
			borderWidth = math.floor(p1.Stroke.Thicker)
		}
	end,
	needsWidePageSlot = function(p1)
		return p1 > 999
	end
}