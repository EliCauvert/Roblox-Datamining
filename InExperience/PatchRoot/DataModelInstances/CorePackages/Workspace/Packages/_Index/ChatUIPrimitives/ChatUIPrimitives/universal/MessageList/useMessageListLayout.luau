local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local MessageInlineItemMetricsModule = require(script.Parent.Inline.MessageInlineItemMetrics)
local Frozen = table.freeze({ accepted = false, geometryChanged = false })

local function _(Tbl) --[[ Line: 11 | Named "rejectEmptyMeasurements" ]]
	-- upvalues: Frozen (copy)
	local Copy = table.clone(Tbl)
	
	function Copy.updateItemMeasurement(p1) --[[ Line: 13 ]]
		-- upvalues: Frozen (upval), Tbl (copy)
		return if p1.length <= 0 then Frozen else Tbl.updateItemMeasurement(p1)
	end
	
	return Copy
end

return function() --[[ Line: 22 | Named "useMessageListLayout" ]]
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy), MessageInlineItemMetricsModule (copy), Frozen (copy)
	local UseStateResult = ReactModule.useState(function() --[[ Line: 23 ]]
		-- upvalues: ViewRecyclerModule (upval), MessageInlineItemMetricsModule (upval), Frozen (upval)
		local MeasuredResult = ViewRecyclerModule.Layout.measured({
			estimatedItemLength = MessageInlineItemMetricsModule.MIN_HEIGHT
		})
		local Copy = table.clone(MeasuredResult)
		
		function Copy.updateItemMeasurement(p1) --[[ Line: 13 ]]
			-- upvalues: Frozen (upval), MeasuredResult (copy)
			return if p1.length <= 0 then Frozen else MeasuredResult.updateItemMeasurement(p1)
		end
		
		return Copy
	end)
	ReactModule.useEffect(function() --[[ Line: 28 ]]
		-- upvalues: UseStateResult (copy)
		return function() --[[ Line: 29 ]]
			-- upvalues: UseStateResult (upval)
			UseStateResult.destroy()
		end
	end, { UseStateResult })
	
	return UseStateResult
end