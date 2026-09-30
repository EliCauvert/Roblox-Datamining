local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local controlState = foundationModule.Enums.ControlState
local useTokens = foundationModule.Hooks.useTokens
local t = { duration = 0.08, easingStyle = Enum.EasingStyle.Quad }
local t_1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

local function _(p1)
	-- upvalues: controlState (ref)
	return if p1 ~= controlState.Hover then p1 == controlState.Pressed else true
end

return function(p1, p2)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), controlState (ref), t (ref), t_1 (ref), getColorStyleWithTransparencyModule (ref)
	local var1 = useTokens()
	local var2, var3 = reactOtterModule.useAnimatedBinding(0)
	local var4 = reactModule.useRef(controlState.Default)
	local var5 = reactModule.useRef(p2)
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), p2 (ref), var4 (ref), controlState (copy), var3 (ref), reactOtterModule (copy)
		var5.current = p2
		local var6 = p2
		
		if var6 then
			local current = var4.current
			var6 = if current ~= controlState.Hover then current == controlState.Pressed else true
		end
		var3(reactOtterModule.instant(if var6 then 1 else 0))
	end, { p1, p2 })
	local emphasis = var1.Color.Content.Emphasis
	
	return {
		onStateChanged = reactModule.useCallback(function(p3)
			-- upvalues: var4 (ref), var5 (ref), controlState (copy), var3 (ref), reactOtterModule (copy), t (copy), t_1 (copy)
			var4.current = p3
			
			if var5.current then
				local var6 = if p3 ~= controlState.Hover then p3 == controlState.Pressed else true
				var3(reactOtterModule.ease(if var6 then 1 else 0, if var6 then t else t_1))
			end
		end, { var3 }),
		textStyle = reactModule.useMemo(function()
			-- upvalues: var2 (ref), getColorStyleWithTransparencyModule (copy), emphasis (ref)
			return var2:map(function(p3)
				-- upvalues: getColorStyleWithTransparencyModule (copy), emphasis (copy)
				return getColorStyleWithTransparencyModule(emphasis, p3 * 0.4)
			end)
		end, { var2, emphasis })
	}
end