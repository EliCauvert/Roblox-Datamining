local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local SnapMathModule = require(script.Parent.snapMath)
local UsePagerControllerModule = require(script.Parent.usePagerController)
local UsePagerInputNavigationModule = require(script.Parent.usePagerInputNavigation)
local FFlagMomentsFeedSwipeSensitivityConfigModule = require(Moments.Flags.FFlagMomentsFeedSwipeSensitivityConfig)
local FIntMomentsFeedSnapSensitivityMilliModule = require(Moments.Flags.FIntMomentsFeedSnapSensitivityMilli)
local FIntMomentsFeedAnimationSpeedModule = require(Moments.Flags.FIntMomentsFeedAnimationSpeed)
local VerticalPagerContextModule = require(script.Parent.VerticalPagerContext)
local VerticalPagerContext = VerticalPagerContextModule.VerticalPagerContext
local PagerItemContext = VerticalPagerContextModule.PagerItemContext
local MemoResult = ReactModule.memo(function(p1) --[[ Line: 57 | Named "PagerItemProviderInner" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), PagerItemContext (copy), SnapMathModule (copy)
	local Index = p1.index
	local GetActiveIndexFunction = p1.getActiveIndex
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 61 ]]
		-- upvalues: SignalsModule (upval), GetActiveIndexFunction (copy), Index (copy)
		return SignalsModule.createComputed(function(p2): boolean --[[ Line: 62 ]]
			-- upvalues: GetActiveIndexFunction (upval), Index (upval)
			return GetActiveIndexFunction(p2) == Index
		end)
	end, { GetActiveIndexFunction, Index })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 70 ]]
		-- upvalues: SignalsModule (upval), GetActiveIndexFunction (copy), Index (copy)
		return SignalsModule.createComputed(function(p2): boolean --[[ Line: 71 ]]
			-- upvalues: GetActiveIndexFunction (upval), Index (upval)
			return math.abs(GetActiveIndexFunction(p2) - Index) <= 1
		end)
	end, { GetActiveIndexFunction, Index })
	
	return ReactModule.createElement(PagerItemContext.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 76 ]]
			-- upvalues: Index (copy), p1 (copy), UseMemoResult (copy), UseMemoResult1 (copy)
			return {
				index = Index,
				item = p1.item,
				getIsActive = UseMemoResult,
				getIsVisible = UseMemoResult1
			}
		end, { Index, p1.item, UseMemoResult, UseMemoResult1 })
	}, {
		Item = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, SnapMathModule.offsetForIndex(Index, p1.stride)),
			Size = UDim2.new(1, 0, 0, p1.itemHeight)
		}, { Content = p1.renderItem(p1.item, Index) })
	})
end)

