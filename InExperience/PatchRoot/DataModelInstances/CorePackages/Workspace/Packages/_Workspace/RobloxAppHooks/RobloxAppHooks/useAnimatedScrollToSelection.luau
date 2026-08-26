local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local t = { dampingRatio = 1, frequency = 3 }

local function _(value, p1, p2, p3, p4)
	local var1 = if p2 == Enum.ScrollingDirection.X then value.CanvasPosition.X + (p1.AbsolutePosition.X - value.AbsolutePosition.X) else value.CanvasPosition.Y + (p1.AbsolutePosition.Y - value.AbsolutePosition.Y)
	
	return if var1 < p4 then 0 else math.max(var1 - p3, 0)
end

return function(p1, p2, p3, p4)
	-- upvalues: t (ref), reactOtterModule (ref), reactModule (ref)
	p2 = p2 or 0
	p3 = p3 or 0
	local var1 = p4 or t
	local var2, var3 = reactOtterModule.useAnimatedBinding(0)
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), p1 (ref)
		return var2:map(function(p5)
			-- upvalues: p1 (copy)
			return if p1 == Enum.ScrollingDirection.X then Vector2.new(p5, 0) else Vector2.new(0, p5)
		end)
	end, { p1 }), reactModule.useCallback(function(p5, p6, _, p7)
		-- upvalues: p1 (ref), p2 (ref), p3 (ref), var3 (ref), reactOtterModule (copy), var1 (ref)
		if p6 then return end
		if p7 and p7:IsDescendantOf(p5) then
			local var4 = if p1 == Enum.ScrollingDirection.X then p5.CanvasPosition.X + (p7.AbsolutePosition.X - p5.AbsolutePosition.X) else p5.CanvasPosition.Y + (p7.AbsolutePosition.Y - p5.AbsolutePosition.Y)
			var3(reactOtterModule.spring(if var4 < p3 then 0 else math.max(var4 - p2, 0), var1))
		end
	end, { p2, p1, p3, var1 })
end