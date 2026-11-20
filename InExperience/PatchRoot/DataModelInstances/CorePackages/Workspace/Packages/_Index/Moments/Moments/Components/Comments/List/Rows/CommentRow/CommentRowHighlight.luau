local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local CommentLongPressTimingModule = require(script.Parent.CommentLongPressTiming)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = { duration = 0.08, easingStyle = Enum.EasingStyle.Quad }
local config1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), CommentLongPressTimingModule (copy), config (copy), config1 (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), CommentLongPressTimingModule (upval), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), config1 (upval)
		if p1.phase == "Charging" then
			local DelayedThread = task.delay(CommentLongPressTimingModule.CHARGE_DELAY_SECONDS, function()
				-- upvalues: UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), CommentLongPressTimingModule (upval)
				UseAnimatedBindingResult2(ReactOtterModule.ease(1, {
					duration = CommentLongPressTimingModule.HOLD_SECONDS - CommentLongPressTimingModule.CHARGE_DELAY_SECONDS,
					easingStyle = Enum.EasingStyle.Sine
				}))
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		else
			UseAnimatedBindingResult2(ReactOtterModule.ease(if p1.phase == "Active" then 1 else 0, if p1.phase == "Active" then config else config1))
			
			return nil
		end
	end, { p1.phase })
	local Shift200 = UseTokensResult.Color.Shift.Shift_200
	
	return ReactModule.createElement(FoundationModule.View, {
		ZIndex = 0,
		tag = {
			["size-full radius-medium"] = true,
			["shadow-raised-100"] = p1.phase == "Active"
		},
		backgroundStyle = UseAnimatedBindingResult:map(function(Alpha: number)
			-- upvalues: Shift200 (copy)
			return {
				Color3 = Shift200.Color3,
				Transparency = math.lerp(1, Shift200.Transparency, Alpha)
			}
		end),
		testId = `moments-comment-highlight-{p1.commentId}`
	})
end)