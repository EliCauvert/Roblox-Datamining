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

return function(p1, p2, p3, p4, p5)
	-- upvalues: useTokensModule (ref), reactOtterModule (ref), reactModule (ref), signal (ref), instance (ref), connection (ref)
	local time100 = useTokensModule().Time.Time_100
	local var1, var2 = reactOtterModule.useAnimatedBinding(0)
	local var3, var4 = reactOtterModule.useAnimatedBinding(0)
	local var5, var6 = reactModule.useBinding(0)
	local var7, var8 = reactModule.useBinding(false)
	local var9 = reactModule.useRef(p1)
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	
	local function _(value)
		-- upvalues: var12 (ref), var10 (ref), var11 (ref)
		if var12.current then
			task.cancel(var12.current)
			var12.current = nil
		end
		var10.current = false
		
		if value then
			var11.current = false
		end
	end
	
	local var14 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var10 (ref), time100 (ref), var11 (ref), var13 (ref)
		if var12.current then
			task.cancel(var12.current)
		end
		var10.current = true
		var12.current = task.delay(time100, function()
			-- upvalues: var12 (copy), var10 (copy), var11 (copy), var13 (copy)
			var12.current = nil
			var10.current = false
			
			if var11.current then
				var11.current = false
				local current = var13.current
				
				if current then
					current()
				end
			end
		end)
	end, { time100 })
	local var15 = reactModule.useCallback(function(p6, p7)
		-- upvalues: p2 (ref), var8 (ref), var10 (ref), var11 (ref), var4 (ref), reactOtterModule (copy), var2 (ref), var14 (ref), time100 (ref), var6 (ref)
		if not p6.current or not p2.current then
			var8(false)
			
			return false
		end
		local var16 = p6.current.AbsolutePosition.X - p2.current.AbsolutePosition.X
		local x = p6.current.AbsoluteSize.X
		local y = p6.current.AbsoluteSize.Y
		
		if x <= 0 or y <= 0 then
			var8(false)
			
			return false
		elseif p7 and var10.current then
			var11.current = true
			
			return false
		elseif p7 then
			var4(reactOtterModule.instant(x))
			var2(reactOtterModule.instant(var16))
		else
			var11.current = false
			var14()
			local t = {
				easingStyle = Enum.EasingStyle.Linear,
				duration = time100
			}
			var2(reactOtterModule.ease(var16, t))
			var4(reactOtterModule.ease(x, t))
		end
		var6(y)
		var8(true)
		
		return true
	end, { time100, p2, var14 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), p3 (ref), var15 (ref)
		if p1 then
			local var17 = p3[p1]
			
			if var17 then
				var15(var17, true)
			end
		end
	end, { p1, p3, var15 })
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), p3 (ref), var9 (ref), var12 (ref), var10 (ref), var11 (ref), p2 (ref), var15 (ref), var8 (ref)
		if not p1 then
			var8(false)
			var9.current = nil
			
			return
		end
		local var17 = p3[p1]
		local var18 = p1 == var9.current
		
		if not var18 then
			if var12.current then
				task.cancel(var12.current)
				var12.current = nil
			end
			var10.current = false
			var11.current = false
		end
		if var17 and var17.current and p2.current then
			var15(var17, var18)
		else
			var8(false)
		end
		var9.current = p1
	end, {
		p1,
		p3,
		var15,
		p4,
		p5
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), p2 (ref), signal (copy), instance (copy), var16 (ref), connection (copy)
		if p1 then
			local var17 = p3[p1]
			
			if var17 and var17.current and p2.current then
				local var18 = signal.Connect(instance.GetPropertyChangedSignal(var17.current, "AbsoluteSize"), var16)
				local var19 = signal.Connect(instance.GetPropertyChangedSignal(var17.current, "AbsolutePosition"), var16)
				local var20 = signal.Connect(instance.GetPropertyChangedSignal(p2.current, "AbsoluteSize"), var16)
				local var21 = signal.Connect(instance.GetPropertyChangedSignal(p2.current, "AbsolutePosition"), var16)
				
				return function()
					-- upvalues: connection (copy), var18 (ref), var19 (ref), var20 (ref), var21 (ref)
					connection.Disconnect(var18)
					connection.Disconnect(var19)
					connection.Disconnect(var20)
					connection.Disconnect(var21)
				end
			end
		end
		return function() end
	end, { p1, p3, var16 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var16 (ref)
		var13.current = var16
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		return function()
			-- upvalues: var12 (copy)
			if var12.current then
				task.cancel(var12.current)
				var12.current = nil
			end
		end
	end, {})
	
	return {
		activeItemHeight = var5,
		highlightPosition = var1,
		highlightWidth = var3,
		isVisible = var7,
		updateHighlight = var15
	}
end