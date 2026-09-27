local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local ultimateListModule = require(parent.UltimateList)
local _ = require(script.Parent.Rows.CommentRowTypes)

return function(p1)
	-- upvalues: reactModule (ref), ultimateListModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref)
		local current = p1.scrollingFrameRef.current
		
		if current == nil then
			return
		end
		local function updatePagination()
			-- upvalues: current (ref), p1 (copy), var2 (copy), var1 (copy)
			local y = current.AbsoluteCanvasSize.Y
			local y_1 = current.AbsoluteWindowSize.Y
			
			if y <= 0 or y_1 <= 0 then return end
			local paginationStateKey = `{p1.paginationStateKey}:{y}:{y_1}`
			
			if y <= y_1 and var2.current ~= paginationStateKey and p1.onUnderfilled() then
				var2.current = paginationStateKey
			end
			if y - y_1 - current.CanvasPosition.Y <= p1.endReachedThreshold and var1.current ~= paginationStateKey and p1.onNearEnd() then
				var1.current = paginationStateKey
			end
		end
		
		updatePagination()
		local list = {
			current:GetPropertyChangedSignal("CanvasPosition"):Connect(updatePagination),
			current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updatePagination),
			current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updatePagination)
		}
		
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, {
		p1.scrollingFrameRef,
		p1.paginationStateKey,
		p1.onNearEnd,
		p1.onUnderfilled,
		p1.endReachedThreshold
	})
	
	return reactModule.createElement(ultimateListModule.Components.VirtualizedContent, {
		direction = "y",
		LayoutOrder = p1.LayoutOrder,
		dataSource = p1.dataSource,
		dimensions = p1.dimensions,
		renderer = p1.renderer,
		getKey = p1.getKey,
		scrollingFrameRef = p1.scrollingFrameRef,
		overscan = p1.overscan
	})
end