-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local console = luauPolyfillModule.console
local setTimeout = luauPolyfillModule.setTimeout
local httpService = game:GetService("HttpService")
local t = {
	Value = {
		new = function(...) --[[ line: 37 ]]
			return {
				setOffset = function(_, _) --[[ line: 40 ]] end,
				interpolate = function(_, ...) --[[ line: 43 ]] end
			}
		end
	},
	attachNativeEvent = function(...) --[[ line: 49 ]]
		return nil
	end
}
local t_1 = {
	get = function(...) --[[ line: 58 ]]
		return { height = 100 }
	end
}
local t_2 = nil
t_2 = {
	OS = "roblox",
	select = function(p0) --[[ line: 68 ]]
		-- upvalues: t_2 (write)
		return p0[t_2.OS]
	end
}
local reactModule = require(parent_1.React)
local t_3 = {
	findNodeHandle = function(...) --[[ line: 84 ]]
		return nil
	end
}
local scrollViewStickyHeaderModule = require(script.Parent.ScrollViewStickyHeader)
local styleSheetModule = require(parent.StyleSheet.StyleSheet)
local viewModule = require(script.Parent.Parent.View.View)
local t_4 = { measureLayout = function(...) --[[ line: 103 ]] end }
local t_5 = {
	addListener = function(...) --[[ line: 109 ]]
		return nil
	end
}
local t_6 = {
	beginScroll = function(...) --[[ line: 116 ]]
		warn("FrameRateLogger.beginScroll not implemented")
	end,
	endScroll = function(...) --[[ line: 119 ]]
		warn("FrameRateLogger.endScroll not implemented")
	end
}
local t_7 = {
	blurTextInput = function(...) --[[ line: 125 ]]
		warn("TextInputState.blurTextInput not implemented")
	end,
	currentlyFocusedInput = function(...) --[[ line: 128 ]]
		warn("TextInputState.currentlyFocusedInput not implemented")
		
		return nil
	end,
	isTextInput = function(...) --[[ line: 132 ]]
		warn("TextInputState.isTextInput not implemented")
		
		return nil
	end
}

local _ = function() --[[ line: 138 ]]
	warn("dismissKeyboard not implemented")
end

local _ = function(p1) --[[ line: 142 ]]
	return p1
end

local invariantModule = require(parent.jsUtils.invariant)
local processDecelerationRateModule = require(script.Parent.processDecelerationRate)

local _ = function(p2) --[[ line: 152 ]]
	return { outer = p2, inner = p2 }
end

local setAndForwardRefModule = require(script.Parent.Parent.Parent.Utilities.setAndForwardRef)
local scrollViewContextModule = require(script.Parent.ScrollViewContext)
local default = scrollViewContextModule.default
local HORIZONTAL = scrollViewContextModule.HORIZONTAL
local VERTICAL = scrollViewContextModule.VERTICAL
local _ = require(script.Parent.ScrollViewStickyHeader)
local default_1 = require(script.Parent.ScrollViewCommands).default
local scrollContentViewNativeComponentModule = require(script.Parent.ScrollContentViewNativeComponent)
local scrollViewNativeComponentModule = require(script.Parent.ScrollViewNativeComponent)
local var20 = nil
local _ = nil
local _ = nil
local var21 = if t_2.OS == "android" then {
	NativeHorizontalScrollViewTuple = { "Frame", "Frame" },
	NativeVerticalScrollViewTuple = { scrollViewNativeComponentModule, viewModule }
} else {
	NativeHorizontalScrollViewTuple = {
		scrollViewNativeComponentModule,
		scrollContentViewNativeComponentModule
	},
	NativeVerticalScrollViewTuple = {
		scrollViewNativeComponentModule,
		scrollContentViewNativeComponentModule
	}
}
local nativeHorizontalScrollViewTuple = var21.NativeHorizontalScrollViewTuple
local nativeVerticalScrollViewTuple = var21.NativeVerticalScrollViewTuple
local scrollView = reactModule.Component:extend("ScrollView")
scrollView.Context = default

