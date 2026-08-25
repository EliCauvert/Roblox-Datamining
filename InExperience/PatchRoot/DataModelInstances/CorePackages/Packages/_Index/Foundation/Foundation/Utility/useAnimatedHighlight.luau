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

return function(p0, p1, p2, ...)
	-- upvalues: useTokensModule (ref), reactModule (ref), flagsModule (ref), reactOtterModule (ref), signal (ref), instance (ref), connection (ref)
	local var6 = useTokensModule()
	local var7 = reactModule.useMemo(function()
		-- upvalues: var6 (ref)
		return {
			easingStyle = var6.Ease.StandardOut,
			duration = var6.Time.Time_200
		}
	end, { var6 })
	local var8 = reactModule.useRef(p0)
	local var9 = if flagsModule.FoundationAnimatedHighlightSettling then reactModule.useRef(p0) else nil
	local var10, var11 = reactOtterModule.useAnimatedBinding(0, if flagsModule.FoundationAnimatedHighlightSettling then if flagsModule.FoundationAnimatedHighlightSettling then reactModule.useCallback(function()
		-- upvalues: var9 (ref), var8 (ref)
		var9.current = var8.current
	end, {}) else nil else nil)
	local var12, var13 = reactOtterModule.useAnimatedBinding(0)
	local var14, var15 = reactModule.useBinding(0)
	local var16 = reactModule.useCallback(function(p3, p4)
		-- upvalues: p1 (ref), flagsModule (copy), p0 (ref), var9 (ref), var13 (ref), reactOtterModule (copy), var11 (ref), var7 (ref), var15 (ref)
		if p3.current and p1.current then
			local var18
			local var17 = p3.current.AbsolutePosition.X - p1.current.AbsolutePosition.X
			local x = p3.current.AbsoluteSize.X
			
			if flagsModule.FoundationAnimatedHighlightSettling then
				var18 = p0 == var9.current
				var18 = nil
			else
				var18 = p4
			end
			if var18 then
				var13(reactOtterModule.instant(x))
				var11(reactOtterModule.instant(var17))
			else
				var11(reactOtterModule.ease(var17, var7))
				var13(reactOtterModule.ease(x, var7))
			end
			var15(p3.current.AbsoluteSize.Y)
		end
	end, { var7, p0 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), p2 (ref), var8 (ref), var16 (ref), p1 (ref), signal (copy), instance (copy), connection (copy)
		if p0 then
			local var19 = p2[p0]
			local var20 = p0 == var8.current
			
			local function animateHighlight()
				-- upvalues: var19 (ref), var16 (copy), var20 (ref)
				if var19 then
					var16(var19, var20)
				end
			end
			
			if var19 and var19.current and p1.current then
				local var22 = signal.Connect(instance.GetPropertyChangedSignal(var19.current, "AbsoluteSize"), animateHighlight)
				local var23 = signal.Connect(instance.GetPropertyChangedSignal(var19.current, "AbsolutePosition"), animateHighlight)
				local var24 = signal.Connect(instance.GetPropertyChangedSignal(p1.current, "AbsoluteSize"), animateHighlight)
				
				return function()
					-- upvalues: connection (copy), var22 (ref), var23 (ref), var24 (ref)
					connection.Disconnect(var22)
					connection.Disconnect(var23)
					connection.Disconnect(var24)
				end
			end
		end
		return function() end
	end, { p0 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), p2 (ref), p1 (ref), var16 (ref), var8 (ref)
		if p0 then
			local var25 = p2[p0]
			
			if var25 and var25.current and p1.current then
				var16(var25, p0 == var8.current)
			end
			var8.current = p0
		end
	end, { p0, ... })
	
	return {
		activeItemHeight = var14,
		highlightPosition = var10,
		highlightWidth = var12
	}
end