local function useNativeScrollEnabled() --[[ Line: 121 ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local function _(UserInputType): boolean --[[ Line: 122 | Named "isNonTouch" ]]
		return UserInputType == Enum.UserInputType.MouseWheel or (UserInputType == Enum.UserInputType.MouseButton1 or (UserInputType == Enum.UserInputType.MouseMovement or UserInputType == Enum.UserInputType.Keyboard))
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean --[[ Line: 129 ]]
		-- upvalues: UserInputService (upval)
		local LastInputType = UserInputService:GetLastInputType()
		
		return not (LastInputType == Enum.UserInputType.MouseWheel or (LastInputType == Enum.UserInputType.MouseButton1 or (LastInputType == Enum.UserInputType.MouseMovement or LastInputType == Enum.UserInputType.Keyboard)))
	end)
	ReactModule.useEffect(function() --[[ Line: 133 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(UserInputType) --[[ Line: 134 ]]
			-- upvalues: UseStateResult2 (upval)
			if UserInputType == Enum.UserInputType.Touch then
				UseStateResult2(true)
				
				return
			end
			if UserInputType == Enum.UserInputType.MouseWheel or (UserInputType == Enum.UserInputType.MouseButton1 or (UserInputType == Enum.UserInputType.MouseMovement or UserInputType == Enum.UserInputType.Keyboard)) then
				UseStateResult2(false)
			end
		end)
		
		return function() --[[ Line: 141 ]]
			-- upvalues: LastInputTypeChangedConnection (copy)
			LastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end

return function(Frame: Frame) --[[ Line: 149 | Named "VerticalPager" ]]
	-- upvalues: ConstantsModule (copy), FFlagMomentsFeedSwipeSensitivityConfigModule (copy), FIntMomentsFeedSnapSensitivityMilliModule (copy), FIntMomentsFeedAnimationSpeedModule (copy), ReactModule (copy), useNativeScrollEnabled (copy), UsePagerControllerModule (copy), UsePagerInputNavigationModule (copy), SignalsReactModule (copy), SnapMathModule (copy), MemoResult (copy), VerticalPagerContext (copy)
	local Store = Frame.store
	local RenderItem = Frame.renderItem
	local KeyExtractorFunction = Frame.keyExtractor
	local Analytics = Frame.analytics
	local Tuning = Frame.tuning or {}
	local DEFAULTSNAPSENSITIVITY = ConstantsModule.DEFAULT_SNAP_SENSITIVITY
	local DEFAULTANIMATIONSPEED = ConstantsModule.DEFAULT_ANIMATION_SPEED
	
	if FFlagMomentsFeedSwipeSensitivityConfigModule then
		DEFAULTSNAPSENSITIVITY = FIntMomentsFeedSnapSensitivityMilliModule / 1000
		DEFAULTANIMATIONSPEED = FIntMomentsFeedAnimationSpeedModule
	end
	local SnapSensitivity = Tuning.snapSensitivity or DEFAULTSNAPSENSITIVITY
	local AnimationSpeed = Tuning.animationSpeed or DEFAULTANIMATIONSPEED
	local Overscan = Tuning.overscan or ConstantsModule.DEFAULT_OVERSCAN
	local OnEndReachedFunction = Frame.onEndReached
	local EndReachedThreshold = Tuning.endReachedThreshold or ConstantsModule.DEFAULT_END_REACHED_THRESHOLD
	local NoActive = Frame.active == nil or Frame.active
	local Gap = Tuning.gap or 0
	local InitialIndex = Frame.initialIndex
	local KeyboardNavigation = Tuning.keyboardNavigation or "global"
	
	local function _(p1, p2) --[[ Line: 180 | Named "keyOf" ]]
		-- upvalues: KeyExtractorFunction (copy)
		return if KeyExtractorFunction == nil then tostring(p2) else KeyExtractorFunction(p1, p2)
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 194 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseStateResult2(Frame)
		
		if Frame then
			UseStateResult2_1(Frame.AbsoluteSize.Y)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 201 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.Y)
	end, {})
	local UseNativeScrollEnabledResult = useNativeScrollEnabled()
	local UsePagerControllerModuleResult = UsePagerControllerModule({
		scrollingFrame = UseStateResult,
		store = Store,
		itemHeight = UseStateResult1,
		gap = Gap,
		snapSensitivity = SnapSensitivity,
		animationSpeed = AnimationSpeed,
		active = NoActive,
		nativeScrollEnabled = UseNativeScrollEnabledResult,
		analytics = Analytics
	})
	local UsePagerInputNavigationModuleResult = UsePagerInputNavigationModule({
		active = NoActive,
		keyboardNavigation = KeyboardNavigation,
		goNext = UsePagerControllerModuleResult.next,
		goPrevious = UsePagerControllerModuleResult.previous
	})
	local UseSignalStateResult: number = SignalsReactModule.useSignalState(Store.getCount)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Store.getItems)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UsePagerControllerModuleResult.getActiveIndex)
	ReactModule.useEffect(function() --[[ Line: 238 ]]
		-- upvalues: OnEndReachedFunction (copy), UseSignalStateResult (copy), UseSignalStateResult2 (copy), EndReachedThreshold (copy), UseRefResult (copy), UseSignalStateResult1 (copy)
		if OnEndReachedFunction == nil or UseSignalStateResult <= 0 then return end
		if UseSignalStateResult - EndReachedThreshold <= UseSignalStateResult2 and UseRefResult.current ~= UseSignalStateResult1 then
			UseRefResult.current = UseSignalStateResult1
			OnEndReachedFunction()
		end
	end, {
		UseSignalStateResult2,
		UseSignalStateResult,
		UseSignalStateResult1,
		EndReachedThreshold,
		OnEndReachedFunction
	})
	ReactModule.useEffect(function() --[[ Line: 250 ]]
		-- upvalues: Analytics (copy), UseSignalStateResult (copy), UseSignalStateResult1 (copy), UseSignalStateResult2 (copy), KeyExtractorFunction (copy), UseRefResult1 (copy)
		local OnItemImpression: (any, any) -> () = if Analytics == nil then nil else Analytics.onItemImpression
		
		if OnItemImpression == nil or UseSignalStateResult <= 0 then return end
		local UseSignalStateResultEntry = UseSignalStateResult1[UseSignalStateResult2]
		
		if UseSignalStateResultEntry == nil then return end
		local Text = if KeyExtractorFunction == nil then tostring(UseSignalStateResult2) else KeyExtractorFunction(UseSignalStateResultEntry, UseSignalStateResult2)
		
		if not UseRefResult1.current[Text] then
			UseRefResult1.current[Text] = true
			OnItemImpression(UseSignalStateResult2, UseSignalStateResultEntry)
			
			return
		end
	end, {
		UseSignalStateResult2,
		UseSignalStateResult,
		UseSignalStateResult1,
		Analytics,
		KeyExtractorFunction
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 267 ]]
		-- upvalues: Store (copy), UsePagerControllerModuleResult (copy), Analytics (copy)
		return {
			store = Store,
			getActiveIndex = UsePagerControllerModuleResult.getActiveIndex,
			getScrollState = UsePagerControllerModuleResult.getScrollState,
			scrollToIndex = UsePagerControllerModuleResult.scrollToIndex,
			next = UsePagerControllerModuleResult.next,
			previous = UsePagerControllerModuleResult.previous,
			removeItem = UsePagerControllerModuleResult.removeItem,
			analytics = Analytics
		}
	end, { Store, UsePagerControllerModuleResult, Analytics })
	local UseRefResult2 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 286 ]]
		-- upvalues: UseRefResult2 (copy), InitialIndex (copy), UseSignalStateResult (copy), Store (copy)
		if UseRefResult2.current then return end
		if InitialIndex == nil then
			UseRefResult2.current = true
			
			return
		end
		if UseSignalStateResult < InitialIndex then return end
		UseRefResult2.current = true
		
		if InitialIndex ~= Store.getCurrentIndex(false) then
			Store.goToItem(InitialIndex)
		end
	end, {
		InitialIndex,
		UseSignalStateResult,
		Store.getCurrentIndex,
		Store.goToItem
	})
	ReactModule.useImperativeHandle(Frame.controllerRef, function() --[[ Line: 305 ]]
		-- upvalues: UsePagerControllerModuleResult (copy)
		return UsePagerControllerModuleResult
	end, { UsePagerControllerModuleResult })
	local NewUseStateResult = UseStateResult1 + Gap
	local YOffset = if UseStateResult1 > 0 and UseSignalStateResult > 0 then (UseSignalStateResult - 1) * NewUseStateResult + UseStateResult1 else 0
	local Elements = {}
	
	if UseStateResult1 > 0 and UseSignalStateResult > 0 then
		local VisibleWindow = SnapMathModule.getVisibleWindow(UseSignalStateResult2, Overscan, UseSignalStateResult)
		
		for i = VisibleWindow.startIndex, VisibleWindow.endIndex do
			local UseSignalStateResultEntry = UseSignalStateResult1[i]
			
			if UseSignalStateResultEntry ~= nil then
				table.insert(Elements, ReactModule.createElement(MemoResult, {
					key = if KeyExtractorFunction == nil then tostring(i) else KeyExtractorFunction(UseSignalStateResultEntry, i),
					index = i,
					item = UseSignalStateResultEntry,
					itemHeight = UseStateResult1,
					stride = NewUseStateResult,
					getActiveIndex = UsePagerControllerModuleResult.getActiveIndex,
					renderItem = RenderItem
				}))
			end
		end
	end
	return ReactModule.createElement(VerticalPagerContext.Provider, { value = UseMemoResult }, {
		Container = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			SelectionGroup = true,
			Active = NoActive,
			AnchorPoint = Frame.AnchorPoint,
			LayoutOrder = Frame.LayoutOrder,
			Position = Frame.Position,
			Selectable = NoActive,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			Size = Frame.Size or UDim2.fromScale(1, 1),
			ZIndex = Frame.ZIndex,
			ref = UsePagerInputNavigationModuleResult
		}, {
			Scroller = ReactModule.createElement("ScrollingFrame", {
				AutomaticCanvasSize = Enum.AutomaticSize.None,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, 0, 0, YOffset),
				ClipsDescendants = true,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = NoActive and (UseSignalStateResult > 1 and UseNativeScrollEnabledResult),
				Selectable = false,
				Size = UDim2.fromScale(1, 1),
				ref = UseResult,
				[ReactModule.Change.AbsoluteSize] = UseResult1
			}, Elements)
		})
	})
end