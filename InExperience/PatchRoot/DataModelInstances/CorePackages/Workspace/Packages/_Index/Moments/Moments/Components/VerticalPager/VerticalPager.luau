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
local fFlagMomentsFeedSwipeSensitivityConfigModule = require(moments.Flags.FFlagMomentsFeedSwipeSensitivityConfig)
local fIntMomentsFeedSnapSensitivityMilliModule = require(moments.Flags.FIntMomentsFeedSnapSensitivityMilli)
local fIntMomentsFeedAnimationSpeedModule = require(moments.Flags.FIntMomentsFeedAnimationSpeed)
local verticalPagerContextModule = require(script.Parent.VerticalPagerContext)
local verticalPagerContext = verticalPagerContextModule.VerticalPagerContext
local pagerItemContext = verticalPagerContextModule.PagerItemContext
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), pagerItemContext (ref), snapMathModule (ref)
	local index = p1.index
	local getActiveIndex = p1.getActiveIndex
	local var2 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getActiveIndex (ref), index (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getActiveIndex (copy), index (copy)
			return getActiveIndex(p2) == index
		end)
	end, { getActiveIndex, index })
	local var3 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getActiveIndex (ref), index (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getActiveIndex (copy), index (copy)
			return math.abs(getActiveIndex(p2) - index) <= 1
		end)
	end, { getActiveIndex, index })
	
	return reactModule.createElement(pagerItemContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: index (ref), p1 (ref), var2 (ref), var3 (ref)
			return {
				index = index,
				item = p1.item,
				getIsActive = var2,
				getIsVisible = var3
			}
		end, { index, p1.item, var2, var3 })
	}, {
		Item = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, snapMathModule.offsetForIndex(index, p1.stride)),
			Size = UDim2.new(1, 0, 0, p1.itemHeight)
		}, { Content = p1.renderItem(p1.item, index) })
	})
end)

local function useNativeScrollEnabled()
	-- upvalues: reactModule (ref), userInputService (ref)
	local function _(p1)
		return if p1 ~= Enum.UserInputType.MouseWheel then if p1 ~= Enum.UserInputType.MouseButton1 then if p1 ~= Enum.UserInputType.MouseMovement then p1 == Enum.UserInputType.Keyboard else true else true else true
	end
	
	local var2, var3 = reactModule.useState(function()
		-- upvalues: userInputService (copy)
		local lastInputType = userInputService:GetLastInputType()
		
		return not (if lastInputType ~= Enum.UserInputType.MouseWheel then if lastInputType ~= Enum.UserInputType.MouseButton1 then if lastInputType ~= Enum.UserInputType.MouseMovement then lastInputType == Enum.UserInputType.Keyboard else true else true else true)
	end)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var3 (ref)
		local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p1)
			-- upvalues: var3 (copy)
			if p1 == Enum.UserInputType.Touch then
				var3(true)
				
				return
			elseif if p1 ~= Enum.UserInputType.MouseWheel then if p1 ~= Enum.UserInputType.MouseButton1 then if p1 ~= Enum.UserInputType.MouseMovement then p1 == Enum.UserInputType.Keyboard else true else true else true then
				var3(false)
			end
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return var2
end

