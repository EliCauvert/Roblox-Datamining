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
	local var10 = reactModule.useCallback(function(p1, p2)
		-- upvalues: p2 (ref), var7 (ref), reactOtterModule (copy), var5 (ref), var2 (ref), var9 (ref)
		if p1.current and p2.current then
			local var1 = p1.current.AbsolutePosition.X - p2.current.AbsolutePosition.X
			local x = p1.current.AbsoluteSize.X
			
			if p2 then
				var7(reactOtterModule.instant(x))
				var5(reactOtterModule.instant(var1))
			else
				var5(reactOtterModule.ease(var1, var2))
				var7(reactOtterModule.ease(x, var2))
			end
			var9(p1.current.AbsoluteSize.Y)
		end
	end, { var2, p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), var3 (ref), var10 (ref), p2 (ref), signal (copy), instance (copy), connection (copy)
		if p1 then
			local var1 = p3[p1]
			local var2 = p1 == var3.current
			
			local function animateHighlight()
				-- upvalues: var1 (ref), var10 (copy), var2 (ref)
				if var1 then
					var10(var1, var2)
				end
			end
			
			if var1 and var1.current and p2.current then
				local var3 = signal.Connect(instance.GetPropertyChangedSignal(var1.current, "AbsoluteSize"), animateHighlight)
				local var4 = signal.Connect(instance.GetPropertyChangedSignal(var1.current, "AbsolutePosition"), animateHighlight)
				local var5 = signal.Connect(instance.GetPropertyChangedSignal(p2.current, "AbsoluteSize"), animateHighlight)
				
				return function()
					-- upvalues: connection (copy), var3 (ref), var4 (ref), var5 (ref)
					connection.Disconnect(var3)
					connection.Disconnect(var4)
					connection.Disconnect(var5)
				end
			end
		end
		return function() end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), p2 (ref), var10 (ref), var3 (ref)
		if p1 then
			local var1 = p3[p1]
			
			if var1 and var1.current and p2.current then
				var10(var1, p1 == var3.current)
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