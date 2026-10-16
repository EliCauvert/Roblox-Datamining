local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FoundationModule = require(Parent.Foundation)
local Toast = FoundationModule.Toast
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local config = { dampingRatio = 1, frequency = 3 }
local _UDim = UDim.new(0, 296)

return function(p1) --[[ Line: 36 | Named "ToastController" ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), config (copy), ButtonVariant (copy), View (copy), Toast (copy), _UDim (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(-200, (ReactModule.useCallback(function() --[[ Line: 39 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		if not UseStateResult then
			p1.onDismissed()
		end
	end, { UseStateResult, p1.onDismissed })))
	local UseResult = ReactModule.useCallback(function() --[[ Line: 47 ]]
		-- upvalues: UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		UseStateResult2(false)
		UseAnimatedBindingResult2(ReactOtterModule.spring(-200, config))
	end, { UseAnimatedBindingResult2 })
	ReactModule.useEffect(function() --[[ Line: 52 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval), UseResult (copy)
		if p1.show then
			UseStateResult2(true)
			UseAnimatedBindingResult2(ReactOtterModule.spring(20, config))
			
			return
		else
			UseResult()
		end
	end, { p1.show, UseAnimatedBindingResult2, UseResult })
	ReactModule.useEffect(function() --[[ Line: 61 ]]
		-- upvalues: p1 (copy), UseResult (copy)
		if p1.show and p1.duration > 0 then
			local DelayedThread = task.delay(p1.duration, function() --[[ Line: 63 ]]
				-- upvalues: UseResult (upval)
				UseResult()
			end)
			
			return function() --[[ Line: 66 ]]
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		else
			return nil
		end
	end, { p1.show, p1.duration, UseResult })
	local OnActionFunction = p1.onAction
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col align-x-center anchor-top-center",
		Position = UseAnimatedBindingResult:map(function(YOffset): UDim2 --[[ Line: 92 ]]
			return UDim2.new(0.5, 0, 0, YOffset)
		end)
	}, {
		Toast = ReactModule.createElement(Toast, {
			title = p1.title,
			text = p1.text,
			icon = p1.icon,
			actions = ReactModule.useMemo(function() --[[ Line: 74 ]]
				-- upvalues: p1 (copy), OnActionFunction (copy), UseResult (copy), ButtonVariant (upval)
				return if p1.actionText then {
					{
						text = p1.actionText,
						onActivated = function() --[[ Line: 81 ]]
							-- upvalues: OnActionFunction (upval), UseResult (upval)
							if OnActionFunction then
								OnActionFunction()
							end
							UseResult()
						end,
						variant = ButtonVariant.Emphasis
					}
				} else nil
			end, { p1.actionText, OnActionFunction, UseResult }),
			width = _UDim
		})
	})
end