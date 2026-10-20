local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactUtilsModule = require(CorePackages.Packages.ReactUtils)
local UsePropertiesFunction = ReactUtilsModule.useProperties
local UseForwardRefFunction = ReactUtilsModule.useForwardRef
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local RoactRodux = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local config = {
	dampingRatio = 1,
	frequency = 3,
	restingPositionLimit = 0.1,
	restingVelocityLimit = 2
}

local function _(p1, p2)
	-- upvalues: ReactModule (copy), DashModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), p2 (copy), ReactModule (upval), p1 (copy)
		return ReactModule.joinBindings((DashModule.map(p2, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: p1 (upval)
			return p1(unpack(p3))
		end)
	end, p2)
end

local function useBackEvent(p1, Callback)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy)
	return (ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, ReactModule.useCallback(function(p2)
		-- upvalues: Callback (copy)
		if p2.eventData and p2.eventData.UserInputState == Enum.UserInputState.End and Callback then
			p2.cancelled = true
			Callback()
		end
	end, { Callback }), nil, p1))
end

local function useFocusState(AbsolutePosition)
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), ReactOtterModule (copy), UseForwardRefFunction (copy), config (copy)
	local UseFocusedGuiObjectResult = ReactFocusNavigationModule.useFocusedGuiObject()
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if p1 == 1 and UseRefResult.current then
			UseRefResult.current()
			UseRefResult.current = nil
		end
		if p1 == 0 and UseRefResult1.current then
			UseRefResult1.current()
			UseRefResult1.current = nil
		end
	end, {})))
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	
	return UseForwardRefFunction(AbsolutePosition, (ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), UseRefResult1 (copy), UseStateResult2 (copy), UseFocusedGuiObjectResult (copy)
		function UseRefResult2.current()
			-- upvalues: UseRefResult (upval), UseFocusGuiObjectResult (upval), p1 (copy), UseRefResult1 (upval), UseStateResult2 (upval), UseFocusedGuiObjectResult (upval)
			function UseRefResult.current()
				-- upvalues: UseFocusGuiObjectResult (upval), p1 (upval)
				UseFocusGuiObjectResult(p1)
			end
			
			function UseRefResult1.current()
				-- upvalues: UseStateResult2 (upval), UseFocusGuiObjectResult (upval), UseFocusedGuiObjectResult (upval)
				UseStateResult2(false)
				UseFocusGuiObjectResult(UseFocusedGuiObjectResult)
			end
		end
	end, { UseFocusedGuiObjectResult, UseFocusGuiObjectResult }))), UseStateResult, UseAnimatedBindingResult, ReactModule.useCallback(function()
		-- upvalues: UseAnimatedBindingResult (copy), UseRefResult2 (copy), UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		if UseAnimatedBindingResult:getValue() == 0 and UseRefResult2.current then
			UseRefResult2.current()
			UseStateResult2(true)
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
		end
	end, { UseFocusedGuiObjectResult, UseAnimatedBindingResult }), (ReactModule.useCallback(function()
		-- upvalues: UseAnimatedBindingResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		if UseAnimatedBindingResult:getValue() == 1 then
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
		end
	end, { UseAnimatedBindingResult }))
