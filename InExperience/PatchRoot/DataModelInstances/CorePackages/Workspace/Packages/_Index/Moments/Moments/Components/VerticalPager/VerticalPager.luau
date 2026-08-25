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
local var13 = reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), signalsModule (ref), pagerItemContext (ref), snapMathModule (ref)
	local index = p0.index
	local getActiveIndex = p0.getActiveIndex
	local var15 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getActiveIndex (ref), index (ref)
		return signalsModule.createComputed(function(p1)
			-- upvalues: getActiveIndex (copy), index (copy)
			return getActiveIndex(p1) == index
		end)
	end, { getActiveIndex, index })
	local var16 = reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getActiveIndex (ref), index (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getActiveIndex (copy), index (copy)
			return math.abs(getActiveIndex(p2) - index) <= 1
		end)
	end, { getActiveIndex, index })
	
	return reactModule.createElement(pagerItemContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: index (ref), p0 (ref), var15 (ref), var16 (ref)
			return {
				index = index,
				item = p0.item,
				getIsActive = var15,
				getIsVisible = var16
			}
		end, { index, p0.item, var15, var16 })
	}, {
		Item = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, snapMathModule.offsetForIndex(index, p0.stride)),
			Size = UDim2.new(1, 0, 0, p0.itemHeight)
		}, { Content = p0.renderItem(p0.item, index) })
	})
end)

local function useNativeScrollEnabled()
	-- upvalues: reactModule (ref), userInputService (ref)
	local function _(p3)
		return if p3 ~= Enum.UserInputType.MouseWheel then if p3 ~= Enum.UserInputType.MouseButton1 then if p3 ~= Enum.UserInputType.MouseMovement then p3 == Enum.UserInputType.Keyboard else true else true else true
	end
	
	local var17, var18 = reactModule.useState(function()
		-- upvalues: userInputService (copy)
		local lastInputType = userInputService:GetLastInputType()
		
		return not (if lastInputType ~= Enum.UserInputType.MouseWheel then if lastInputType ~= Enum.UserInputType.MouseButton1 then if lastInputType ~= Enum.UserInputType.MouseMovement then lastInputType == Enum.UserInputType.Keyboard else true else true else true)
	end)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var18 (ref)
		local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p4)
			-- upvalues: var18 (copy)
			if p4 == Enum.UserInputType.Touch then
				var18(true)
				
				return
			elseif if p4 ~= Enum.UserInputType.MouseWheel then if p4 ~= Enum.UserInputType.MouseButton1 then if p4 ~= Enum.UserInputType.MouseMovement then p4 == Enum.UserInputType.Keyboard else true else true else true then
				var18(false)
			end
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return var17
end

