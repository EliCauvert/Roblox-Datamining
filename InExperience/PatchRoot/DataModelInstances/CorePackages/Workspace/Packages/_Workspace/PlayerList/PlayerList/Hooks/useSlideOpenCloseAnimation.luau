local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)

local function _(p1, p2)
	return {
		dampingRatio = p1.dampingRatio,
		frequency = p1.frequency,
		startingValue = p2
	}
end

return {
	MENU_ZOOM_CLOSED_SCALE = 1.25,
	PANEL_RECESS_SCALE = 0.95,
	PANEL_RECESS_TRANSPARENCY = 0.6,
	useSlideOpenCloseAnimation = function(p1, p2, p3)
		-- upvalues: reactModule (ref), reactOtterModule (ref)
		local var1, var2 = reactModule.useState(p1)
		local var3 = reactModule.useRef(p1)
		var3.current = p1
		local var4 = reactModule.useRef(true)
		
		if p1 and not var1 then
			var2(true)
		end
		local var5, var6 = reactOtterModule.useAnimatedBinding(if p1 then 0 else p2.hiddenOffset, reactModule.useCallback(function()
			-- upvalues: var3 (ref), var2 (ref)
			if not var3.current then
				var2(false)
			end
		end, {}))
		local var7 = reactModule.useMemo(function()
			-- upvalues: var5 (ref)
			return var5:map(function(p4)
				return UDim2.new(p4, 0, 0, 0)
			end)
		end, { var5 })
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), p1 (ref), var2 (ref), p2 (ref), var6 (ref), reactOtterModule (copy)
			local current = var4.current
			var4.current = false
			
			if p1 then
				var2(true)
				
				if current and not p2.animateInitialOpen then
					return
				end
				local var8 = p2
				var6(reactOtterModule.spring(0, {
					dampingRatio = var8.dampingRatio,
					frequency = var8.frequency,
					startingValue = p2.openStartOffset
				}))
				
				return
			elseif current then
				return
			end
			var6(reactOtterModule.spring(p2.hiddenOffset, {
				startingValue = nil,
				dampingRatio = p2.dampingRatio,
				frequency = p2.frequency
			}))
		end, { p1, p3, p2 })
		
		return { offset = var5, position = var7, shouldMount = var1 }
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