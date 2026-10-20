local AppSplitView = script:FindFirstAncestor("AppSplitView")
local ReactModule = require(AppSplitView.Parent.React)
local EnumsModule = require(AppSplitView.Common.Enums)

local function toSupportSize(XOffset): UDim2
	return UDim2.new(0, XOffset, 1, 0)
end

return function(Current)
	-- upvalues: EnumsModule (copy), ReactModule (copy), toSupportSize (copy)
	local NavWidth = Current.navWidth
	local SupportWidth = Current.supportWidth
	local IsSplitRightMatch = (Current.variant or EnumsModule.SplitVariant.SplitRight) == EnumsModule.SplitVariant.SplitRight
	local UseStateResult, UseStateResult2 = ReactModule.useState(Current.hasWidthOverride == true)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(SupportWidth)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(SupportWidth)
	local UseRefResult = ReactModule.useRef(SupportWidth)
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseStateResult2 (copy)
		if Current.hasWidthOverride then
			UseStateResult2(true)
		end
	end, { Current.hasWidthOverride })
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), SupportWidth (copy), UseRefResult (copy), UseBindingResult2_1 (copy)
		UseBindingResult2(SupportWidth)
		
		if SupportWidth == 0 then
			UseRefResult.current = 0
			UseBindingResult2_1(0)
		end
	end, { SupportWidth })
	local UseResult = ReactModule.useCallback(function(p1): UDim2
		-- upvalues: NavWidth (copy)
		return UDim2.new(0, NavWidth + p1, 0, 0)
	end, { NavWidth })
	local UseResult1 = ReactModule.useCallback(function(p1): UDim2
		-- upvalues: NavWidth (copy)
		return UDim2.new(1, -(NavWidth + p1), 1, 0)
	end, { NavWidth })
	local UseResult2 = ReactModule.useCallback(function(p1): UDim2
		-- upvalues: IsSplitRightMatch (copy), NavWidth (copy)
		local NavWidthDelta: number = if IsSplitRightMatch then -p1 - 12 else NavWidth + p1 - 12
		
		return if IsSplitRightMatch then UDim2.new(1, NavWidthDelta, 0, 0) else UDim2.new(0, NavWidthDelta, 0, 0)
	end, { NavWidth, IsSplitRightMatch })
	local UseResult3 = ReactModule.useCallback(function(p1): UDim2
		return UDim2.new(1, -p1, 0, 0)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), toSupportSize (upval)
		return UseBindingResult:map(toSupportSize)
	end, {})
	
	return {
		resizerHitWidth = 24,
		contentPosition = ReactModule.useMemo(function()
			-- upvalues: IsSplitRightMatch (copy), NavWidth (copy), UseBindingResult1 (copy), UseResult (copy)
			return if IsSplitRightMatch then UDim2.new(0, NavWidth, 0, 0) else UseBindingResult1:map(UseResult)
		end, { IsSplitRightMatch, NavWidth, UseResult }),
		contentSize = ReactModule.useMemo(function()
			-- upvalues: UseBindingResult1 (copy), UseResult1 (copy)
			return UseBindingResult1:map(UseResult1)
		end, { UseResult1 }),
		supportPosition = ReactModule.useMemo(function()
			-- upvalues: IsSplitRightMatch (copy), UseBindingResult1 (copy), UseResult3 (copy), NavWidth (copy)
			return if IsSplitRightMatch then UseBindingResult1:map(UseResult3) else UDim2.new(0, NavWidth, 0, 0)
		end, { IsSplitRightMatch, NavWidth, UseResult3 }),
		supportSize = if UseStateResult then UseMemoResult else nil,
		resizerPosition = ReactModule.useMemo(function()
			-- upvalues: UseBindingResult1 (copy), UseResult2 (copy)
			return UseBindingResult1:map(UseResult2)
		end, { UseResult2 }),
		onSupportAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: UseRefResult (copy), UseBindingResult2_1 (copy)
			local X = Frame.AbsoluteSize.X
			UseRefResult.current = X
			UseBindingResult2_1(X)
		end, {}),
		onResizerDrag = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult2 (copy), UseRefResult1 (copy), EnumsModule (upval), UseBindingResult2 (copy), UseRefResult (copy)
			UseStateResult2(true)
			local IsSplitRightMatch = (UseRefResult1.current.variant or EnumsModule.SplitVariant.SplitRight) == EnumsModule.SplitVariant.SplitRight
			UseBindingResult2(UseRefResult.current + (if IsSplitRightMatch then -1 else 1) * p1.X)
		end, {}),
		onResizerDragEnd = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
			local Current = UseRefResult1.current
			
			if Current.onSupportPaneWidthChanged then
				Current.onSupportPaneWidthChanged(UseRefResult.current)
			end
		end, {})
	}
end