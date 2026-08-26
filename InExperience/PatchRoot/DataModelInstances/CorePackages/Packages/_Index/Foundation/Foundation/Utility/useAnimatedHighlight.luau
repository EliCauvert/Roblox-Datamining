local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local flagsModule = require(foundation.Utility.Flags)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local wrappersModule = require(foundation.Utility.Wrappers)
local connection = wrappersModule.Connection
local instance = wrappersModule.Instance
local signal = wrappersModule.Signal

return function(p1, p2, p3, ...)
	-- upvalues: useTokensModule (ref), reactModule (ref), flagsModule (ref), reactOtterModule (ref), signal (ref), instance (ref), connection (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return {
			easingStyle = var1.Ease.StandardOut,
			duration = var1.Time.Time_200
		}
	end, { var1 })
	local var3 = reactModule.useRef(p1)
	local var4 = if flagsModule.FoundationAnimatedHighlightSettling then reactModule.useRef(p1) else nil
	local var5, var6 = reactOtterModule.useAnimatedBinding(0, if flagsModule.FoundationAnimatedHighlightSettling then if flagsModule.FoundationAnimatedHighlightSettling then reactModule.useCallback(function()
		-- upvalues: var4 (ref), var3 (ref)
		var4.current = var3.current
	end, {}) else nil else nil)
	local var7, var8 = reactOtterModule.useAnimatedBinding(0)
	local var9, var10 = reactModule.useBinding(0)
	local var11 = reactModule.useCallback(function(p4, p5)
		-- upvalues: p2 (ref), flagsModule (copy), p1 (ref), var4 (ref), var8 (ref), reactOtterModule (copy), var6 (ref), var2 (ref), var10 (ref)
		if p4.current and p2.current then
			local var12
			local var13 = p4.current.AbsolutePosition.X - p2.current.AbsolutePosition.X
			local x = p4.current.AbsoluteSize.X
			
			if flagsModule.FoundationAnimatedHighlightSettling then
				var12 = p1 == var4.current
				var12 = nil
			else
				var12 = p5
			end
			if var12 then
				var8(reactOtterModule.instant(x))
				var6(reactOtterModule.instant(var13))
			else
				var6(reactOtterModule.ease(var13, var2))
				var8(reactOtterModule.ease(x, var2))
			end
			var10(p4.current.AbsoluteSize.Y)
		end
	end, { var2, p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), var3 (ref), var11 (ref), p2 (ref), signal (copy), instance (copy), connection (copy)
		if p1 then
			local var12 = p3[p1]
			local var13 = p1 == var3.current
			
			local function animateHighlight()
				-- upvalues: var12 (ref), var11 (copy), var13 (ref)
				if var12 then
					var11(var12, var13)
				end
			end
			
			if var12 and var12.current and p2.current then
				local var14 = signal.Connect(instance.GetPropertyChangedSignal(var12.current, "AbsoluteSize"), animateHighlight)
				local var15 = signal.Connect(instance.GetPropertyChangedSignal(var12.current, "AbsolutePosition"), animateHighlight)
				local var16 = signal.Connect(instance.GetPropertyChangedSignal(p2.current, "AbsoluteSize"), animateHighlight)
				
				return function()
					-- upvalues: connection (copy), var14 (ref), var15 (ref), var16 (ref)
					connection.Disconnect(var14)
					connection.Disconnect(var15)
					connection.Disconnect(var16)
				end
			end
		end
		return function() end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), p2 (ref), var11 (ref), var3 (ref)
		if p1 then
			local var12 = p3[p1]
			
			if var12 and var12.current and p2.current then
				var11(var12, p1 == var3.current)
			end
			var3.current = p1
		end
	end, { p1, ... })
	
	return {
		activeItemHeight = var9,
		highlightPosition = var5,
		highlightWidth = var7
	}
end