local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local config = { dampingRatio = 1, frequency = 3 }

local function _(Frame: Frame, Frame1: Frame, ScrollingDirection, p1, p2): number --[[ Line: 10 | Named "calculateTargetScrollOffset" ]]
	local NewX = if ScrollingDirection == Enum.ScrollingDirection.X then Frame.CanvasPosition.X + (Frame1.AbsolutePosition.X - Frame.AbsolutePosition.X) else Frame.CanvasPosition.Y + (Frame1.AbsolutePosition.Y - Frame.AbsolutePosition.Y)
	
	return if NewX < p2 then 0 else math.max(NewX - p1, 0)
end

return function(ScrollingDirection, p1, p2, p3) --[[ Line: 28 | Named "useAnimatedScrollToSelection" ]]
	-- upvalues: config (copy), ReactOtterModule (copy), ReactModule (copy)
	local P6 = p1 or 0
	local P7 = p2 or 0
	local Config = if p3 then p3 else config
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	
	return ReactModule.useMemo(function() --[[ Line: 59 ]]
		-- upvalues: UseAnimatedBindingResult (copy), ScrollingDirection (copy)
		return UseAnimatedBindingResult:map(function(X): Vector2 --[[ Line: 60 ]]
			-- upvalues: ScrollingDirection (upval)
			return if ScrollingDirection == Enum.ScrollingDirection.X then Vector2.new(X, 0) else Vector2.new(0, X)
		end)
	end, { ScrollingDirection }), (ReactModule.useCallback(function(Frame: Frame, p4, _, Frame1: Frame) --[[ Line: 41 ]]
		-- upvalues: ScrollingDirection (copy), P6 (copy), P7 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), Config (copy)
		if p4 then return end
		if Frame1 and Frame1:IsDescendantOf(Frame) then
			local NewX = if ScrollingDirection == Enum.ScrollingDirection.X then Frame.CanvasPosition.X + (Frame1.AbsolutePosition.X - Frame.AbsolutePosition.X) else Frame.CanvasPosition.Y + (Frame1.AbsolutePosition.Y - Frame.AbsolutePosition.Y)
			UseAnimatedBindingResult2(ReactOtterModule.spring(if NewX < P7 then 0 else math.max(NewX - P6, 0), Config))
		end
	end, { P6, ScrollingDirection, P7, Config }))
end