function scrollView.init(p3, p4) --[[ line: 953 ]]
	-- upvalues: map (ref), reactModule (ref), setAndForwardRefModule (ref), t_3 (ref), default_1 (ref), boolean (ref), t_4 (ref), invariantModule (ref), t_2 (write), array (ref), object (ref), console (ref), t_1 (ref), setTimeout (ref), t_6 (ref), t_7 (ref), t (ref)
	p3.props = p4
	p3._scrollAnimatedValueAttachment = nil
	p3._stickyHeaderRefs = map.new()
	p3._headerLayoutYs = map.new()
	p3._keyboardWillOpenTo = nil
	p3._additionalScrollOffset = 0
	p3._isTouching = false
	p3._lastMomentumScrollBeginTime = 0
	p3._lastMomentumScrollEndTime = 0
	p3._observedScrollSinceBecomingResponder = false
	p3._becameResponderWhileAnimating = false
	p3._preventNegativeScrollOffset = nil
	p3._animated = nil
	p3._subscriptionKeyboardWillShow = nil
	p3._subscriptionKeyboardWillHide = nil
	p3._subscriptionKeyboardDidShow = nil
	p3._subscriptionKeyboardDidHide = nil
	p3.state = { layoutHeight = nil }
	p3._listLayoutRef = reactModule.createRef()
	p3._setNativeRef = setAndForwardRefModule({
		getForwardedRef = function() --[[ line: 986 ]]
			-- upvalues: p3 (ref)
			return p3.props.scrollViewRef
		end,
		setLocalRef = function(value) --[[ line: 989 ]]
			-- upvalues: p3 (ref)
			p3._scrollViewRef = value
			
			if value ~= nil then
				value.getScrollResponder = p3.getScrollResponder
				value.getScrollableNode = p3.getScrollableNode
				value.getInnerViewNode = p3.getInnerViewNode
				value.getInnerViewRef = p3.getInnerViewRef
				value.getNativeScrollRef = p3.getNativeScrollRef
				value.scrollTo = p3.scrollTo
				value.scrollToEnd = p3.scrollToEnd
				value.flashScrollIndicators = p3.flashScrollIndicators
				value.scrollResponderZoomTo = p3.scrollResponderZoomTo
				value.scrollResponderScrollNativeHandleToKeyboard = p3.scrollResponderScrollNativeHandleToKeyboard
			end
			return nil
		end
	})
	
	function p3.getScrollResponder() --[[ line: 1023 ]]
		-- upvalues: p3 (ref)
		return p3
	end
	
	function p3.getScrollableNode() --[[ line: 1028 ]]
		-- upvalues: t_3 (copy), p3 (ref)
		return t_3:findNodeHandle(p3._scrollViewRef)
	end
	
	function p3.getInnerViewNode() --[[ line: 1032 ]]
		-- upvalues: t_3 (copy), p3 (ref)
		return t_3:findNodeHandle(p3._innerViewRef)
	end
	
	function p3.getInnerViewRef() --[[ line: 1036 ]]
		-- upvalues: p3 (ref)
		return p3._innerViewRef
	end
	
	function p3.getNativeScrollRef() --[[ line: 1040 ]]
		-- upvalues: p3 (ref)
		return p3._scrollViewRef
	end
	
	function p3.scrollTo(p5) --[[ line: 1055 ]]
		-- upvalues: p3 (ref), default_1 (copy), boolean (copy)
		local x = nil
		local y = nil
		local animated = nil
		
		if p5 ~= nil then
			y = p5.y
			x = p5.x
			animated = p5.animated
		end
		if p3._scrollViewRef == nil or p3._scrollViewRef._nativeRef.current == nil then
			return
		end
		default_1.scrollTo(p3._scrollViewRef, if boolean.toJSBoolean(x) then x else 0, if boolean.toJSBoolean(y) then y else 0, not not animated)
	end
	
	function p3.scrollToEnd(p6) --[[ line: 1103 ]]
		-- upvalues: p3 (ref), default_1 (copy)
		local var24 = (p6 ~= nil and p6.animated) ~= false
		
		if p3._scrollViewRef == nil then
			return
		end
		default_1.scrollToEnd(p3._scrollViewRef, var24)
	end
	
	function p3.flashScrollIndicators() --[[ line: 1119 ]]
		-- upvalues: p3 (ref), default_1 (copy)
		if p3._scrollViewRef == nil then
			return
		end
		default_1.flashScrollIndicators(p3._scrollViewRef)
	end
	
	function p3.scrollResponderScrollNativeHandleToKeyboard(p7, p8, p9) --[[ line: 1136 ]]
		-- upvalues: p3 (ref), boolean (copy), t_4 (copy), t_3 (copy)
		p3._additionalScrollOffset = if boolean.toJSBoolean(p8) then p8 else 0
		p3._preventNegativeScrollOffset = boolean.toJSBoolean(p9)
		
		if p3._innerViewRef == nil then return end
		if typeof(p7) == "number" then
			t_4:measureLayout(p7, t_3:findNodeHandle(p3), p3._textInputFocusError, p3._inputMeasureAndScrollToKeyboard)
			
			return
		end
		p7:measureLayout(p3._innerViewRef, p3._inputMeasureAndScrollToKeyboard, p3._textInputFocusError)
	end
	
	function p3.scrollResponderZoomTo(p10, p11) --[[ line: 1172 ]]
		-- upvalues: invariantModule (copy), t_2 (copy), array (copy), object (copy), p3 (ref), console (copy), default_1 (copy)
		invariantModule(t_2.OS == "ios", "zoomToRect is not implemented")
		
		if array.indexOf(object.keys(p10), "animated") ~= -1 then
			p3._animated = p10.animated
			p10.animated = nil
		elseif typeof(p11) ~= "nil" then
			console.warn("`scrollResponderZoomTo` `animated` argument is deprecated. Use `options.animated` instead")
		end
		if p3._scrollViewRef == nil then
			return
		end
		default_1.zoomToRect(p3._scrollViewRef, p10, p11 ~= false)
	end
	
	function p3._inputMeasureAndScrollToKeyboard(_, p12, _, p13) --[[ line: 1206 ]]
		-- upvalues: t_1 (copy), p3 (ref), setTimeout (copy)
		local height = t_1:get("window").height
		
		local function scrollTextInputIntoVisibleRect() --[[ line: 1208 ]]
			-- upvalues: p3 (copy), height (write), p12 (ref), p13 (ref)
			if p3._keyboardWillOpenTo ~= nil then
				height = p3._keyboardWillOpenTo.endCoordinates.screenY
			end
			local var26 = p12 - height + p13 + p3._additionalScrollOffset
			
			if p3._preventNegativeScrollOffset == true then
				var26 = math.max(0, var26)
			end
			p3.scrollTo({ x = 0, animated = true, y = var26 })
			p3._additionalScrollOffset = 0
			p3._preventNegativeScrollOffset = false
		end
		
		if p3._keyboardWillOpenTo == nil then
			setTimeout(function() --[[ line: 1234 ]]
				-- upvalues: scrollTextInputIntoVisibleRect (ref)
				scrollTextInputIntoVisibleRect()
			end, 0)
		else
			scrollTextInputIntoVisibleRect()
		end
	end
	
	function p3._handleScroll(p14) --[[ line: 1242 ]]
		-- upvalues: p3 (ref), t_2 (copy), console (copy)
		if _G.__DEV__ and p3.props.onScroll and (p3.props.scrollEventThrottle == nil and t_2.OS == "ios") then
			console.log("You specified `onScroll` on a <ScrollView> but not `scrollEventThrottle`. You will only receive one event. Using `16` you get all the events but be aware that it may cause frame drops, use a bigger number if you don't need as much precision.")
		end
		p3._observedScrollSinceBecomingResponder = true
		
		if p3.props.onScroll then
			p3.props.onScroll(p14)
		end
	end
	
	function p3._handleLayout(p15) --[[ line: 1261 ]]
		-- upvalues: p3 (ref)
		if p3.props.invertStickyHeaders == true then
			p3:setState({ layoutHeight = p15.AbsoluteWindowSize.Y })
		end
		if p3.props.onLayout then
			p3.props.onLayout(p15)
		end
	end
	
	function p3._overrideAutomaticCanvasSize(p16, p17) --[[ line: 1275 ]]
		-- upvalues: p3 (ref)
		if p3._scrollViewRef == nil then return end
		local current = p3._scrollViewRef._nativeRef.current
		
		if current == nil then return end
		if p3.props.AutomaticCanvasSize == Enum.AutomaticSize.XY or p3.props.AutomaticCanvasSize == nil then
			current.CanvasSize = UDim2.new(0, p16, 0, p17)
			
			return
		elseif p3.props.AutomaticCanvasSize == Enum.AutomaticSize.X then
			current.CanvasSize = UDim2.new(0, p16, 0, current.AbsoluteCanvasSize.Y)
			
			return
		elseif p3.props.AutomaticCanvasSize == Enum.AutomaticSize.Y then
			current.CanvasSize = UDim2.new(0, current.AbsoluteCanvasSize.X, 0, p17)
		end
	end
	
	function p3._handleContentOnLayout(p18) --[[ line: 1294 ]]
		-- upvalues: p3 (ref)
		local x = p18.AbsoluteSize.X
		local y = p18.AbsoluteSize.Y
		
		if p3.props.overrideAutomaticCanvasSize then
			p3._overrideAutomaticCanvasSize(x, y)
		end
		if p3.props.onContentSizeChange then
			p3.props.onContentSizeChange(x, y)
		end
	end
	
	p3._scrollViewRef = nil
	p3._innerViewRef = nil
	p3._setInnerViewRef = setAndForwardRefModule({
		getForwardedRef = function() --[[ line: 1309 ]]
			-- upvalues: p3 (ref)
			return p3.props.innerViewRef
		end,
		setLocalRef = function(value) --[[ line: 1312 ]]
			-- upvalues: p3 (ref)
			p3._innerViewRef = value
			
			return nil
		end
	})
	
	function p3.scrollResponderKeyboardWillShow(p19) --[[ line: 1348 ]]
		-- upvalues: p3 (ref)
		p3._keyboardWillOpenTo = p19
		
		if p3.props.onKeyboardWillShow then
			p3.props.onKeyboardWillShow(p19)
		end
	end
	
	function p3.scrollResponderKeyboardWillHide(p20) --[[ line: 1355 ]]
		-- upvalues: p3 (ref)
		p3._keyboardWillOpenTo = nil
		
		if p3.props.onKeyboardWillHide then
			p3.props.onKeyboardWillHide(p20)
		end
	end
	
	function p3.scrollResponderKeyboardDidShow(p21) --[[ line: 1362 ]]
		-- upvalues: boolean (copy), p3 (ref)
		if boolean.toJSBoolean(p21) then
			p3._keyboardWillOpenTo = p21
		end
		if p3.props.onKeyboardDidShow then
			p3.props.onKeyboardDidShow(p21)
		end
	end
	
	function p3.scrollResponderKeyboardDidHide(p22) --[[ line: 1373 ]]
		-- upvalues: p3 (ref)
		p3._keyboardWillOpenTo = nil
		
		if p3.props.onKeyboardDidHide then
			p3.props.onKeyboardDidHide(p22)
		end
	end
	
	function p3._handleMomentumScrollBegin(p23) --[[ line: 1383 ]]
		-- upvalues: p3 (ref)
		p3._lastMomentumScrollBeginTime = os.clock() * 1000
		
		if p3.props.onMomentumScrollBegin then
			p3.props.onMomentumScrollBegin(p23)
		end
	end
	
	function p3._handleMomentumScrollEnd(p24) --[[ line: 1393 ]]
		-- upvalues: t_6 (copy), p3 (ref)
		t_6:endScroll()
		p3._lastMomentumScrollEndTime = os.clock() * 1000
		
		if p3.props.onMomentumScrollEnd then
			p3.props.onMomentumScrollEnd(p24)
		end
	end
	
	function p3._handleScrollBeginDrag(p25) --[[ line: 1408 ]]
		-- upvalues: t_6 (copy), t_2 (copy), p3 (ref)
		t_6:beginScroll()
		
		if t_2.OS == "android" and p3.props.keyboardDismissMode == "on-drag" then
			warn("dismissKeyboard not implemented")
		end
		if p3.props.onScrollBeginDrag then
			p3.props.onScrollBeginDrag(p25)
		end
	end
	
	function p3._handleScrollEndDrag(p26, p27) --[[ line: 1421 ]]
		-- upvalues: p3 (ref), boolean (copy), t_6 (copy)
		if not p3:_isAnimating() and (not boolean.toJSBoolean(nil) or (nil).x == 0 and (nil).y == 0) then
			t_6:endScroll()
		end
		if p3.props.onScrollEndDrag then
			p3.props.onScrollEndDrag(p26, p27)
		end
	end
	
	function p3._isAnimating() --[[ line: 1441 ]]
		-- upvalues: p3 (ref)
		return os.clock() * 1000 - p3._lastMomentumScrollEndTime < 16
	end
	
	function p3._handleResponderGrant(p28) --[[ line: 1451 ]]
		-- upvalues: p3 (ref)
		p3._observedScrollSinceBecomingResponder = false
		
		if p3.props.onResponderGrant then
			p3.props.onResponderGrant(p28)
		end
		p3._becameResponderWhileAnimating = p3:_isAnimating()
	end
	
	function p3._handleResponderReject() --[[ line: 1469 ]] end
	
	function p3._handleResponderRelease(p29) --[[ line: 1474 ]]
		-- upvalues: p3 (ref), console (copy), t_7 (copy)
		p3._isTouching = #p29.nativeEvent.touches ~= 0
		
		if p3.props.onResponderRelease then
			p3.props.onResponderRelease(p29)
		end
		if typeof(p29.target) == "number" then
			if _G.__DEV__ then
				console.error("Did not expect event target to be a number. Should have been a native component")
			end
			return
		else
			local var27 = t_7:currentlyFocusedInput()
			
			if p3.props.keyboardShouldPersistTaps ~= true and p3.props.keyboardShouldPersistTaps ~= "always" and (p3:_keyboardIsDismissible() and p29.target ~= var27) and (not p3._observedScrollSinceBecomingResponder and not p3._becameResponderWhileAnimating) then
				t_7:blurTextInput(var27)
			end
		end
	end
	
	function p3._handleResponderTerminationRequest() --[[ line: 1517 ]]
		-- upvalues: p3 (ref)
		return not p3._observedScrollSinceBecomingResponder
	end
	
	function p3._handleScrollShouldSetResponder() --[[ line: 1524 ]]
		-- upvalues: p3 (ref)
		return if p3.props.disableScrollViewPanResponder == true then false else p3._isTouching
	end
	
	function p3._handleStartShouldSetResponder(p30) --[[ line: 1557 ]]
		-- upvalues: p3 (ref), t_7 (copy)
		return if p3.props.disableScrollViewPanResponder == true then false else p3.props.keyboardShouldPersistTaps == "handled" and p3:_keyboardIsDismissible() and p30.target ~= t_7:currentlyFocusedInput()
	end
	
	function p3._handleStartShouldSetResponderCapture(p31) --[[ line: 1586 ]]
		-- upvalues: p3 (ref), boolean (copy), console (copy), t_7 (copy)
		if p3:_isAnimating() then
			return true
		elseif p3.props.disableScrollViewPanResponder == true then
			return false
		end
		local keyboardShouldPersistTaps = p3.props.keyboardShouldPersistTaps
		local var28 = not boolean.toJSBoolean(keyboardShouldPersistTaps) or keyboardShouldPersistTaps == "never"
		
		if typeof(p31.target) == "number" then
			if _G.__DEV__ then
				console.error("Did not expect event target to be a number. Should have been a native component")
			end
			return false
		else
			return var28 and p3:_keyboardIsDismissible() and (p31.target ~= nil and not boolean.toJSBoolean(t_7:isTextInput(p31.target)))
		end
	end
	
	function p3._keyboardIsDismissible() --[[ line: 1629 ]]
		-- upvalues: t_7 (copy), p3 (ref), t_2 (copy)
		local var29 = t_7:currentlyFocusedInput()
		
		return (var29 ~= nil and t_7:isTextInput(var29)) and (if p3._keyboardWillOpenTo == nil then t_2.OS == "android" else true)
	end
	
	function p3._handleTouchEnd(p32, p33) --[[ line: 1652 ]]
		-- upvalues: p3 (ref)
		p3._isTouching = false
		
		if p3.props.onTouchEnd then
			p3.props.onTouchEnd(p32, p33)
		end
	end
	
	function p3._handleTouchCancel(p34, p35) --[[ line: 1668 ]]
		-- upvalues: p3 (ref)
		p3._isTouching = false
		
		if p3.props.onTouchCancel then
			p3.props.onTouchCancel(p34, p35)
		end
	end
	
	function p3._handleTouchStart(p36, p37) --[[ line: 1687 ]]
		-- upvalues: p3 (ref)
		p3._isTouching = true
		
		if p3.props.onTouchStart then
			p3.props.onTouchStart(p36, p37)
		end
	end
	
	function p3._handleTouchMove(p38, p39) --[[ line: 1705 ]]
		-- upvalues: p3 (ref)
		if p3.props.onTouchMove then
			p3.props.onTouchMove(p38, p39)
		end
	end
	
	p3._scrollAnimatedValue = t.Value.new(if p3.props.contentOffset and boolean.toJSBoolean(p3.props.contentOffset.y) then p3.props.contentOffset.y else 0)
	p3._scrollAnimatedValue:setOffset(if p3.props.contentInset and boolean.toJSBoolean(p3.props.contentInset.top) then p3.props.contentInset.top else 0)
