local Foundation = script:FindFirstAncestor("Foundation")
local PaginationSizeModule = require(Foundation.Enums.PaginationSize)
local _ = require(Foundation.Providers.Style.Tokens)
local config = {
	[PaginationSizeModule.Small] = "row align-x-center align-y-center radius-circle size-600-600",
	[PaginationSizeModule.Medium] = "row align-x-center align-y-center radius-circle size-800-800"
}
local config1 = {
	[PaginationSizeModule.Small] = "text-label-small",
	[PaginationSizeModule.Medium] = "text-label-medium"
}

return {
	getCircularSlotTag = function(p1)
		-- upvalues: config (copy)
		return config[p1]
	end,
	getPageLabelTag = function(p1): string
		-- upvalues: config1 (copy)
		return `auto-xy {config1[p1]} content-default text-align-x-center text-align-y-center`
	end,
	getPageLabelTextTag = function(p1): string
		-- upvalues: config1 (copy)
		return `auto-xy {config1[p1]} text-align-x-center text-align-y-center`
	end,
	getSlotCursor = function(p1)
		return {
			radius = UDim.new(0, p1.Radius.Circle),
			offset = p1.Size.Size_150,
			borderWidth = math.floor(p1.Stroke.Thicker)
		}
	end,
	needsWidePageSlot = function(p1: number): boolean
		return p1 > 999
	end
}