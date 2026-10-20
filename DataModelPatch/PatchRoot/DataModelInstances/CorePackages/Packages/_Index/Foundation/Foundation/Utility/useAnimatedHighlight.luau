local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Connection = WrappersModule.Connection
local WrappersModuleInstance = WrappersModule.Instance
local Signal = WrappersModule.Signal

return function(Current, p1, p2, ...)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ReactOtterModule (copy), Signal (copy), WrappersModuleInstance (copy), Connection (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseTokensModuleResult (copy)
		return {
			easingStyle = UseTokensModuleResult.Ease.StandardOut,
			duration = UseTokensModuleResult.Time.Time_200
		}
	end, { UseTokensModuleResult })
	local UseRefResult = ReactModule.useRef(Current)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(p3, p4)
		-- upvalues: p1 (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2 (copy), UseMemoResult (copy), UseBindingResult2 (copy)
		if p3.current and p1.current then
			local XDelta = p3.current.AbsolutePosition.X - p1.current.AbsolutePosition.X
			local X = p3.current.AbsoluteSize.X
			
			if p4 then
				UseAnimatedBindingResult2_1((ReactOtterModule.instant(X)))
				UseAnimatedBindingResult2((ReactOtterModule.instant(XDelta)))
			else
				UseAnimatedBindingResult2(ReactOtterModule.ease(XDelta, UseMemoResult))
				UseAnimatedBindingResult2_1(ReactOtterModule.ease(X, UseMemoResult))
			end
			UseBindingResult2(p3.current.AbsoluteSize.Y)
		end
	end, { UseMemoResult, Current })
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), p2 (copy), UseRefResult (copy), UseResult (copy), p1 (copy), Signal (upval), WrappersModuleInstance (upval), Connection (upval)
		if Current then
			local v1 = p2[Current]
			local IsCurrentMatch = Current == UseRefResult.current
			
			local function animateHighlight()
				-- upvalues: v1 (copy), UseResult (upval), IsCurrentMatch (copy)
				if v1 then
					UseResult(v1, IsCurrentMatch)
				end
			end
			
			if v1 and v1.current and p1.current then
				local ConnectResult = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(v1.current, "AbsoluteSize"), animateHighlight)
				local ConnectResult1 = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(v1.current, "AbsolutePosition"), animateHighlight)
				local ConnectResult2 = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(p1.current, "AbsoluteSize"), animateHighlight)
				
				return function()
					-- upvalues: Connection (upval), ConnectResult (copy), ConnectResult1 (copy), ConnectResult2 (copy)
					Connection.Disconnect(ConnectResult)
					Connection.Disconnect(ConnectResult1)
					Connection.Disconnect(ConnectResult2)
				end
			end
		end
		return function() end
	end, { Current })
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), p2 (copy), p1 (copy), UseResult (copy), UseRefResult (copy)
		if Current then
			local v1 = p2[Current]
			
			if v1 and v1.current and p1.current then
				UseResult(v1, Current == UseRefResult.current)
			end
			UseRefResult.current = Current
		end
	end, { Current, ... })
	
	return {
		activeItemHeight = UseBindingResult,
		highlightPosition = UseAnimatedBindingResult,
		highlightWidth = UseAnimatedBindingResult1
	}
end