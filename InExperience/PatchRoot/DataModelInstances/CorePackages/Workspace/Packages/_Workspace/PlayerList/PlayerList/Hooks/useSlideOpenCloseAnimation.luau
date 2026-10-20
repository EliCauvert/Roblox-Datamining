local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)

local function _(p1, StartingValue)
	return {
		dampingRatio = p1.dampingRatio,
		frequency = p1.frequency,
		startingValue = StartingValue
	}
end

return {
	MENU_ZOOM_CLOSED_SCALE = 1.25,
	PANEL_RECESS_SCALE = 0.95,
	PANEL_RECESS_TRANSPARENCY = 0.6,
	useSlideOpenCloseAnimation = function(Current, p1, p2)
		-- upvalues: ReactModule (copy), ReactOtterModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(Current)
		local UseRefResult = ReactModule.useRef(Current)
		UseRefResult.current = Current
		local UseRefResult1 = ReactModule.useRef(true)
		
		if Current and not UseStateResult then
			UseStateResult2(true)
		end
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if Current then 0 else p1.hiddenOffset, (ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
			if not UseRefResult.current then
				UseStateResult2(false)
			end
		end, {})))
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseAnimatedBindingResult (copy)
			return UseAnimatedBindingResult:map(function(XScale): UDim2
				return UDim2.new(XScale, 0, 0, 0)
			end)
		end, { UseAnimatedBindingResult })
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (copy), Current (copy), UseStateResult2 (copy), p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
			local Current1 = UseRefResult1.current
			UseRefResult1.current = false
			
			if Current then
				UseStateResult2(true)
				
				if not Current1 or p1.animateInitialOpen then
					UseAnimatedBindingResult2(ReactOtterModule.spring(0, {
						dampingRatio = p1.dampingRatio,
						frequency = p1.frequency,
						startingValue = p1.openStartOffset
					}))
					
					return
				end
				return
			elseif not Current1 then
				UseAnimatedBindingResult2(ReactOtterModule.spring(p1.hiddenOffset, {
					startingValue = nil,
					dampingRatio = p1.dampingRatio,
					frequency = p1.frequency
				}))
				
				return
			else
			end
		end, { Current, p2, p1 })
		
		return {
			offset = UseAnimatedBindingResult,
			position = UseMemoResult,
			shouldMount = UseStateResult
		}
	end,
	PANEL_SLIDE_CONFIG = {
		hiddenOffset = 1.1,
		openStartOffset = 0.2,
		dampingRatio = 1,
		frequency = 7,
		animateInitialOpen = false
	},
	PANEL_ZOOM_CONFIG = {
		hiddenOffset = 1,
		openStartOffset = 1,
		dampingRatio = 1,
		frequency = 4,
		animateInitialOpen = false
	},
	MENU_SLIDE_CONFIG = {
		hiddenOffset = 1,
		openStartOffset = 1,
		dampingRatio = 1,
		frequency = 4,
		animateInitialOpen = true
	},
	MOBILE_ZOOM_SPRING = { dampingRatio = 1, frequency = 4 }
}