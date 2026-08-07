local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local foundationModule = require(parent.Foundation)
local toast = foundationModule.Toast
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local t = { dampingRatio = 1, frequency = 3 }
local uDim = UDim.new(0, 296)

return function(p0) --[[ line: 36 | named "ToastController" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref), buttonVariant (ref), view (ref), toast (ref), uDim (ref)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactOtterModule.useAnimatedBinding(-200, reactModule.useCallback(function() --[[ line: 39 ]]
		-- upvalues: var5 (ref), p0 (ref)
		if not var5 then
			p0.onDismissed()
		end
	end, { var5, p0.onDismissed }))
	local var9 = reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: var6 (ref), var8 (ref), reactOtterModule (copy), t (copy)
		var6(false)
		var8(reactOtterModule.spring(-200, t))
	end, { var8 })
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: p0 (ref), var6 (ref), var8 (ref), reactOtterModule (copy), t (copy), var9 (ref)
		if p0.show then
			var6(true)
			var8(reactOtterModule.spring(20, t))
			
			return
		end
		var9()
	end, { p0.show, var8, var9 })
	reactModule.useEffect(function() --[[ line: 61 ]]
		-- upvalues: p0 (ref), var9 (ref)
		if p0.show and p0.duration > 0 then
			local delayedThread = task.delay(p0.duration, function() --[[ line: 63 ]]
				-- upvalues: var9 (copy)
				var9()
			end)
			
			return function() --[[ line: 66 ]]
				-- upvalues: delayedThread (ref)
				task.cancel(delayedThread)
			end
		end
		return nil
	end, { p0.show, p0.duration, var9 })
	local onAction = p0.onAction
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col align-x-center anchor-top-center",
		Position = var7:map(function(p1) --[[ line: 92 ]]
			return UDim2.new(0.5, 0, 0, p1)
		end)
	}, {
		Toast = reactModule.createElement(toast, {
			title = p0.title,
			text = p0.text,
			icon = p0.icon,
			actions = reactModule.useMemo(function() --[[ line: 74 ]]
				-- upvalues: p0 (ref), onAction (ref), var9 (ref), buttonVariant (copy)
				return if p0.actionText then {
					{
						text = p0.actionText,
						onActivated = function() --[[ line: 81 ]]
							-- upvalues: onAction (copy), var9 (copy)
							if onAction then
								onAction()
							end
							var9()
						end,
						variant = buttonVariant.Emphasis
					}
				} else nil
			end, { p0.actionText, onAction, var9 }),
			width = uDim
		})
	})
end