end

function scrollView.componentDidMount(p40) --[[ line: 1723 ]]
	-- upvalues: console (ref), boolean (ref), t_5 (ref)
	if typeof(p40.props.keyboardShouldPersistTaps) == "boolean" then
		console.warn(("'keyboardShouldPersistTaps={%s}' is deprecated. "):format(if p40.props.keyboardShouldPersistTaps == true then "true" else "false") .. ("Use 'keyboardShouldPersistTaps=\"%s\"' instead"):format(if boolean.toJSBoolean(p40.props.keyboardShouldPersistTaps) then "always" else "never"))
	end
	p40._keyboardWillOpenTo = nil
	p40._additionalScrollOffset = 0
	p40._subscriptionKeyboardWillShow = t_5:addListener("keyboardWillShow", p40.scrollResponderKeyboardWillShow)
	p40._subscriptionKeyboardWillHide = t_5:addListener("keyboardWillHide", p40.scrollResponderKeyboardWillHide)
	p40._subscriptionKeyboardDidShow = t_5:addListener("keyboardDidShow", p40.scrollResponderKeyboardDidShow)
	p40._subscriptionKeyboardDidHide = t_5:addListener("keyboardDidHide", p40.scrollResponderKeyboardDidHide)
	p40:_updateAnimatedNodeAttachment()
