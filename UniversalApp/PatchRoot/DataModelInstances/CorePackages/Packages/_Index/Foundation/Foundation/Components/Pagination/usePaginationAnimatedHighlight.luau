local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local _ = require(Foundation.Enums.PaginationSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Connection = WrappersModule.Connection
local WrappersModuleInstance = WrappersModule.Instance
local Signal = WrappersModule.Signal
local _ = require(script.Parent.paginationSlotsUtils)

return function(Current, p1, p2, p3, p4)
	-- upvalues: UseTokensModule (copy), ReactOtterModule (copy), ReactModule (copy), Signal (copy), WrappersModuleInstance (copy), Connection (copy)
	local Time100 = UseTokensModule().Time.Time_100
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseRefResult = ReactModule.useRef(Current)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	
	local function _(p5)
		-- upvalues: UseRefResult3 (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		if UseRefResult3.current then
			task.cancel(UseRefResult3.current)
			UseRefResult3.current = nil
		end
		UseRefResult1.current = false
		
		if p5 then
			UseRefResult2.current = false
		end
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult1 (copy), Time100 (copy), UseRefResult2 (copy), UseRefResult4 (copy)
		if UseRefResult3.current then
			task.cancel(UseRefResult3.current)
		end
		UseRefResult1.current = true
		UseRefResult3.current = task.delay(Time100, function()
			-- upvalues: UseRefResult3 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseRefResult4 (upval)
			UseRefResult3.current = nil
			UseRefResult1.current = false
			
			if UseRefResult2.current then
				UseRefResult2.current = false
				local CurrentFunction: () -> () = UseRefResult4.current
				
				if CurrentFunction then
					CurrentFunction()
				end
			end
		end)
	end, { Time100 })
	local UseResult1 = ReactModule.useCallback(function(p5, p6): boolean
		-- upvalues: p1 (copy), UseBindingResult2_1 (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2 (copy), UseResult (copy), Time100 (copy), UseBindingResult2 (copy)
		if not p5.current or not p1.current then
			UseBindingResult2_1(false)
			
			return false
		end
		local XDelta = p5.current.AbsolutePosition.X - p1.current.AbsolutePosition.X
		local X: number = p5.current.AbsoluteSize.X
		local Y: number = p5.current.AbsoluteSize.Y
		
		if X <= 0 or Y <= 0 then
			UseBindingResult2_1(false)
			
			return false
		end
		if p6 and UseRefResult1.current then
			UseRefResult2.current = true
			
			return false
		end
		if p6 then
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(X))
			UseAnimatedBindingResult2(ReactOtterModule.instant(XDelta))
		else
			UseRefResult2.current = false
			UseResult()
			local config = {
				easingStyle = Enum.EasingStyle.Linear,
				duration = Time100
			}
			UseAnimatedBindingResult2(ReactOtterModule.ease(XDelta, config))
			UseAnimatedBindingResult2_1(ReactOtterModule.ease(X, config))
		end
		UseBindingResult2(Y)
		UseBindingResult2_1(true)
		
		return true
	end, { Time100, p1, UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Current (copy), p2 (copy), UseResult1 (copy)
		if Current then
			local v1 = p2[Current]
			
			if v1 then
				UseResult1(v1, true)
			end
		end
	end, { Current, p2, UseResult1 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: Current (copy), p2 (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseRefResult2 (copy), p1 (copy), UseResult1 (copy), UseBindingResult2_1 (copy)
		if not Current then
			UseBindingResult2_1(false)
			UseRefResult.current = nil
			
			return
		end
		local v1 = p2[Current]
		local IsCurrentMatch = Current == UseRefResult.current
		
		if not IsCurrentMatch then
			if UseRefResult3.current then
				task.cancel(UseRefResult3.current)
				UseRefResult3.current = nil
			end
			UseRefResult1.current = false
			UseRefResult2.current = false
		end
		if v1 and v1.current and p1.current then
			UseResult1(v1, IsCurrentMatch)
		else
			UseBindingResult2_1(false)
		end
		UseRefResult.current = Current
	end, {
		Current,
		p2,
		UseResult1,
		p3,
		p4
	})
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), p2 (copy), p1 (copy), Signal (upval), WrappersModuleInstance (upval), UseResult2 (copy), Connection (upval)
		if Current then
			local v1 = p2[Current]
			
			if v1 and v1.current and p1.current then
				local ConnectResult = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(v1.current, "AbsoluteSize"), UseResult2)
				local ConnectResult1 = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(v1.current, "AbsolutePosition"), UseResult2)
				local ConnectResult2 = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(p1.current, "AbsoluteSize"), UseResult2)
				local ConnectResult3 = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(p1.current, "AbsolutePosition"), UseResult2)
				
				return function()
					-- upvalues: Connection (upval), ConnectResult (copy), ConnectResult1 (copy), ConnectResult2 (copy), ConnectResult3 (copy)
					Connection.Disconnect(ConnectResult)
					Connection.Disconnect(ConnectResult1)
					Connection.Disconnect(ConnectResult2)
					Connection.Disconnect(ConnectResult3)
				end
			end
		end
		return function() end
	end, { Current, p2, UseResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), UseResult2 (copy)
		UseRefResult4.current = UseResult2
	end, { UseResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy)
		return function()
			-- upvalues: UseRefResult3 (upval)
			if UseRefResult3.current then
				task.cancel(UseRefResult3.current)
				UseRefResult3.current = nil
			end
		end
	end, {})
	
	return {
		activeItemHeight = UseBindingResult,
		highlightPosition = UseAnimatedBindingResult,
		highlightWidth = UseAnimatedBindingResult1,
		isVisible = UseBindingResult1,
		updateHighlight = UseResult1
	}
end