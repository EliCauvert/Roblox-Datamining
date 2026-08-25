local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)

local function _(p0, p1)
	return {
		dampingRatio = p0.dampingRatio,
		frequency = p0.frequency,
		startingValue = p1
	}
end

return {
	MENU_ZOOM_CLOSED_SCALE = 1.25,
	PANEL_RECESS_SCALE = 0.95,
	PANEL_RECESS_TRANSPARENCY = 0.6,
	useSlideOpenCloseAnimation = function(p2, p3, p4)
		-- upvalues: reactModule (ref), reactOtterModule (ref)
		local var2, var3 = reactModule.useState(p2)
		local var4 = reactModule.useRef(p2)
		var4.current = p2
		local var5 = reactModule.useRef(true)
		
		if p2 and not var2 then
			var3(true)
		end
		local var6, var7 = reactOtterModule.useAnimatedBinding(if p2 then 0 else p3.hiddenOffset, reactModule.useCallback(function()
			-- upvalues: var4 (ref), var3 (ref)
			if not var4.current then
				var3(false)
			end
		end, {}))
		local var8 = reactModule.useMemo(function()
			-- upvalues: var6 (ref)
			return var6:map(function(p5)
				return UDim2.new(p5, 0, 0, 0)
			end)
		end, { var6 })
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), p2 (ref), var3 (ref), p3 (ref), var7 (ref), reactOtterModule (copy)
			local current = var5.current
			var5.current = false
			
			if p2 then
				var3(true)
				
				if current and not p3.animateInitialOpen then
					return
				end
				local var9 = p3
				var7(reactOtterModule.spring(0, {
					dampingRatio = var9.dampingRatio,
					frequency = var9.frequency,
					startingValue = p3.openStartOffset
				}))
				
				return
			elseif current then
				return
			end
			var7(reactOtterModule.spring(p3.hiddenOffset, {
				startingValue = nil,
				dampingRatio = p3.dampingRatio,
				frequency = p3.frequency
			}))
		end, { p2, p4, p3 })
		
		return { offset = var6, position = var8, shouldMount = var2 }
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