return function(p5)
	-- upvalues: constantsModule (ref), fFlagMomentsFeedSwipeSensitivityConfigModule (ref), fIntMomentsFeedSnapSensitivityMilliModule (ref), fIntMomentsFeedAnimationSpeedModule (ref), reactModule (ref), useNativeScrollEnabled (ref), usePagerControllerModule (ref), usePagerInputNavigationModule (ref), signalsReactModule (ref), snapMathModule (ref), var13 (ref), verticalPagerContext (ref)
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
	local var26 = p5.active ~= nil or p5.active
	local gap = tuning.gap or 0
	local initialIndex = p5.initialIndex
	local keyboardNavigation = tuning.keyboardNavigation or "global"
	
	local function _(p6, p7)
		-- upvalues: keyExtractor (ref)
		return if keyExtractor == nil then tostring(p7) else keyExtractor(p6, p7)
	end
	
	local var29, var30 = reactModule.useState(nil)
	local var31, var32 = reactModule.useState(0)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef({})
	local var35 = reactModule.useCallback(function(p8)
		-- upvalues: var30 (ref), var32 (ref)
		var30(p8)
		
		if p8 then
			var32(p8.AbsoluteSize.Y)
		end
	end, {})
	local var36 = reactModule.useCallback(function(p9)
		-- upvalues: var32 (ref)
		var32(p9.AbsoluteSize.Y)
	end, {})
	local var37 = useNativeScrollEnabled()
	local var38 = usePagerControllerModule({
		scrollingFrame = var29,
		store = store,
		itemHeight = var31,
		gap = gap,
		snapSensitivity = snapSensitivity,
		animationSpeed = animationSpeed,
		active = var26,
		nativeScrollEnabled = var37,
		analytics = analytics
	})
	local var39 = usePagerInputNavigationModule({
		active = var26,
		keyboardNavigation = keyboardNavigation,
		goNext = var38.next,
		goPrevious = var38.previous
	})
	local var40 = signalsReactModule.useSignalState(store.getCount)
	local var41 = signalsReactModule.useSignalState(store.getItems)
	local var42 = signalsReactModule.useSignalState(var38.getActiveIndex)
	reactModule.useEffect(function()
		-- upvalues: onEndReached (ref), var40 (ref), var42 (ref), endReachedThreshold (ref), var33 (ref), var41 (ref)
		if onEndReached == nil or var40 <= 0 then return end
		if var40 - endReachedThreshold <= var42 and var33.current ~= var41 then
			var33.current = var41
			onEndReached()
		end
	end, {
		var42,
		var40,
		var41,
		endReachedThreshold,
		onEndReached
	})
	reactModule.useEffect(function()
		-- upvalues: analytics (ref), var40 (ref), var41 (ref), var42 (ref), keyExtractor (ref), var34 (ref)
		local var50 = if analytics ~= nil then nil else analytics.onItemImpression
		
		if var50 == nil or var40 <= 0 then return end
		local var51 = var41[var42]
		
		if var51 == nil then return end
		local var52 = if keyExtractor ~= nil then tostring(var42) else keyExtractor(var51, var42)
		
		if var34.current[var52] then
			return
		end
		var34.current[var52] = true
		var50(var42, var51)
	end, {
		var42,
		var40,
		var41,
		analytics,
		keyExtractor
	})
	local var43 = reactModule.useMemo(function()
		-- upvalues: store (ref), var38 (ref), analytics (ref)
		return {
			store = store,
			getActiveIndex = var38.getActiveIndex,
			getScrollState = var38.getScrollState,
			scrollToIndex = var38.scrollToIndex,
			next = var38.next,
			previous = var38.previous,
			removeItem = var38.removeItem,
			analytics = analytics
		}
	end, { store, var38, analytics })
	local var44 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var44 (ref), initialIndex (ref), var40 (ref), store (ref)
		if var44.current then return end
		if initialIndex == nil then
			var44.current = true
			
			return
		elseif var40 < initialIndex then return end
		var44.current = true
		
		if initialIndex ~= store.getCurrentIndex(false) then
			store.goToItem(initialIndex)
		end
	end, {
		initialIndex,
		var40,
		store.getCurrentIndex,
		store.goToItem
	})
	reactModule.useImperativeHandle(p5.controllerRef, function()
		-- upvalues: var38 (ref)
		return var38
	end, { var38 })
	local var45 = var31 + gap
	local var46 = if var31 > 0 and var40 > 0 then (var40 - 1) * var45 + var31 else 0
	local t = {}
	
	if var31 > 0 and var40 > 0 then
		local visibleWindow = snapMathModule.getVisibleWindow(var42, overscan, var40)
		
		for i = visibleWindow.startIndex, visibleWindow.endIndex do
			local var49 = var41[i]
			
			if var49 ~= nil then
				table.insert(t, reactModule.createElement(var13, {
					key = if keyExtractor ~= nil then tostring(i) else keyExtractor(var49, i),
					index = i,
					item = var49,
					itemHeight = var31,
					stride = var45,
					getActiveIndex = var38.getActiveIndex,
					renderItem = renderItem
				}))
			end
		end
	end
	return reactModule.createElement(verticalPagerContext.Provider, { value = var43 }, {
		Container = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			SelectionGroup = true,
			Active = var26,
			AnchorPoint = p5.AnchorPoint,
			LayoutOrder = p5.LayoutOrder,
			Position = p5.Position,
			Selectable = var26,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			Size = p5.Size or UDim2.fromScale(1, 1),
			ZIndex = p5.ZIndex,
			ref = var39
		}, {
			Scroller = reactModule.createElement("ScrollingFrame", {
				AutomaticCanvasSize = Enum.AutomaticSize.None,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(1, 0, 0, var46),
				ClipsDescendants = true,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = var26 and (var40 > 1 and var37),
				Selectable = false,
				Size = UDim2.fromScale(1, 1),
				ref = var35,
				[reactModule.Change.AbsoluteSize] = var36
			}, t)
		})
	})
end