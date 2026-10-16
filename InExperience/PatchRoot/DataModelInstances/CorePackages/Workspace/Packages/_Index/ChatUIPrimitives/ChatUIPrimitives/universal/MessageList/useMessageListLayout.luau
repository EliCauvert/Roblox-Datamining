local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local MessageInlineItemMetricsModule = require(script.Parent.Inline.MessageInlineItemMetrics)

return function() --[[ Line: 7 | Named "useMessageListLayout" ]]
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy), MessageInlineItemMetricsModule (copy)
	local UseStateResult = ReactModule.useState(function() --[[ Line: 8 ]]
		-- upvalues: ViewRecyclerModule (upval), MessageInlineItemMetricsModule (upval)
		return ViewRecyclerModule.Layout.measured({
			estimatedItemLength = MessageInlineItemMetricsModule.MIN_HEIGHT
		})
	end)
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: UseStateResult (copy)
		return function() --[[ Line: 14 ]]
			-- upvalues: UseStateResult (upval)
			UseStateResult.destroy()
		end
	end, { UseStateResult })
	
	return UseStateResult
end