return function(p1)
	-- upvalues: constantsModule (ref), fFlagMomentsFeedSwipeSensitivityConfigModule (ref), fIntMomentsFeedSnapSensitivityMilliModule (ref), fIntMomentsFeedAnimationSpeedModule (ref), reactModule (ref), useNativeScrollEnabled (ref), usePagerControllerModule (ref), usePagerInputNavigationModule (ref), signalsReactModule (ref), snapMathModule (ref), var1 (ref), verticalPagerContext (ref)
	local store = p1.store
	local renderItem = p1.renderItem
	local keyExtractor = p1.keyExtractor
	local analytics = p1.analytics
	local tuning = p1.tuning or {}
	local DEFAULT_SNAP_SENSITIVITY = constantsModule.DEFAULT_SNAP_SENSITIVITY
	local DEFAULT_ANIMATION_SPEED = constantsModule.DEFAULT_ANIMATION_SPEED
	
	if fFlagMomentsFeedSwipeSensitivityConfigModule then
		DEFAULT_SNAP_SENSITIVITY = fIntMomentsFeedSnapSensitivityMilliModule / 1000
		DEFAULT_ANIMATION_SPEED = fIntMomentsFeedAnimationSpeedModule
	end
	local snapSensitivity = tuning.snapSensitivity or DEFAULT_SNAP_SENSITIVITY
	local animationSpeed = tuning.animationSpeed or DEFAULT_ANIMATION_SPEED
	local overscan = tuning.overscan or constantsModule.DEFAULT_OVERSCAN
	local onEndReached = p1.onEndReached
	local endReachedThreshold = tuning.endReachedThreshold or constantsModule.DEFAULT_END_REACHED_THRESHOLD
	local var2 = p1.active ~= nil or p1.active
	local gap = tuning.gap or 0
	local initialIndex = p1.initialIndex
	local keyboardNavigation = tuning.keyboardNavigation or "global"
	
	local function _(p2, p3)
		-- upvalues: keyExtractor (ref)
		return if keyExtractor == nil then tostring(p3) else keyExtractor(p2, p3)
	end
	
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(0)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var6 (ref)
		var4(p2)
		
		if p2 then
			var6(p2.AbsoluteSize.Y)
		end
	end, {})
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2.AbsoluteSize.Y)
	end, {})
	local var11 = useNativeScrollEnabled()
	local var12 = usePagerControllerModule({
		scrollingFrame = var3,
		store = store,
		itemHeight = var5,
		gap = gap,
		snapSensitivity = snapSensitivity,
		animationSpeed = animationSpeed,
		active = var2,
		nativeScrollEnabled = var11,
		analytics = analytics
	})
	local var13 = usePagerInputNavigationModule({
		active = var2,
		keyboardNavigation = keyboardNavigation,
		goNext = var12.next,
		goPrevious = var12.previous
	})
	local var14 = signalsReactModule.useSignalState(store.getCount)
	local var15 = signalsReactModule.useSignalState(store.getItems)
	local var16 = signalsReactModule.useSignalState(var12.getActiveIndex)
	reactModule.useEffect(function()
		-- upvalues: onEndReached (ref), var14 (ref), var16 (ref), endReachedThreshold (ref), var7 (ref), var15 (ref)
		if onEndReached == nil or var14 <= 0 then return end
		if var14 - endReachedThreshold <= var16 and var7.current ~= var15 then
			var7.current = var15
			onEndReached()
		end
	end, {
		var16,
		var14,
		var15,
		endReachedThreshold,
		onEndReached
	})
	reactModule.useEffect(function()
		-- upvalues: analytics (ref), var14 (ref), var15 (ref), var16 (ref), keyExtractor (ref), var8 (ref)
		local var17 = if analytics ~= nil then nil else analytics.onItemImpression
		
		if var17 == nil or var14 <= 0 then return end
		local var18 = var15[var16]
		
		if var18 == nil then return end
		local var19 = if keyExtractor ~= nil then tostring(var16) else keyExtractor(var18, var16)
		
		if var8.current[var19] then
			return
		end
		var8.current[var19] = true
		var17(var16, var18)
	end, {
		var16,
		var14,
		var15,
		analytics,
		keyExtractor
	})
	local var17 = reactModule.useMemo(function()
		-- upvalues: store (ref), var12 (ref), analytics (ref)
		return {
			store = store,
			getActiveIndex = var12.getActiveIndex,
			getScrollState = var12.getScrollState,
			scrollToIndex = var12.scrollToIndex,
			next = var12.next,
			previous = var12.previous,
			removeItem = var12.removeItem,
			analytics = analytics
		}
	end, { store, var12, analytics })
	local var18 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), initialIndex (ref), var14 (ref), store (ref)
		if var18.current then return end
		if initialIndex == nil then
			var18.current = true
			
			return
		elseif var14 < initialIndex then return end
		var18.current = true
		
		if initialIndex ~= store.getCurrentIndex(false) then
			store.goToItem(initialIndex)
		end
	end, {
		initialIndex,
		var14,
		store.getCurrentIndex,
		store.goToItem
	})
	reactModule.useImperativeHandle(p1.controllerRef, function()
		-- upvalues: var12 (ref)
		return var12
	end, { var12 })
	local var19 = var5 + gap
	local var20 = if var5 > 0 and var14 > 0 then (var14 - 1) * var19 + var5 else 0
	local t = {}
	
	if var5 > 0 and var14 > 0 then
		local visibleWindow = snapMathModule.getVisibleWindow(var16, overscan, var14)
		
		for i = visibleWindow.startIndex, visibleWindow.endIndex do
			local var21 = var15[i]
			
			if var21 ~= nil then
				table.insert(t, reactModule.createElement(var1, {
					key = if keyExtractor ~= nil then tostring(i) else keyExtractor(var21, i),
					index = i,
					item = var21,
					itemHeight = var5,
					stride = var19,
					getActiveIndex = var12.getActiveIndex,
					renderItem = renderItem
				}))
			end
		end
	end
	return reactModule.createElement(verticalPagerContext.Provider, { value = var17 }, {
		Container = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			SelectionGroup = true,
			Active = var2,
			AnchorPoint = p1.AnchorPoint,
			LayoutOrder = p1.LayoutOrder,
			Position = p1.Position,
			Selectable = var2,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			Size = p1.Size or UDim2.fromScale(1, 1),
			ZIndex = p1.ZIndex,
			ref = var13
		}, {
			Scroller = reactModule.createElement("ScrollingFrame", {
				AutomaticCanvasSize = Enum.AutomaticSize.None,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, 0, 0, var20),
				ClipsDescendants = true,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = var2 and (var14 > 1 and var11),
				Selectable = false,
				Size = UDim2.fromScale(1, 1),
				ref = var9,
				[reactModule.Change.AbsoluteSize] = var10
			}, t)
		})
	})
end