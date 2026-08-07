-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

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

return function(p0, p1, p2, ...) --[[ line: 19 | named "useAnimatedHighlight" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), reactOtterModule (ref), signal (ref), instance (ref), connection (ref)
	local var5 = useTokensModule()
	local var6 = reactModule.useMemo(function() --[[ line: 26 ]]
		-- upvalues: var5 (ref)
		return {
			easingStyle = var5.Ease.StandardOut,
			duration = var5.Time.Time_200
		}
	end, { var5 })
	local var7 = reactModule.useRef(p0)
	local var8, var9 = reactOtterModule.useAnimatedBinding(0)
	local var10, var11 = reactOtterModule.useAnimatedBinding(0)
	local var12, var13 = reactModule.useBinding(0)
	local var14 = reactModule.useCallback(function(p3, p4) --[[ line: 39 ]]
		-- upvalues: p1 (ref), var11 (ref), reactOtterModule (copy), var9 (ref), var6 (ref), var13 (ref)
		if p3.current and p1.current then
			local var15 = p3.current.AbsolutePosition.X - p1.current.AbsolutePosition.X
			local x = p3.current.AbsoluteSize.X
			
			if p4 then
				var11(reactOtterModule.instant(x))
				var9(reactOtterModule.instant(var15))
			else
				var9(reactOtterModule.ease(var15, var6))
				var11(reactOtterModule.ease(x, var6))
			end
			var13(p3.current.AbsoluteSize.Y)
		end
	end, { var6, p0 })
	reactModule.useEffect(function() --[[ line: 59 ]]
		-- upvalues: p0 (ref), p2 (ref), var7 (ref), var14 (ref), p1 (ref), signal (copy), instance (copy), connection (copy)
		if p0 then
			local var16 = p2[p0]
			local var17 = p0 == var7.current
			
			local function animateHighlight() --[[ line: 63 ]]
				-- upvalues: var16 (ref), var14 (copy), var17 (ref)
				if var16 then
					var14(var16, var17)
				end
			end
			
			if var16 and var16.current and p1.current then
				local var19 = signal.Connect(instance.GetPropertyChangedSignal(var16.current, "AbsoluteSize"), animateHighlight)
				local var20 = signal.Connect(instance.GetPropertyChangedSignal(var16.current, "AbsolutePosition"), animateHighlight)
				local var21 = signal.Connect(instance.GetPropertyChangedSignal(p1.current, "AbsoluteSize"), animateHighlight)
				
				return function() --[[ line: 83 ]]
					-- upvalues: connection (copy), var19 (ref), var20 (ref), var21 (ref)
					connection.Disconnect(var19)
					connection.Disconnect(var20)
					connection.Disconnect(var21)
				end
			end
		end
		return function() --[[ line: 91 ]] end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 94 ]]
		-- upvalues: p0 (ref), p2 (ref), p1 (ref), var14 (ref), var7 (ref)
		if p0 then
			local var22 = p2[p0]
			
			if var22 and var22.current and p1.current then
				var14(var22, p0 == var7.current)
			end
			var7.current = p0
		end
	end, { p0, ... })
	
	return {
		activeItemHeight = var12,
		highlightPosition = var8,
		highlightWidth = var10
	}
end