end

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UseSelectionCursorFunction (copy), CursorKind (copy), RoactRodux (copy), ReactModule (copy), UsePropertiesFunction (copy), useFocusState (copy), useBackEvent (copy), DashModule (copy)
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local SelectionCursor = p1.selectionCursor or UseSelectionCursorResult
	local UseSelectorResult = RoactRodux.useSelector(function(p3)
		return p3.ScreenSize or Vector2.zero
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseSelectorResult (copy)
		return if p1.safeAreaSize then Vector2.new(UseSelectorResult.X * p1.safeAreaSize.X.Scale + p1.safeAreaSize.X.Offset, UseSelectorResult.Y * p1.safeAreaSize.Y.Scale + p1.safeAreaSize.Y.Offset) else UseSelectorResult
	end, { UseSelectorResult, p1.safeAreaSize })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local AbsolutePosition = UsePropertiesFunction(p2, UseBindingResult2, "AbsolutePosition")
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Vector2.zero)
	local AbsoluteSize = UsePropertiesFunction(nil, UseBindingResult2_1, "AbsoluteSize")
	local _, UseBindingResult2_2 = ReactModule.useBinding(Vector2.zero)
	local AbsolutePosition1 = UsePropertiesFunction(nil, UseBindingResult2_2, "AbsolutePosition")
	local UseBindingResult3, UseBindingResult2_3 = ReactModule.useBinding(Vector2.zero)
	local AbsoluteSize1 = UsePropertiesFunction(nil, UseBindingResult2_3, "AbsoluteSize")
	local UseFocusStateResult2 = nil
	local UseFocusStateResult, UseFocusStateResult3, UseFocusStateResult4, UseFocusStateResult5
	UseFocusStateResult, UseFocusStateResult2, UseFocusStateResult3, UseFocusStateResult4, UseFocusStateResult5 = useFocusState(AbsolutePosition)
	local UseBackEventResult = useBackEvent(UseFocusStateResult, if UseFocusStateResult2 then UseFocusStateResult5 else nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), DashModule (upval), UseFocusStateResult2 (ref)
		return (p1.renderHeader or DashModule.noop)(UseFocusStateResult2)
	end, { UseFocusStateResult2, p1.renderHeader })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseFocusStateResult2 (ref)
		return p1.renderContents(UseFocusStateResult2)
	end, { UseFocusStateResult2, p1.renderContents })
	local UseMemoResult3, UseMemoResult2_1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), AbsoluteSize1 (copy), UseMemoResult2 (copy), p1 (copy), UseStateResult (copy), UseFocusStateResult2 (ref)
		local RenderContentWrapperResult, RenderContentWrapperResult2 = p1.renderContentWrapper(UseStateResult, UseFocusStateResult2, (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			SelectionGroup = true,
			Position = UDim2.new(),
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ref = AbsoluteSize1,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}, UseMemoResult2)))
		
		if not RenderContentWrapperResult2 then
			RenderContentWrapperResult2 = {}
		end
		return RenderContentWrapperResult, RenderContentWrapperResult2
	end, {
		UseMemoResult2,
		UseStateResult,
		AbsoluteSize1,
		p1.renderContentWrapper
	})
	
	local function v52(p3, p4, p5, _, _): UDim2
		return UDim2.new(1, 0, 0, p3.Y + (p5.top or 0) + p4.Y + (p5.bottom or 0))
	end
	
	local list = {
		UseBindingResult1,
		UseBindingResult3,
		UseMemoResult2_1,
		p1.limitInlineHeight,
		UseMemoResult
	}
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list (copy), ReactModule (upval), v52 (copy)
		return ReactModule.joinBindings((DashModule.map(list, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v52 (upval)
			return v52(unpack(p3))
		end)
	end, list)
	
	local function v55(p3: number, p4)
		return if p3 > 0 then 1000000 else p4
	end
	
	local list1 = { UseFocusStateResult3, p1.zIndex }
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list1 (copy), ReactModule (upval), v55 (copy)
		return ReactModule.joinBindings((DashModule.map(list1, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v55 (upval)
			return v55(unpack(p3))
		end)
	end, list1)
	
	local function v58(p3: number, Vector): UDim2
		return if p3 > 0 then UDim2.fromOffset(-Vector.X, -Vector.Y - 200) else UDim2.new()
	end
	
	local list2 = { UseFocusStateResult3, UseBindingResult }
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list2 (copy), ReactModule (upval), v58 (copy)
		return ReactModule.joinBindings((DashModule.map(list2, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v58 (upval)
			return v58(unpack(p3))
		end)
	end, list2)
	
	local function v61(p3: number, Vector): UDim2
		return if p3 > 0 then UDim2.fromOffset(Vector.X, Vector.Y + 400) else UDim2.new()
	end
	
	local list3 = { UseFocusStateResult3, UseSelectorResult }
	local UseMemoResult7 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list3 (copy), ReactModule (upval), v61 (copy)
		return ReactModule.joinBindings((DashModule.map(list3, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v61 (upval)
			return v61(unpack(p3))
		end)
	end, list3)
	
	local function v64(p3, p4: number): number
		return 1 - p3 * (1 - p4)
	end
	
	local list4 = { UseFocusStateResult3, p1.overlayTransparency or 1 }
	local UseMemoResult8 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list4 (copy), ReactModule (upval), v64 (copy)
		return ReactModule.joinBindings((DashModule.map(list4, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v64 (upval)
			return v64(unpack(p3))
		end)
	end, list4)
	
	local function v67(p3: number, p4, p5): UDim2
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local Offset: number = p4.Y.Offset
		local SmallestDelta = math.min(Offset, p5.Y) - Offset
		local SmallestDelta1 = if p1.limitInlineHeight then SmallestDelta else 0
		UseStateResult2(SmallestDelta < 0 and p3 == 1)
		
		return UDim2.new(1, 0, 0, Offset + p3 * SmallestDelta + (1 - p3) * SmallestDelta1)
	end
	
	local list5 = {
		UseFocusStateResult3,
		UseMemoResult4,
		UseMemoResult,
		UseStateResult,
		UseStateResult2
	}
	local UseMemoResult9 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list5 (copy), ReactModule (upval), v67 (copy)
		return ReactModule.joinBindings((DashModule.map(list5, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v67 (upval)
			return v67(unpack(p3))
		end)
	end, list5)
	
	local function v70(p3, p4, p5, p6): UDim2
		return UDim2.fromOffset(0, p3 * ((p6.Y - p5.Y.Offset) / 2 - p4.Y))
	end
	
	local list6 = {
		UseFocusStateResult3,
		UseBindingResult,
		UseMemoResult9,
		UseSelectorResult
	}
	local UseMemoResult91 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list6 (copy), ReactModule (upval), v70 (copy)
		return ReactModule.joinBindings((DashModule.map(list6, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v70 (upval)
			return v70(unpack(p3))
		end)
	end, list6)
	
	local function v73(p3, p4): UDim2
		return p3 + UDim2.fromOffset(0, p4.Y)
	end
	
	local list7 = { UseMemoResult91, UseBindingResult1 }
	local UseMemoResult10 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list7 (copy), ReactModule (upval), v73 (copy)
		return ReactModule.joinBindings((DashModule.map(list7, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v73 (upval)
			return v73(unpack(p3))
		end)
	end, list7)
	
	local function v76(p3, p4): UDim2
		return p3 - UDim2.fromOffset(0, p4.Y)
	end
	
	local list8 = { UseMemoResult9, UseBindingResult1 }
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), list8 (copy), ReactModule (upval), v76 (copy)
		return ReactModule.joinBindings((DashModule.map(list8, function(p3)
			-- upvalues: ReactModule (upval)
			return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
		end))):map(function(p3)
			-- upvalues: v76 (upval)
			return v76(unpack(p3))
		end)
	end, list8)
	
	local function v79(p3: number): number
		return if p3 < 1 then 4 else 2
	end
	
	local list9 = { UseFocusStateResult3 }
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Selectable = false,
		Size = if p1.limitInlineHeight then UseMemoResult9 else UseMemoResult4,
		ref = UseBackEventResult,
		LayoutOrder = p1.layoutOrder,
		ZIndex = UseMemoResult5
	}, {
		Overlay = ReactModule.createElement("TextButton", {
			Text = "",
			Position = UseMemoResult6,
			Size = UseMemoResult7,
			BackgroundColor3 = p1.overlayColor3 or Color3.new(0, 0, 0),
			BackgroundTransparency = UseMemoResult8,
			AutoButtonColor = false,
			ZIndex = 1,
			Selectable = false,
			Active = true,
			[ReactModule.Event.Activated] = UseFocusStateResult5
		}),
		Header = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			ZIndex = 3,
			ref = AbsoluteSize,
			Position = UseMemoResult91,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, UseMemoResult1),
		Panel = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			ZIndex = 3,
			Position = UseMemoResult10,
			Size = UseMemoResult11,
			ref = AbsolutePosition1
		}, UseMemoResult3),
		Cover = ReactModule.createElement("TextButton", {
			Text = "",
			Position = UseMemoResult10,
			Size = UseMemoResult11,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			ZIndex = ReactModule.useMemo(function()
				-- upvalues: DashModule (upval), list9 (copy), ReactModule (upval), v79 (copy)
				return ReactModule.joinBindings((DashModule.map(list9, function(p3)
					-- upvalues: ReactModule (upval)
					return if type(p3) == "table" and p3.getValue then p3 else ReactModule.createBinding(p3)
				end))):map(function(p3)
					-- upvalues: v79 (upval)
					return v79(unpack(p3))
				end)
			end, list9),
			Active = true,
			Selectable = true,
			SelectionImageObject = SelectionCursor,
			SelectionOrder = 1,
			SelectionGroup = UseFocusStateResult2,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			[ReactModule.Event.Activated] = UseFocusStateResult4
		})
	})
end)