local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local commentLongPressTimingModule = require(script.Parent.CommentLongPressTiming)
local useTokens = foundationModule.Hooks.useTokens
local t = { duration = 0.08, easingStyle = Enum.EasingStyle.Quad }
local t_1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), commentLongPressTimingModule (ref), t (ref), t_1 (ref), foundationModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), commentLongPressTimingModule (copy), var3 (ref), reactOtterModule (copy), t (copy), t_1 (copy)
		if p1.phase == "Charging" then
			local delayedThread = task.delay(commentLongPressTimingModule.CHARGE_DELAY_SECONDS, function()
				-- upvalues: var3 (copy), reactOtterModule (copy), commentLongPressTimingModule (copy)
				var3(reactOtterModule.ease(1, {
					duration = commentLongPressTimingModule.HOLD_SECONDS - commentLongPressTimingModule.CHARGE_DELAY_SECONDS,
					easingStyle = Enum.EasingStyle.Sine
				}))
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		var3(reactOtterModule.ease(if p1.phase == "Active" then 1 else 0, if p1.phase == "Active" then t else t_1))
		
		return nil
	end, { p1.phase })
	local shift200 = var1.Color.Shift.Shift_200
	
	return reactModule.createElement(foundationModule.View, {
		ZIndex = 0,
		tag = {
			["size-full radius-medium"] = true,
			["shadow-raised-100"] = p1.phase == "Active"
		},
		backgroundStyle = var2:map(function(p2)
			-- upvalues: shift200 (ref)
			return {
				Color3 = shift200.Color3,
				Transparency = math.lerp(1, shift200.Transparency, p2)
			}
		end),
		testId = `moments-comment-highlight-{p1.commentId}`
	})
end)