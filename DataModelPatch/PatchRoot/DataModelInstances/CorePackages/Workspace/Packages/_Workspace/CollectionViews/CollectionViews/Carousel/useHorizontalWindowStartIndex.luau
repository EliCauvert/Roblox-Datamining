local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local FFlagCollectionViewMathChanges = require(Parent.SharedFlags).FFlagCollectionViewMathChanges
local _ = require(CollectionViews.Carousel.calculateCarouselSpacingMetrics)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: ReactModule (copy), FFlagCollectionViewMathChanges (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p4 (copy), p1 (copy), FFlagCollectionViewMathChanges (upval), p5 (copy), p6 (copy), p2 (copy), p3 (copy), UseStateResult2 (copy)
		if not p4 then
			UseStateResult2(1)
		elseif p1.current ~= nil and (not FFlagCollectionViewMathChanges or p5 > 0) then
			local X = p1.current.CanvasPosition.X
			local Stride = if FFlagCollectionViewMathChanges then p6:getValue().stride else p2:getValue().X + p3
			
			if Stride > 0 then
				UseStateResult2((math.max(1, (math.floor(X / Stride)))))
				
				return
			else
				UseStateResult2(1)
				
				return
			end
		end
	end, {
		p4,
		p1,
		if FFlagCollectionViewMathChanges then p6 else p2,
		if FFlagCollectionViewMathChanges then p5 else p3
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: p4 (copy), p1 (copy), UseResult (copy)
		if not p4 then
			return nil
		end
		local List = {}
		
		if p1.current ~= nil then
			UseResult()
			table.insert(List, p1.current:GetPropertyChangedSignal("CanvasPosition"):Connect(UseResult))
			table.insert(List, p1.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(UseResult))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, UseResult, p4 })
	
	return UseStateResult
end