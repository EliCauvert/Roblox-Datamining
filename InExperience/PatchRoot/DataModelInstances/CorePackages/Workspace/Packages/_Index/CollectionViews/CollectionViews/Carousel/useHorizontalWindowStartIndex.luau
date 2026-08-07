local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges
local _ = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 14 | named "useHorizontalWindowStartIndex" ]]
	-- upvalues: reactModule (ref), fFlagCollectionViewMathChanges (ref)
	local var2, var3 = reactModule.useState(1)
	local var4 = reactModule.useCallback(function() --[[ line: 26 ]]
		-- upvalues: p3 (ref), p0 (ref), fFlagCollectionViewMathChanges (copy), p4 (ref), p5 (ref), p1 (ref), p2 (ref), var3 (ref)
		if p3 then
			if p0.current == nil or fFlagCollectionViewMathChanges and p4 <= 0 then return end
			local x = p0.current.CanvasPosition.X
			local var5 = if fFlagCollectionViewMathChanges then p5:getValue().stride else p1:getValue().X + p2
			
			if var5 > 0 then
				var3(math.max(1, math.floor(x / var5)))
				
				return
			end
			var3(1)
			
			return
		else
			var3(1)
		end
	end, {
		p3,
		p0,
		if fFlagCollectionViewMathChanges then p5 else p1,
		if fFlagCollectionViewMathChanges then p4 else p2
	})
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: var4 (ref)
		var4()
	end, { var4 })
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: p3 (ref), p0 (ref), var4 (ref)
		if not p3 then
			return nil
		end
		local t = {}
		
		if p0.current ~= nil then
			var4()
			table.insert(t, p0.current:GetPropertyChangedSignal("CanvasPosition"):Connect(var4))
			table.insert(t, p0.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(var4))
		end
		return function() --[[ line: 80 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p0, var4, p3 })
	
	return var2
end