end

function scrollView.componentDidUpdate(p41, p42) --[[ line: 1745 ]]
	-- upvalues: boolean (ref)
	local var30 = if p41.props.contentInset then p41.props.contentInset.top else 0
	
	if (if p42.contentInset then p42.contentInset.top else 0) ~= var30 then
		p41._scrollAnimatedValue:setOffset(if boolean.toJSBoolean(var30) then var30 else 0)
	end
	p41:_updateAnimatedNodeAttachment()
end

function scrollView.componentWillUnmount(p43) --[[ line: 1755 ]]
	if p43._subscriptionKeyboardWillShow ~= nil then
		p43._subscriptionKeyboardWillShow:remove()
	end
	if p43._subscriptionKeyboardWillHide ~= nil then
		p43._subscriptionKeyboardWillHide:remove()
	end
	if p43._subscriptionKeyboardDidShow ~= nil then
		p43._subscriptionKeyboardDidShow:remove()
	end
	if p43._subscriptionKeyboardDidHide ~= nil then
		p43._subscriptionKeyboardDidHide:remove()
	end
	if p43._scrollAnimatedValueAttachment then
		p43._scrollAnimatedValueAttachment:detach()
	end
end

function scrollView._textInputFocusError() --[[ line: 1774 ]]
	-- upvalues: console (ref)
	console.warn("Error measuring text field.")
