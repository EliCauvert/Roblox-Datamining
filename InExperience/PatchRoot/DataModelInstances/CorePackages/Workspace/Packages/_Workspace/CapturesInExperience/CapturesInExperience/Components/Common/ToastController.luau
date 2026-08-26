local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local foundationModule = require(parent.Foundation)
local toast = foundationModule.Toast
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local t = { dampingRatio = 1, frequency = 3 }
local uDim = UDim.new(0, 296)

return function(p1)
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref), buttonVariant (ref), view (ref), toast (ref), uDim (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactOtterModule.useAnimatedBinding(-200, reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref)
		if not var1 then
			p1.onDismissed()
		end
	end, { var1, p1.onDismissed }))
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var4 (ref), reactOtterModule (copy), t (copy)
		var2(false)
		var4(reactOtterModule.spring(-200, t))
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var4 (ref), reactOtterModule (copy), t (copy), var5 (ref)
		if p1.show then
			var2(true)
			var4(reactOtterModule.spring(20, t))
			
			return
		end
		var5()
	end, { p1.show, var4, var5 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref)
		if p1.show and p1.duration > 0 then
			local delayedThread = task.delay(p1.duration, function()
				-- upvalues: var5 (copy)
				var5()
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { p1.show, p1.duration, var5 })
	local onAction = p1.onAction
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col align-x-center anchor-top-center",
		Position = var3:map(function(p2)
			return UDim2.new(0.5, 0, 0, p2)
		end)
	}, {
		Toast = reactModule.createElement(toast, {
			title = p1.title,
			text = p1.text,
			icon = p1.icon,
			actions = reactModule.useMemo(function()
				-- upvalues: p1 (ref), onAction (ref), var5 (ref), buttonVariant (copy)
				return if p1.actionText then {
					{
						text = p1.actionText,
						onActivated = function()
							-- upvalues: onAction (copy), var5 (copy)
							if onAction then
								onAction()
							end
							var5()
						end,
						variant = buttonVariant.Emphasis
					}
				} else nil
			end, { p1.actionText, onAction, var5 }),
			width = uDim
		})
	})
end