local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local snapMathModule = require(script.Parent.snapMath)
local usePagerControllerModule = require(script.Parent.usePagerController)
local usePagerInputNavigationModule = require(script.Parent.usePagerInputNavigation)
local getFFlagMomentsDesktopWheelPagingModule = require(moments.Flags.GetFFlagMomentsDesktopWheelPaging)
local fFlagMomentsFeedSwipeSensitivityConfigModule = require(moments.Flags.FFlagMomentsFeedSwipeSensitivityConfig)
local fIntMomentsFeedSnapSensitivityMilliModule = require(moments.Flags.FIntMomentsFeedSnapSensitivityMilli)
local fIntMomentsFeedAnimationSpeedModule = require(moments.Flags.FIntMomentsFeedAnimationSpeed)
local verticalPagerContextModule = require(script.Parent.VerticalPagerContext)
local verticalPagerContext = verticalPagerContextModule.VerticalPagerContext
local pagerItemContext = verticalPagerContextModule.PagerItemContext
local var14 = reactModule.memo(function(p0) --[[ line: 59 | named "PagerItemProviderInner" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), pagerItemContext (ref), snapMathModule (ref)
	local index = p0.index
	local getActiveIndex = p0.getActiveIndex
	local var16 = reactModule.useMemo(function() --[[ line: 63 ]]
		-- upvalues: signalsModule (copy), getActiveIndex (ref), index (ref)
		return signalsModule.createComputed(function(p1) --[[ line: 64 ]]
			-- upvalues: getActiveIndex (copy), index (copy)
			return getActiveIndex(p1) == index
		end)
	end, { getActiveIndex, index })
	local var17 = reactModule.useMemo(function() --[[ line: 72 ]]
		-- upvalues: signalsModule (copy), getActiveIndex (ref), index (ref)
		return signalsModule.createComputed(function(p2) --[[ line: 73 ]]
			-- upvalues: getActiveIndex (copy), index (copy)
			return math.abs(getActiveIndex(p2) - index) <= 1
		end)
	end, { getActiveIndex, index })
	
	return reactModule.createElement(pagerItemContext.Provider, {
		value = reactModule.useMemo(function() --[[ line: 78 ]]
			-- upvalues: index (ref), p0 (ref), var16 (ref), var17 (ref)
			return {
				index = index,
				item = p0.item,
				getIsActive = var16,
				getIsVisible = var17
			}
		end, { index, p0.item, var16, var17 })
	}, {
		Item = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, snapMathModule.offsetForIndex(index, p0.stride)),
			Size = UDim2.new(1, 0, 0, p0.itemHeight)
		}, { Content = p0.renderItem(p0.item, index) })
	})
end)

local function useNativeScrollEnabled() --[[ line: 123 ]]
	-- upvalues: getFFlagMomentsDesktopWheelPagingModule (ref), reactModule (ref), userInputService (ref)
	local var18 = getFFlagMomentsDesktopWheelPagingModule()
	
	local function _(p3) --[[ line: 128 | named "isNonTouch" ]]
		return if p3 ~= Enum.UserInputType.MouseWheel then if p3 ~= Enum.UserInputType.MouseButton1 then if p3 ~= Enum.UserInputType.MouseMovement then p3 == Enum.UserInputType.Keyboard else true else true else true
	end
	
	local var19, var20 = reactModule.useState(function() --[[ line: 135 ]]
		-- upvalues: var18 (ref), userInputService (copy)
		local var21 = var18
		
		if var21 then
			local lastInputType = userInputService:GetLastInputType()
			var21 = if lastInputType ~= Enum.UserInputType.MouseWheel then if lastInputType ~= Enum.UserInputType.MouseButton1 then if lastInputType ~= Enum.UserInputType.MouseMovement then lastInputType == Enum.UserInputType.Keyboard else true else true else true
		end
		return not var21
	end)
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: var18 (ref), userInputService (copy), var20 (ref)
		if var18 then
			local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p4) --[[ line: 143 ]]
				-- upvalues: var20 (copy)
				if p4 == Enum.UserInputType.Touch then
					var20(true)
					
					return
				elseif if p4 ~= Enum.UserInputType.MouseWheel then if p4 ~= Enum.UserInputType.MouseButton1 then if p4 ~= Enum.UserInputType.MouseMovement then p4 == Enum.UserInputType.Keyboard else true else true else true then
					var20(false)
				end
			end)
			
			return function() --[[ line: 150 ]]
				-- upvalues: lastInputTypeChangedConnection (ref)
				lastInputTypeChangedConnection:Disconnect()
			end
		end
	end, { var18 })
	
	return var19