end

function scrollView._getKeyForIndex(p44, p45) --[[ line: 1778 ]]
	local var31 = p45[p44]
	
	return var31 and var31.key
end

function scrollView._updateAnimatedNodeAttachment(p46) --[[ line: 1783 ]]
	-- upvalues: t (ref)
	if p46._scrollAnimatedValueAttachment then
		p46._scrollAnimatedValueAttachment:detach()
	end
	if p46.props.stickyHeaderIndices and #p46.props.stickyHeaderIndices > 0 then
		p46._scrollAnimatedValueAttachment = t:attachNativeEvent(p46._scrollViewRef, "onScroll", {
			{
				nativeEvent = { contentOffset = { y = p46._scrollAnimatedValue } }
			}
		})
	end
end

function scrollView._setStickyHeaderRef(value, p47, p48) --[[ line: 1796 ]]
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(p48) then
		value._stickyHeaderRefs:set(p47, p48)
		
		return
	end
	value._stickyHeaderRefs:delete(p47)
end

function scrollView._onStickyHeaderLayout(p49, p50, p51, p52) --[[ line: 1804 ]]
	-- upvalues: reactModule (ref), array (ref), boolean (ref)
	local stickyHeaderIndices = p49.props.stickyHeaderIndices
	
	if not stickyHeaderIndices then return end
	local var32 = reactModule.Children.toArray(p49.props.children)
	
	if p52 ~= p49._getKeyForIndex(p50, var32) then return end
	local y = p51.nativeEvent.layout.y
	p49._headerLayoutYs:set(p52, y)
	local var33 = stickyHeaderIndices[array.indexOf(stickyHeaderIndices, p50) - 1]
	
	if var33 ~= nil then
		local var34 = p49._stickyHeaderRefs:get(p49._getKeyForIndex(var33, var32))
		
		if boolean.toJSBoolean(var34) and var34.setNextHeaderY then
			var34:setNextHeaderY(y)
		end
	end
