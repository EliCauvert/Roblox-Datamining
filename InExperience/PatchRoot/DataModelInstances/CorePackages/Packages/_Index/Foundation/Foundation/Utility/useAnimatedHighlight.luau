local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FlagsModule = require(Foundation.Utility.Flags)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Connection = WrappersModule.Connection
local WrappersModuleInstance = WrappersModule.Instance
local Signal = WrappersModule.Signal

return function(Current, p1, p2, ...) --[[ Line: 20 | Named "useAnimatedHighlight" ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy), FlagsModule (copy), ReactOtterModule (copy), Signal (copy), WrappersModuleInstance (copy), Connection (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return {
			easingStyle = UseTokensModuleResult.Ease.StandardOut,
			duration = UseTokensModuleResult.Time.Time_200
		}
	end, { UseTokensModuleResult })
	local UseRefResult = ReactModule.useRef(Current)
	local UseRefResult1 = if FlagsModule.FoundationAnimatedHighlightSettling then ReactModule.useRef(Current) else nil
	local UseResult = if FlagsModule.FoundationAnimatedHighlightSettling then ReactModule.useCallback(function() --[[ Line: 40 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		UseRefResult1.current = UseRefResult.current
	end, {}) else nil
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, if FlagsModule.FoundationAnimatedHighlightSettling then UseResult else nil)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseResult1 = ReactModule.useCallback(function(p3, p4) --[[ Line: 50 ]]
		-- upvalues: p1 (copy), FlagsModule (upval), Current (copy), UseRefResult1 (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2 (copy), UseMemoResult (copy), UseBindingResult2 (copy)
		if p3.current and p1.current then
			local XDelta = p3.current.AbsolutePosition.X - p1.current.AbsolutePosition.X
			local X = p3.current.AbsoluteSize.X
			
			if if FlagsModule.FoundationAnimatedHighlightSettling then Current == UseRefResult1.current else p4 then
				UseAnimatedBindingResult2_1((ReactOtterModule.instant(X)))
				UseAnimatedBindingResult2((ReactOtterModule.instant(XDelta)))
			else
				UseAnimatedBindingResult2(ReactOtterModule.ease(XDelta, UseMemoResult))
				UseAnimatedBindingResult2_1(ReactOtterModule.ease(X, UseMemoResult))
			end
			UseBindingResult2(p3.current.AbsoluteSize.Y)
		end
	end, { UseMemoResult, Current })
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: Current (copy), p2 (copy), UseRefResult (copy), UseResult1 (copy), p1 (copy), Signal (upval), WrappersModuleInstance (upval), Connection (upval)
		if Current then
			local v1 = p2[Current]
			local IsCurrentMatch = Current == UseRefResult.current
			
			local function animateHighlight() --[[ Line: 77 ]]
				-- upvalues: v1 (copy), UseResult1 (upval), IsCurrentMatch (copy)
				if v1 then
					UseResult1(v1, IsCurrentMatch)
				end
			end
			
			if v1 and v1.current and p1.current then
				local ConnectResult = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(v1.current, "AbsoluteSize"), animateHighlight)
				local ConnectResult1 = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(v1.current, "AbsolutePosition"), animateHighlight)
				local ConnectResult2 = Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(p1.current, "AbsoluteSize"), animateHighlight)
				
				return function() --[[ Line: 98 ]]
					-- upvalues: Connection (upval), ConnectResult (copy), ConnectResult1 (copy), ConnectResult2 (copy)
					Connection.Disconnect(ConnectResult)
					Connection.Disconnect(ConnectResult1)
					Connection.Disconnect(ConnectResult2)
				end
			end
		end
		return function() --[[ Line: 106 ]] end
	end, { Current })
	ReactModule.useEffect(function() --[[ Line: 109 ]]
		-- upvalues: Current (copy), p2 (copy), p1 (copy), UseResult1 (copy), UseRefResult (copy)
		if Current then
			local v1 = p2[Current]
			
			if v1 and v1.current and p1.current then
				UseResult1(v1, Current == UseRefResult.current)
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