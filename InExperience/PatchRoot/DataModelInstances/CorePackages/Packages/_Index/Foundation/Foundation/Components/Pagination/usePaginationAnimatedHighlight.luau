local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local _ = require(foundation.Enums.PaginationSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local wrappersModule = require(foundation.Utility.Wrappers)
local connection = wrappersModule.Connection
local instance = wrappersModule.Instance
local signal = wrappersModule.Signal
local _ = require(script.Parent.paginationSlotsUtils)

return function(p0, p1, p2, p3, p4) --[[ line: 32 | named "usePaginationAnimatedHighlight" ]]
	-- upvalues: useTokensModule (ref), reactOtterModule (ref), reactModule (ref), signal (ref), instance (ref), connection (ref)
	local time100 = useTokensModule().Time.Time_100
	local var5, var6 = reactOtterModule.useAnimatedBinding(0)
	local var7, var8 = reactOtterModule.useAnimatedBinding(0)
	local var9, var10 = reactModule.useBinding(0)
	local var11, var12 = reactModule.useBinding(false)
	local var13 = reactModule.useRef(p0)
	local var14 = reactModule.useRef(false)
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	
	local function _(value) --[[ line: 59 | named "resetTransitionState" ]]
		-- upvalues: var16 (ref), var14 (ref), var15 (ref)
		if var16.current then
			task.cancel(var16.current)
			var16.current = nil
		end
		var14.current = false
		
		if value then
			var15.current = false
		end
	end
	
	local var18 = reactModule.useCallback(function() --[[ line: 70 ]]
		-- upvalues: var16 (ref), var14 (ref), time100 (ref), var15 (ref), var17 (ref)
		if var16.current then
			task.cancel(var16.current)
		end
		var14.current = true
		var16.current = task.delay(time100, function() --[[ line: 76 ]]
			-- upvalues: var16 (copy), var14 (copy), var15 (copy), var17 (copy)
			var16.current = nil
			var14.current = false
			
			if var15.current then
				var15.current = false
				local current = var17.current
				
				if current then
					current()
				end
			end
		end)
	end, { time100 })
	local var19 = reactModule.useCallback(function(p5, p6) --[[ line: 90 ]]
		-- upvalues: p1 (ref), var12 (ref), var14 (ref), var15 (ref), var8 (ref), reactOtterModule (copy), var6 (ref), var18 (ref), time100 (ref), var10 (ref)
		if not p5.current or not p1.current then
			var12(false)
			
			return false
		end
		local var21 = p5.current.AbsolutePosition.X - p1.current.AbsolutePosition.X
		local x = p5.current.AbsoluteSize.X
		local y = p5.current.AbsoluteSize.Y
		
		if x <= 0 or y <= 0 then
			var12(false)
			
			return false
		elseif p6 and var14.current then
			var15.current = true
			
			return false
		elseif p6 then
			var8(reactOtterModule.instant(x))
			var6(reactOtterModule.instant(var21))
		else
			var15.current = false
			var18()
			local t = {
				easingStyle = Enum.EasingStyle.Linear,
				duration = time100
			}
			var6(reactOtterModule.ease(var21, t))
			var8(reactOtterModule.ease(x, t))
		end
		var10(y)
		var12(true)
		
		return true
	end, { time100, p1, var18 })
	local var20 = reactModule.useCallback(function() --[[ line: 138 ]]
		-- upvalues: p0 (ref), p2 (ref), var19 (ref)
		if p0 then
			local var23 = p2[p0]
			
			if var23 then
				var19(var23, true)
			end
		end
	end, { p0, p2, var19 })
	reactModule.useLayoutEffect(function() --[[ line: 148 ]]
		-- upvalues: p0 (ref), p2 (ref), var13 (ref), var16 (ref), var14 (ref), var15 (ref), p1 (ref), var19 (ref), var12 (ref)
		if not p0 then
			var12(false)
			var13.current = nil
			
			return
		end
		local var24 = p2[p0]
		local var25 = p0 == var13.current
		
		if not var25 then
			if var16.current then
				task.cancel(var16.current)
				var16.current = nil
			end
			var14.current = false
			var15.current = false
		end
		if var24 and var24.current and p1.current then
			var19(var24, var25)
		else
			var12(false)
		end
		var13.current = p0
	end, {
		p0,
		p2,
		var19,
		p3,
		p4
	})
	reactModule.useEffect(function() --[[ line: 171 ]]
		-- upvalues: p0 (ref), p2 (ref), p1 (ref), signal (copy), instance (copy), var20 (ref), connection (copy)
		if p0 then
			local var26 = p2[p0]
			
			if var26 and var26.current and p1.current then
				local var27 = signal.Connect(instance.GetPropertyChangedSignal(var26.current, "AbsoluteSize"), var20)
				local var28 = signal.Connect(instance.GetPropertyChangedSignal(var26.current, "AbsolutePosition"), var20)
				local var29 = signal.Connect(instance.GetPropertyChangedSignal(p1.current, "AbsoluteSize"), var20)
				local var30 = signal.Connect(instance.GetPropertyChangedSignal(p1.current, "AbsolutePosition"), var20)
				
				return function() --[[ line: 193 ]]
					-- upvalues: connection (copy), var27 (ref), var28 (ref), var29 (ref), var30 (ref)
					connection.Disconnect(var27)
					connection.Disconnect(var28)
					connection.Disconnect(var29)
					connection.Disconnect(var30)
				end
			end
		end
		return function() --[[ line: 202 ]] end
	end, { p0, p2, var20 })
	reactModule.useEffect(function() --[[ line: 206 ]]
		-- upvalues: var17 (ref), var20 (ref)
		var17.current = var20
	end, { var20 })
	reactModule.useEffect(function() --[[ line: 210 ]]
		-- upvalues: var16 (ref)
		return function() --[[ line: 211 ]]
			-- upvalues: var16 (copy)
			if var16.current then
				task.cancel(var16.current)
				var16.current = nil
			end
		end
	end, {})
	
	return {
		activeItemHeight = var9,
		highlightPosition = var5,
		highlightWidth = var7,
		isVisible = var11,
		updateHighlight = var19
	}
end