end

return function(p5) --[[ line: 158 | named "VerticalPager" ]]
	-- upvalues: constantsModule (ref), fFlagMomentsFeedSwipeSensitivityConfigModule (ref), fIntMomentsFeedSnapSensitivityMilliModule (ref), fIntMomentsFeedAnimationSpeedModule (ref), reactModule (ref), useNativeScrollEnabled (ref), usePagerControllerModule (ref), usePagerInputNavigationModule (ref), signalsReactModule (ref), snapMathModule (ref), var14 (ref), verticalPagerContext (ref)
	local store = p5.store
	local renderItem = p5.renderItem
	local keyExtractor = p5.keyExtractor
	local analytics = p5.analytics
	local tuning = p5.tuning or {}
	local DEFAULT_SNAP_SENSITIVITY = constantsModule.DEFAULT_SNAP_SENSITIVITY
	local DEFAULT_ANIMATION_SPEED = constantsModule.DEFAULT_ANIMATION_SPEED
	
	if fFlagMomentsFeedSwipeSensitivityConfigModule then
		DEFAULT_SNAP_SENSITIVITY = fIntMomentsFeedSnapSensitivityMilliModule / 1000
		DEFAULT_ANIMATION_SPEED = fIntMomentsFeedAnimationSpeedModule
	end
	local snapSensitivity = tuning.snapSensitivity or DEFAULT_SNAP_SENSITIVITY
	local animationSpeed = tuning.animationSpeed or DEFAULT_ANIMATION_SPEED
	local overscan = tuning.overscan or constantsModule.DEFAULT_OVERSCAN
	local onEndReached = p5.onEndReached
	local endReachedThreshold = tuning.endReachedThreshold or constantsModule.DEFAULT_END_REACHED_THRESHOLD
	local var29 = p5.active ~= nil or p5.active
	local gap = tuning.gap or 0
	local initialIndex = p5.initialIndex
	local keyboardNavigation = tuning.keyboardNavigation or "global"
	
	local function _(p6, p7) --[[ line: 189 | named "keyOf" ]]
		-- upvalues: keyExtractor (ref)
		return if keyExtractor == nil then tostring(p7) else keyExtractor(p6, p7)
	end
	
	local var32, var33 = reactModule.useState(nil)
	local var34, var35 = reactModule.useState(0)
	local var36 = reactModule.useRef(nil)
	local var37 = reactModule.useRef({})
	local var38 = reactModule.useCallback(function(p8) --[[ line: 203 ]]
		-- upvalues: var33 (ref), var35 (ref)
		var33(p8)
		
		if p8 then
			var35(p8.AbsoluteSize.Y)
		end
	end, {})
	local var39 = reactModule.useCallback(function(p9) --[[ line: 210 ]]
		-- upvalues: var35 (ref)
		var35(p9.AbsoluteSize.Y)
	end, {})
	local var40 = useNativeScrollEnabled()
	local var41 = usePagerControllerModule({
		scrollingFrame = var32,
		store = store,
		itemHeight = var34,
		gap = gap,
		snapSensitivity = snapSensitivity,
		animationSpeed = animationSpeed,
		active = var29,
		nativeScrollEnabled = var40,
		analytics = analytics
	})
	local var42 = usePagerInputNavigationModule({
		active = var29,
		keyboardNavigation = keyboardNavigation,
		goNext = var41.next,
		goPrevious = var41.previous
	})
	local var43 = signalsReactModule.useSignalState(store.getCount)
	local var44 = signalsReactModule.useSignalState(store.getItems)
	local var45 = signalsReactModule.useSignalState(var41.getActiveIndex)
	reactModule.useEffect(function() --[[ line: 247 ]]
		-- upvalues: onEndReached (ref), var43 (ref), var45 (ref), endReachedThreshold (ref), var36 (ref), var44 (ref)
		if onEndReached == nil or var43 <= 0 then return end
		if var43 - endReachedThreshold <= var45 and var36.current ~= var44 then
			var36.current = var44
			onEndReached()
		end
	end, {
		var45,
		var43,
		var44,
		endReachedThreshold,
		onEndReached
	})
	reactModule.useEffect(function() --[[ line: 259 ]]
		-- upvalues: analytics (ref), var43 (ref), var44 (ref), var45 (ref), keyExtractor (ref), var37 (ref)
		local var53 = if analytics ~= nil then nil else analytics.onItemImpression
		
		if var53 == nil or var43 <= 0 then return end
		local var54 = var44[var45]
		
		if var54 == nil then return end
		local var55 = if keyExtractor ~= nil then tostring(var45) else keyExtractor(var54, var45)
		
		if var37.current[var55] then
			return
		end
		var37.current[var55] = true
		var53(var45, var54)
	end, {
		var45,
		var43,
		var44,
		analytics,
		keyExtractor
	})
	local var46 = reactModule.useMemo(function() --[[ line: 276 ]]
		-- upvalues: store (ref), var41 (ref), analytics (ref)
		return {
			store = store,
			getActiveIndex = var41.getActiveIndex,
			getScrollState = var41.getScrollState,
			scrollToIndex = var41.scrollToIndex,
			next = var41.next,
			previous = var41.previous,
			removeItem = var41.removeItem,
			analytics = analytics
		}
	end, { store, var41, analytics })
	local var47 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 295 ]]
		-- upvalues: var47 (ref), initialIndex (ref), var43 (ref), store (ref)
		if var47.current then return end
		if initialIndex == nil then
			var47.current = true
			
			return
		elseif var43 < initialIndex then return end
		var47.current = true
		
		if initialIndex ~= store.getCurrentIndex(false) then
			store.goToItem(initialIndex)
		end
	end, {
		initialIndex,
		var43,
		store.getCurrentIndex,
		store.goToItem
	})
	reactModule.useImperativeHandle(p5.controllerRef, function() --[[ line: 314 ]]
		-- upvalues: var41 (ref)
		return var41
	end, { var41 })
	local var48 = var34 + gap
	local var49 = if var34 > 0 and var43 > 0 then (var43 - 1) * var48 + var34 else 0
	local t = {}
	
	if var34 > 0 and var43 > 0 then
		local visibleWindow = snapMathModule.getVisibleWindow(var45, overscan, var43)
		
		for i = visibleWindow.startIndex, visibleWindow.endIndex do
			local var52 = var44[i]
			
			if var52 ~= nil then
				table.insert(t, reactModule.createElement(var14, {
					key = if keyExtractor ~= nil then tostring(i) else keyExtractor(var52, i),
					index = i,
					item = var52,
					itemHeight = var34,
					stride = var48,
					getActiveIndex = var41.getActiveIndex,
					renderItem = renderItem
				}))
			end
		end
	end
	return reactModule.createElement(verticalPagerContext.Provider, { value = var46 }, {
		Container = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			SelectionGroup = true,
			Active = var29,
			AnchorPoint = p5.AnchorPoint,
			LayoutOrder = p5.LayoutOrder,
			Position = p5.Position,
			Selectable = var29,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			Size = p5.Size or UDim2.fromScale(1, 1),
			ZIndex = p5.ZIndex,
			ref = var42
		}, {
			Scroller = reactModule.createElement("ScrollingFrame", {
				AutomaticCanvasSize = Enum.AutomaticSize.None,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, 0, 0, var49),
				ClipsDescendants = true,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = var29 and (var43 > 1 and var40),
				Selectable = false,
				Size = UDim2.fromScale(1, 1),
				ref = var38,
				[reactModule.Change.AbsoluteSize] = var39
			}, t)
		})
	})
end