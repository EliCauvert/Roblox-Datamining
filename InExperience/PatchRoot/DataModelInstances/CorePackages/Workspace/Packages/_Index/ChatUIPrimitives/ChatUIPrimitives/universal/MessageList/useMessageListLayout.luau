local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local MessageInlineItemMetricsModule = require(script.Parent.Inline.MessageInlineItemMetrics)
local Frozen = table.freeze({ accepted = false, geometryChanged = false })

local function _(Tbl)
	-- upvalues: Frozen (copy)
	local Copy = table.clone(Tbl)
	
	function Copy.updateItemMeasurement(p1)
		-- upvalues: Frozen (upval), Tbl (copy)
		return if p1.length <= 0 then Frozen else Tbl.updateItemMeasurement(p1)
	end
	
	return Copy
end

return function(p1)
	-- upvalues: MessageInlineItemMetricsModule (copy), ReactModule (copy), ViewRecyclerModule (copy), Frozen (copy)
	local MINHEIGHT = if p1 == nil then MessageInlineItemMetricsModule.MIN_HEIGHT else p1
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ViewRecyclerModule (upval), MINHEIGHT (copy), Frozen (upval)
		local MeasuredResult = ViewRecyclerModule.Layout.measured({ estimatedItemLength = MINHEIGHT })
		local Copy = table.clone(MeasuredResult)
		
		function Copy.updateItemMeasurement(p2)
			-- upvalues: Frozen (upval), MeasuredResult (copy)
			return if p2.length <= 0 then Frozen else MeasuredResult.updateItemMeasurement(p2)
		end
		
		return Copy
	end, { MINHEIGHT })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.destroy()
		end
	end, { UseMemoResult })
	
	return UseMemoResult
end