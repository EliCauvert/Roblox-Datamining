local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref)
	local containsPoint = p1.containsPoint
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function(p6, p7)
		-- upvalues: var1 (ref), p2 (ref), containsPoint (ref), p5 (ref), p4 (ref), p3 (ref)
		var1.current = nil
		
		if p2 == nil or not containsPoint(p6) then return end
		local var3 = p7 < 2
		
		if not p5 or var3 and not p4 then
			p2(p3)
			
			return
		elseif var3 then
			var1.current = p3
		end
	end, {
		p2,
		containsPoint,
		p3,
		p4,
		p5
	})
	local var3 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p2 (ref)
		local current = var1.current
		var1.current = nil
		
		if current ~= nil and p2 ~= nil then
			p2(current)
		end
	end, { p2 })
	local var4 = p2 ~= nil
	local isTruncatable = var4 and p1.isTruncatable
	
	return {
		isActive = var4,
		canToggle = isTruncatable,
		onTap = if isTruncatable then var2 else nil,
		onSingleTapConfirmed = if isTruncatable and p5 then var3 else nil
	}
end