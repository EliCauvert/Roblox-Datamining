local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local t = { dampingRatio = 1, frequency = 3 }

local function _(value, p0, p1, p2, p3)
	local var3 = if p1 == Enum.ScrollingDirection.X then value.CanvasPosition.X + (p0.AbsolutePosition.X - value.AbsolutePosition.X) else value.CanvasPosition.Y + (p0.AbsolutePosition.Y - value.AbsolutePosition.Y)
	
	return if var3 < p3 then 0 else math.max(var3 - p2, 0)
end

return function(p4, p5, p6, p7)
	-- upvalues: t (ref), reactOtterModule (ref), reactModule (ref)
	p5 = p5 or 0
	p6 = p6 or 0
	local var6 = p7 or t
	local var7, var8 = reactOtterModule.useAnimatedBinding(0)
	
	return reactModule.useMemo(function()
		-- upvalues: var7 (ref), p4 (ref)
		return var7:map(function(p8)
			-- upvalues: p4 (copy)
			return if p4 == Enum.ScrollingDirection.X then Vector2.new(p8, 0) else Vector2.new(0, p8)
		end)
	end, { p4 }), reactModule.useCallback(function(p9, p10, _, p11)
		-- upvalues: p4 (ref), p5 (ref), p6 (ref), var8 (ref), reactOtterModule (copy), var6 (ref)
		if p10 then return end
		if p11 and p11:IsDescendantOf(p9) then
			local var9 = if p4 == Enum.ScrollingDirection.X then p9.CanvasPosition.X + (p11.AbsolutePosition.X - p9.AbsolutePosition.X) else p9.CanvasPosition.Y + (p11.AbsolutePosition.Y - p9.AbsolutePosition.Y)
			var8(reactOtterModule.spring(if var9 < p6 then 0 else math.max(var9 - p5, 0), var6))
		end
	end, { p5, p4, p6, var6 })
end