end

function scrollView.render(p53) --[[ line: 1827 ]]
	-- upvalues: nativeHorizontalScrollViewTuple (write), nativeVerticalScrollViewTuple (write), array (ref), invariantModule (ref), httpService (ref), reactModule (ref), boolean (ref), scrollViewStickyHeaderModule (ref), default (ref), HORIZONTAL (ref), VERTICAL (ref), object (ref), t_2 (write), var20 (write), styleSheetModule (ref), processDecelerationRateModule (ref)
	local unpacked, unpacked_1 = table.unpack(if p53.props.horizontal == true then nativeHorizontalScrollViewTuple else nativeVerticalScrollViewTuple, 1, 2)
	local contentContainerStyle = p53.props.contentContainerStyle
	
	if _G.__DEV__ and p53.props.style ~= nil then
		local style = p53.props.style
		local var37 = array.filter({ "alignItems", "justifyContent" }, function(p54) --[[ line: 1839 ]]
			-- upvalues: style (ref)
			return type(style) == "table" and style[p54] ~= nil
		end)
		invariantModule(#var37 == 0, "ScrollView child layout (" .. httpService:JSONEncode(var37) .. ") must be applied through the contentContainerStyle prop.")
	end
	local var38 = if p53.props.onContentSizeChange == nil then nil else { onLayout = p53._handleContentOnLayout }
	local stickyHeaderIndices = p53.props.stickyHeaderIndices
	local children = p53.props.children
	
	if stickyHeaderIndices ~= nil and #stickyHeaderIndices > 0 then
		local var39 = reactModule.Children.toArray(p53.props.children)
		children = array.map(var39, function(p55, p56) --[[ line: 1863 ]]
			-- upvalues: boolean (copy), array (copy), stickyHeaderIndices (ref), p53 (ref), scrollViewStickyHeaderModule (copy), reactModule (copy), var39 (ref)
			local var46 = if boolean.toJSBoolean(p55) then array.indexOf(stickyHeaderIndices, p56) else -1
			
			if var46 > -1 then
				local key = p55.key
				
				return reactModule.createElement(if p53.props.StickyHeaderComponent then p53.props.StickyHeaderComponent else scrollViewStickyHeaderModule, {
					Name = "StickyHeaderComponent",
					key = key,
					nativeID = "StickyHeader-" .. tostring(key),
					ref = function(p57) --[[ line: 1875 ]]
						-- upvalues: p53 (copy), key (ref)
						return p53:_setStickyHeaderRef(key, p57)
					end,
					nextHeaderLayoutY = p53._headerLayoutYs:get(p53._getKeyForIndex(stickyHeaderIndices[var46 + 1], var39)),
					onLayout = function(p58) --[[ line: 1879 ]]
						-- upvalues: p53 (copy), p56 (ref), key (ref)
						return p53:_onStickyHeaderLayout(p56, p58, key)
					end,
					scrollAnimatedValue = p53._scrollAnimatedValue,
					inverted = p53.props.invertStickyHeaders,
					hiddenOnScroll = p53.props.stickyHeaderHiddenOnScroll,
					scrollViewHeight = p53.state.layoutHeight
				}, p55)
			end
			return p55
		end)
	end
	local var40 = reactModule.createElement(default.Provider, {
		value = if p53.props.horizontal == true then HORIZONTAL else VERTICAL
	}, reactModule.createElement("UIListLayout", {
		key = "layout",
		ref = p53._listLayoutRef,
		Name = if p53.props.horizontal then "HorizontalLayout" else "VerticalLayout",
		FillDirection = if p53.props.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
		VerticalAlignment = if p53.props.horizontal then Enum.VerticalAlignment.Center elseif p53.props.layoutStyle then p53.props.layoutStyle.VerticalAlignment else Enum.VerticalAlignment.Top,
		HorizontalAlignment = if p53.props.horizontal then if p53.props.layoutStyle then p53.props.layoutStyle.HorizontalAlignment else Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	}), children)
	local var41 = array.isArray(stickyHeaderIndices) and #stickyHeaderIndices > 0
	local createElement = reactModule.createElement
	createElement = createElement(unpacked_1, object.assign({}, var38, { ref = p53._setInnerViewRef }, {
		collapsable = false,
		style = contentContainerStyle,
		Size = if p53.props.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p53.props.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
		removeClippedSubviews = if t_2.OS == "android" and var41 then false else p53.props.removeClippedSubviews
	}), var40)
	local var42 = if p53.props.alwaysBounceHorizontal ~= nil then p53.props.horizontal else p53.props.alwaysBounceHorizontal
	local var43 = if p53.props.alwaysBounceVertical ~= nil then not p53.props.horizontal else p53.props.alwaysBounceVertical
	local var44 = if p53.props.horizontal == true then var20.baseHorizontal else var20.baseVertical
	local assign = object.assign
	assign = assign(table.clone(p53.props), {
		alwaysBounceHorizontal = var42,
		alwaysBounceVertical = var43,
		style = styleSheetModule.compose(var44, p53.props.style),
		onContentSizeChange = object.None,
		onLayout = p53._handleLayout,
		onMomentumScrollBegin = p53._handleMomentumScrollBegin,
		onMomentumScrollEnd = p53._handleMomentumScrollEnd,
		onResponderGrant = p53._handleResponderGrant,
		onResponderReject = p53._handleResponderReject,
		onResponderRelease = p53._handleResponderRelease,
		onResponderTerminationRequest = p53._handleResponderTerminationRequest,
		onScrollBeginDrag = p53._handleScrollBeginDrag,
		onScrollEndDrag = p53._handleScrollEndDrag,
		onScrollShouldSetResponder = p53._handleScrollShouldSetResponder,
		onStartShouldSetResponder = p53._handleStartShouldSetResponder,
		onStartShouldSetResponderCapture = p53._handleStartShouldSetResponderCapture,
		onTouchEnd = p53._handleTouchEnd,
		onTouchMove = p53._handleTouchMove,
		onTouchStart = p53._handleTouchStart,
		onTouchCancel = p53._handleTouchCancel,
		onScroll = p53._handleScroll,
		scrollEventThrottle = if var41 then 1 else p53.props.scrollEventThrottle,
		sendMomentumEvents = if p53.props.onMomentumScrollBegin or p53.props.onMomentumScrollEnd then true else false,
		snapToStart = p53.props.snapToStart ~= false,
		snapToEnd = p53.props.snapToEnd ~= false,
		pagingEnabled = t_2.select({
			ios = p53.props.pagingEnabled == true and (p53.props.snapToInterval == nil and p53.props.snapToOffsets == nil),
			android = if p53.props.pagingEnabled ~= true then if p53.props.snapToInterval == nil then p53.props.snapToOffsets ~= nil else true else true
		}),
		AutomaticCanvasSize = if p53.props.overrideAutomaticCanvasSize then Enum.AutomaticSize.None else nil
	})
	local decelerationRate = p53.props.decelerationRate
	
	if decelerationRate ~= nil then
		assign.decelerationRate = processDecelerationRateModule(decelerationRate)
	end
	local refreshControl = p53.props.refreshControl
	
	if boolean.toJSBoolean(refreshControl) then
		if t_2.OS == "ios" or t_2.OS == "roblox" then
			return reactModule.createElement(unpacked, object.assign(table.clone(assign), { ref = p53._setNativeRef }), refreshControl, createElement)
		elseif t_2.OS == "android" then
			local _ = nil
			local _ = nil
			local style = assign.style
			local t = { outer = style, inner = style }
			
			return reactModule.cloneElement(refreshControl, object.assign({ style = styleSheetModule.compose(var44, t.outer) }), reactModule.createElement(unpacked, object.assign({}, assign, {
				style = styleSheetModule.compose(var44, t.inner),
				ref = p53._setNativeRef
			}), createElement))
		end
	end
	assign.ref = p53._setNativeRef
	
	return reactModule.createElement(unpacked, assign, createElement)
end

var20 = styleSheetModule.create({
	baseVertical = { ScrollingDirection = Enum.ScrollingDirection.Y },
	baseHorizontal = { ScrollingDirection = Enum.ScrollingDirection.X }
})
local var23 = reactModule.forwardRef(function(p59, p60) --[[ line: 2058 | named "Wrapper" ]]
	-- upvalues: reactModule (ref), scrollView (ref), object (ref)
	return reactModule.createElement(scrollView, object.assign(table.clone(p59), { scrollViewRef = p60 }))
end)
var23.Context = default
var23.displayName = "ScrollView"

return var23