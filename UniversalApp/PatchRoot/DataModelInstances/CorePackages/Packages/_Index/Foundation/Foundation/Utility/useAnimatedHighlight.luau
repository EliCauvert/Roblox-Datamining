local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local wrappersModule = require(foundation.Utility.Wrappers)
local connection = wrappersModule.Connection
local instance = wrappersModule.Instance
local signal = wrappersModule.Signal

return function(p1, p2, p3, ...)
	-- upvalues: useTokensModule (ref), reactModule (ref), reactOtterModule (ref), signal (ref), instance (ref), connection (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return {
			easingStyle = var1.Ease.StandardOut,
			duration = var1.Time.Time_200
		}
	end, { var1 })
	local var3 = reactModule.useRef(p1)
	local var4, var5 = reactOtterModule.useAnimatedBinding(0)
	local var6, var7 = reactOtterModule.useAnimatedBinding(0)
	local var8, var9 = reactModule.useBinding(0)
	local var10 = reactModule.useCallback(function(p4, p5)
		-- upvalues: p5 (ref), var7 (ref), reactOtterModule (copy), var5 (ref), var2 (ref), var9 (ref)
		if p4.current and p5.current then
			local var11 = p4.current.AbsolutePosition.X - p5.current.AbsolutePosition.X
			local x = p4.current.AbsoluteSize.X
			
			if p5 then
				var7(reactOtterModule.instant(x))
				var5(reactOtterModule.instant(var11))
			else
				var5(reactOtterModule.ease(var11, var2))
				var7(reactOtterModule.ease(x, var2))
			end
			var9(p4.current.AbsoluteSize.Y)
		end
	end, { var2, p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), var3 (ref), var10 (ref), p2 (ref), signal (copy), instance (copy), connection (copy)
		if p1 then
			local var11 = p3[p1]
			local var12 = p1 == var3.current
			
			local function animateHighlight()
				-- upvalues: var11 (ref), var10 (copy), var12 (ref)
				if var11 then
					var10(var11, var12)
				end
			end
			
			if var11 and var11.current and p2.current then
				local var13 = signal.Connect(instance.GetPropertyChangedSignal(var11.current, "AbsoluteSize"), animateHighlight)
				local var14 = signal.Connect(instance.GetPropertyChangedSignal(var11.current, "AbsolutePosition"), animateHighlight)
				local var15 = signal.Connect(instance.GetPropertyChangedSignal(p2.current, "AbsoluteSize"), animateHighlight)
				
				return function()
					-- upvalues: connection (copy), var13 (ref), var14 (ref), var15 (ref)
					connection.Disconnect(var13)
					connection.Disconnect(var14)
					connection.Disconnect(var15)
				end
			end
		end
		return function() end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), p2 (ref), var10 (ref), var3 (ref)
		if p1 then
			local var11 = p3[p1]
			
			if var11 and var11.current and p2.current then
				var10(var11, p1 == var3.current)
			end
			var3.current = p1
		end
	end, { p1, ... })
	
	return {
		activeItemHeight = var8,
		highlightPosition = var4,
		highlightWidth = var6
	}
end