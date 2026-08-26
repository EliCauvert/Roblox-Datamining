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
		new = function(...)
			return {
				setOffset = function(_, _) end,
				interpolate = function(_, ...) end
			}
		end
	},
	attachNativeEvent = function(...)
		return nil
	end
}
local t_1 = {
	get = function(...)
		return { height = 100 }
	end
}
local t_2 = nil
t_2 = {
	OS = "roblox",
	select = function(p1)
		-- upvalues: t_2 (write)
		return p1[t_2.OS]
	end
}
local reactModule = require(parent_1.React)
local t_3 = {
	findNodeHandle = function(...)
		return nil
	end
}
local scrollViewStickyHeaderModule = require(script.Parent.ScrollViewStickyHeader)
local styleSheetModule = require(parent.StyleSheet.StyleSheet)
local viewModule = require(script.Parent.Parent.View.View)
local t_4 = { measureLayout = function(...) end }
local t_5 = {
	addListener = function(...)
		return nil
	end
}
local t_6 = {
	beginScroll = function(...)
		warn("FrameRateLogger.beginScroll not implemented")
	end,
	endScroll = function(...)
		warn("FrameRateLogger.endScroll not implemented")
	end
}
local t_7 = {
	blurTextInput = function(...)
		warn("TextInputState.blurTextInput not implemented")
	end,
	currentlyFocusedInput = function(...)
		warn("TextInputState.currentlyFocusedInput not implemented")
		
		return nil
	end,
	isTextInput = function(...)
		warn("TextInputState.isTextInput not implemented")
		
		return nil
	end
}

local _ = function()
	warn("dismissKeyboard not implemented")
end

local _ = function(p1)
	return p1
end

local invariantModule = require(parent.jsUtils.invariant)
local processDecelerationRateModule = require(script.Parent.processDecelerationRate)

local _ = function(p1)
	return { outer = p1, inner = p1 }
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
local var1 = nil
local _ = nil
local _ = nil
local var2 = if t_2.OS == "android" then {
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
local nativeHorizontalScrollViewTuple = var2.NativeHorizontalScrollViewTuple
local nativeVerticalScrollViewTuple = var2.NativeVerticalScrollViewTuple
local scrollView = reactModule.Component:extend("ScrollView")
scrollView.Context = default

function scrollView.init(p1, p2)
	-- upvalues: map (ref), reactModule (ref), setAndForwardRefModule (ref), t_3 (ref), default_1 (ref), boolean (ref), t_4 (ref), invariantModule (ref), t_2 (write), array (ref), object (ref), console (ref), t_1 (ref), setTimeout (ref), t_6 (ref), t_7 (ref), t (ref)
	p1.props = p2
	p1._scrollAnimatedValueAttachment = nil
	p1._stickyHeaderRefs = map.new()
	p1._headerLayoutYs = map.new()
	p1._keyboardWillOpenTo = nil
	p1._additionalScrollOffset = 0
	p1._isTouching = false
	p1._lastMomentumScrollBeginTime = 0
	p1._lastMomentumScrollEndTime = 0
	p1._observedScrollSinceBecomingResponder = false
	p1._becameResponderWhileAnimating = false
	p1._preventNegativeScrollOffset = nil
	p1._animated = nil
	p1._subscriptionKeyboardWillShow = nil
	p1._subscriptionKeyboardWillHide = nil
	p1._subscriptionKeyboardDidShow = nil
	p1._subscriptionKeyboardDidHide = nil
	p1.state = { layoutHeight = nil }
	p1._listLayoutRef = reactModule.createRef()
	p1._setNativeRef = setAndForwardRefModule({
		getForwardedRef = function()
			-- upvalues: p1 (ref)
			return p1.props.scrollViewRef
		end,
		setLocalRef = function(value)
			-- upvalues: p1 (ref)
			p1._scrollViewRef = value
			
			if value ~= nil then
				value.getScrollResponder = p1.getScrollResponder
				value.getScrollableNode = p1.getScrollableNode
				value.getInnerViewNode = p1.getInnerViewNode
				value.getInnerViewRef = p1.getInnerViewRef
				value.getNativeScrollRef = p1.getNativeScrollRef
				value.scrollTo = p1.scrollTo
				value.scrollToEnd = p1.scrollToEnd
				value.flashScrollIndicators = p1.flashScrollIndicators
				value.scrollResponderZoomTo = p1.scrollResponderZoomTo
				value.scrollResponderScrollNativeHandleToKeyboard = p1.scrollResponderScrollNativeHandleToKeyboard
			end
			return nil
		end
	})
	
	function p3.getScrollResponder()
		-- upvalues: p1 (ref)
		return p1
	end
	
	function p3.getScrollableNode()
		-- upvalues: t_3 (copy), p1 (ref)
		return t_3:findNodeHandle(p1._scrollViewRef)
	end
	
	function p3.getInnerViewNode()
		-- upvalues: t_3 (copy), p1 (ref)
		return t_3:findNodeHandle(p1._innerViewRef)
	end
	
	function p3.getInnerViewRef()
		-- upvalues: p1 (ref)
		return p1._innerViewRef
	end
	
	function p3.getNativeScrollRef()
		-- upvalues: p1 (ref)
		return p1._scrollViewRef
	end
	
	function p3.scrollTo(p3)
		-- upvalues: p1 (ref), default_1 (copy), boolean (copy)
		local x = nil
		local y = nil
		local animated = nil
		
		if p3 ~= nil then
			y = p3.y
			x = p3.x
			animated = p3.animated
		end
		if p1._scrollViewRef == nil or p1._scrollViewRef._nativeRef.current == nil then
			return
		end
		default_1.scrollTo(p1._scrollViewRef, if boolean.toJSBoolean(x) then x else 0, if boolean.toJSBoolean(y) then y else 0, not not animated)
	end
	
	function p3.scrollToEnd(p3)
		-- upvalues: p1 (ref), default_1 (copy)
		local var3 = (p3 ~= nil and p3.animated) ~= false
		
		if p1._scrollViewRef == nil then
			return
		end
		default_1.scrollToEnd(p1._scrollViewRef, var3)
	end
	
	function p3.flashScrollIndicators()
		-- upvalues: p1 (ref), default_1 (copy)
		if p1._scrollViewRef == nil then
			return
		end
		default_1.flashScrollIndicators(p1._scrollViewRef)
	end
	
	function p3.scrollResponderScrollNativeHandleToKeyboard(p3, p4, p5)
		-- upvalues: p1 (ref), boolean (copy), t_4 (copy), t_3 (copy)
		p1._additionalScrollOffset = if boolean.toJSBoolean(p4) then p4 else 0
		p1._preventNegativeScrollOffset = boolean.toJSBoolean(p5)
		
		if p1._innerViewRef == nil then return end
		if typeof(p3) == "number" then
			t_4:measureLayout(p3, t_3:findNodeHandle(p1), p1._textInputFocusError, p1._inputMeasureAndScrollToKeyboard)
			
			return
		end
		p3:measureLayout(p1._innerViewRef, p1._inputMeasureAndScrollToKeyboard, p1._textInputFocusError)
	end
	
	function p3.scrollResponderZoomTo(p3, p4)
		-- upvalues: invariantModule (copy), t_2 (copy), array (copy), object (copy), p1 (ref), console (copy), default_1 (copy)
		invariantModule(t_2.OS == "ios", "zoomToRect is not implemented")
		
		if array.indexOf(object.keys(p3), "animated") ~= -1 then
			p1._animated = p3.animated
			p3.animated = nil
		elseif typeof(p4) ~= "nil" then
			console.warn("`scrollResponderZoomTo` `animated` argument is deprecated. Use `options.animated` instead")
		end
		if p1._scrollViewRef == nil then
			return
		end
		default_1.zoomToRect(p1._scrollViewRef, p3, p4 ~= false)
	end
	
	function p3._inputMeasureAndScrollToKeyboard(_, p3, _, p4)
		-- upvalues: t_1 (copy), p1 (ref), setTimeout (copy)
		local height = t_1:get("window").height
		
		local function scrollTextInputIntoVisibleRect()
			-- upvalues: p1 (copy), height (write), p3 (ref), p4 (ref)
			if p1._keyboardWillOpenTo ~= nil then
				height = p1._keyboardWillOpenTo.endCoordinates.screenY
			end
			local var3 = p3 - height + p4 + p1._additionalScrollOffset
			
			if p1._preventNegativeScrollOffset == true then
				var3 = math.max(0, var3)
			end
			p1.scrollTo({ x = 0, animated = true, y = var3 })
			p1._additionalScrollOffset = 0
			p1._preventNegativeScrollOffset = false
		end
		
		if p1._keyboardWillOpenTo == nil then
			setTimeout(function()
				-- upvalues: scrollTextInputIntoVisibleRect (ref)
				scrollTextInputIntoVisibleRect()
			end, 0)
		else
			scrollTextInputIntoVisibleRect()
		end
	end
	
	function p3._handleScroll(p3)
		-- upvalues: p1 (ref), t_2 (copy), console (copy)
		if _G.__DEV__ and p1.props.onScroll and (p1.props.scrollEventThrottle == nil and t_2.OS == "ios") then
			console.log("You specified `onScroll` on a <ScrollView> but not `scrollEventThrottle`. You will only receive one event. Using `16` you get all the events but be aware that it may cause frame drops, use a bigger number if you don't need as much precision.")
		end
		p1._observedScrollSinceBecomingResponder = true
		
		if p1.props.onScroll then
			p1.props.onScroll(p3)
		end
	end
	
	function p3._handleLayout(p3)
		-- upvalues: p1 (ref)
		if p1.props.invertStickyHeaders == true then
			p1:setState({ layoutHeight = p3.AbsoluteWindowSize.Y })
		end
		if p1.props.onLayout then
			p1.props.onLayout(p3)
		end
	end
	
	function p3._overrideAutomaticCanvasSize(p3, p4)
		-- upvalues: p1 (ref)
		if p1._scrollViewRef == nil then return end
		local current = p1._scrollViewRef._nativeRef.current
		
		if current == nil then return end
		if p1.props.AutomaticCanvasSize == Enum.AutomaticSize.XY or p1.props.AutomaticCanvasSize == nil then
			current.CanvasSize = UDim2.new(0, p3, 0, p4)
			
			return
		elseif p1.props.AutomaticCanvasSize == Enum.AutomaticSize.X then
			current.CanvasSize = UDim2.new(0, p3, 0, current.AbsoluteCanvasSize.Y)
			
			return
		elseif p1.props.AutomaticCanvasSize == Enum.AutomaticSize.Y then
			current.CanvasSize = UDim2.new(0, current.AbsoluteCanvasSize.X, 0, p4)
		end
	end
	
	function p3._handleContentOnLayout(p3)
		-- upvalues: p1 (ref)
		local x = p3.AbsoluteSize.X
		local y = p3.AbsoluteSize.Y
		
		if p1.props.overrideAutomaticCanvasSize then
			p1._overrideAutomaticCanvasSize(x, y)
		end
		if p1.props.onContentSizeChange then
			p1.props.onContentSizeChange(x, y)
		end
	end
	
	p1._scrollViewRef = nil
	p1._innerViewRef = nil
	p1._setInnerViewRef = setAndForwardRefModule({
		getForwardedRef = function()
			-- upvalues: p1 (ref)
			return p1.props.innerViewRef
		end,
		setLocalRef = function(value)
			-- upvalues: p1 (ref)
			p1._innerViewRef = value
			
			return nil
		end
	})
	
	function p3.scrollResponderKeyboardWillShow(p3)
		-- upvalues: p1 (ref)
		p1._keyboardWillOpenTo = p3
		
		if p1.props.onKeyboardWillShow then
			p1.props.onKeyboardWillShow(p3)
		end
	end
	
	function p3.scrollResponderKeyboardWillHide(p3)
		-- upvalues: p1 (ref)
		p1._keyboardWillOpenTo = nil
		
		if p1.props.onKeyboardWillHide then
			p1.props.onKeyboardWillHide(p3)
		end
	end
	
	function p3.scrollResponderKeyboardDidShow(p3)
		-- upvalues: boolean (copy), p1 (ref)
		if boolean.toJSBoolean(p3) then
			p1._keyboardWillOpenTo = p3
		end
		if p1.props.onKeyboardDidShow then
			p1.props.onKeyboardDidShow(p3)
		end
	end
	
	function p3.scrollResponderKeyboardDidHide(p3)
		-- upvalues: p1 (ref)
		p1._keyboardWillOpenTo = nil
		
		if p1.props.onKeyboardDidHide then
			p1.props.onKeyboardDidHide(p3)
		end
	end
	
	function p3._handleMomentumScrollBegin(p3)
		-- upvalues: p1 (ref)
		p1._lastMomentumScrollBeginTime = os.clock() * 1000
		
		if p1.props.onMomentumScrollBegin then
			p1.props.onMomentumScrollBegin(p3)
		end
	end
	
	function p3._handleMomentumScrollEnd(p3)
		-- upvalues: t_6 (copy), p1 (ref)
		t_6:endScroll()
		p1._lastMomentumScrollEndTime = os.clock() * 1000
		
		if p1.props.onMomentumScrollEnd then
			p1.props.onMomentumScrollEnd(p3)
		end
	end
	
	function p3._handleScrollBeginDrag(p3)
		-- upvalues: t_6 (copy), t_2 (copy), p1 (ref)
		t_6:beginScroll()
		
		if t_2.OS == "android" and p1.props.keyboardDismissMode == "on-drag" then
			warn("dismissKeyboard not implemented")
		end
		if p1.props.onScrollBeginDrag then
			p1.props.onScrollBeginDrag(p3)
		end
	end
	
	function p3._handleScrollEndDrag(p3, p4)
		-- upvalues: p1 (ref), boolean (copy), t_6 (copy)
		if not p1:_isAnimating() and (not boolean.toJSBoolean(nil) or (nil).x == 0 and (nil).y == 0) then
			t_6:endScroll()
		end
		if p1.props.onScrollEndDrag then
			p1.props.onScrollEndDrag(p3, p4)
		end
	end
	
	function p3._isAnimating()
		-- upvalues: p1 (ref)
		return os.clock() * 1000 - p1._lastMomentumScrollEndTime < 16
	end
	
	function p3._handleResponderGrant(p3)
		-- upvalues: p1 (ref)
		p1._observedScrollSinceBecomingResponder = false
		
		if p1.props.onResponderGrant then
			p1.props.onResponderGrant(p3)
		end
		p1._becameResponderWhileAnimating = p1:_isAnimating()
	end
	
	function p3._handleResponderReject() end
	
	function p3._handleResponderRelease(p3)
		-- upvalues: p1 (ref), console (copy), t_7 (copy)
		p1._isTouching = #p3.nativeEvent.touches ~= 0
		
		if p1.props.onResponderRelease then
			p1.props.onResponderRelease(p3)
		end
		if typeof(p3.target) == "number" then
			if _G.__DEV__ then
				console.error("Did not expect event target to be a number. Should have been a native component")
			end
			return
		else
			local var3 = t_7:currentlyFocusedInput()
			
			if p1.props.keyboardShouldPersistTaps ~= true and p1.props.keyboardShouldPersistTaps ~= "always" and (p1:_keyboardIsDismissible() and p3.target ~= var3) and (not p1._observedScrollSinceBecomingResponder and not p1._becameResponderWhileAnimating) then
				t_7:blurTextInput(var3)
			end
		end
	end
	
	function p3._handleResponderTerminationRequest()
		-- upvalues: p1 (ref)
		return not p1._observedScrollSinceBecomingResponder
	end
	
	function p3._handleScrollShouldSetResponder()
		-- upvalues: p1 (ref)
		return if p1.props.disableScrollViewPanResponder == true then false else p1._isTouching
	end
	
	function p3._handleStartShouldSetResponder(p3)
		-- upvalues: p1 (ref), t_7 (copy)
		return if p1.props.disableScrollViewPanResponder == true then false else p1.props.keyboardShouldPersistTaps == "handled" and p1:_keyboardIsDismissible() and p3.target ~= t_7:currentlyFocusedInput()
	end
	
	function p3._handleStartShouldSetResponderCapture(p3)
		-- upvalues: p1 (ref), boolean (copy), console (copy), t_7 (copy)
		if p1:_isAnimating() then
			return true
		elseif p1.props.disableScrollViewPanResponder == true then
			return false
		end
		local keyboardShouldPersistTaps = p1.props.keyboardShouldPersistTaps
		local var3 = not boolean.toJSBoolean(keyboardShouldPersistTaps) or keyboardShouldPersistTaps == "never"
		
		if typeof(p3.target) == "number" then
			if _G.__DEV__ then
				console.error("Did not expect event target to be a number. Should have been a native component")
			end
			return false
		else
			return var3 and p1:_keyboardIsDismissible() and (p3.target ~= nil and not boolean.toJSBoolean(t_7:isTextInput(p3.target)))
		end
	end
	
	function p3._keyboardIsDismissible()
		-- upvalues: t_7 (copy), p1 (ref), t_2 (copy)
		local var3 = t_7:currentlyFocusedInput()
		
		return (var3 ~= nil and t_7:isTextInput(var3)) and (if p1._keyboardWillOpenTo == nil then t_2.OS == "android" else true)
	end
	
	function p3._handleTouchEnd(p3, p4)
		-- upvalues: p1 (ref)
		p1._isTouching = false
		
		if p1.props.onTouchEnd then
			p1.props.onTouchEnd(p3, p4)
		end
	end
	
	function p3._handleTouchCancel(p3, p4)
		-- upvalues: p1 (ref)
		p1._isTouching = false
		
		if p1.props.onTouchCancel then
			p1.props.onTouchCancel(p3, p4)
		end
	end
	
	function p3._handleTouchStart(p3, p4)
		-- upvalues: p1 (ref)
		p1._isTouching = true
		
		if p1.props.onTouchStart then
			p1.props.onTouchStart(p3, p4)
		end
	end
	
	function p3._handleTouchMove(p3, p4)
		-- upvalues: p1 (ref)
		if p1.props.onTouchMove then
			p1.props.onTouchMove(p3, p4)
		end
	end
	
	p1._scrollAnimatedValue = t.Value.new(if p1.props.contentOffset and boolean.toJSBoolean(p1.props.contentOffset.y) then p1.props.contentOffset.y else 0)
	p1._scrollAnimatedValue:setOffset(if p1.props.contentInset and boolean.toJSBoolean(p1.props.contentInset.top) then p1.props.contentInset.top else 0)
end

function scrollView.componentDidMount(p1)
	-- upvalues: console (ref), boolean (ref), t_5 (ref)
	if typeof(p1.props.keyboardShouldPersistTaps) == "boolean" then
		console.warn(("'keyboardShouldPersistTaps={%s}' is deprecated. "):format(if p1.props.keyboardShouldPersistTaps == true then "true" else "false") .. ("Use 'keyboardShouldPersistTaps=\"%s\"' instead"):format(if boolean.toJSBoolean(p1.props.keyboardShouldPersistTaps) then "always" else "never"))
	end
	p1._keyboardWillOpenTo = nil
	p1._additionalScrollOffset = 0
	p1._subscriptionKeyboardWillShow = t_5:addListener("keyboardWillShow", p1.scrollResponderKeyboardWillShow)
	p1._subscriptionKeyboardWillHide = t_5:addListener("keyboardWillHide", p1.scrollResponderKeyboardWillHide)
	p1._subscriptionKeyboardDidShow = t_5:addListener("keyboardDidShow", p1.scrollResponderKeyboardDidShow)
	p1._subscriptionKeyboardDidHide = t_5:addListener("keyboardDidHide", p1.scrollResponderKeyboardDidHide)
	p1:_updateAnimatedNodeAttachment()
end

function scrollView.componentDidUpdate(p1, p2)
	-- upvalues: boolean (ref)
	local var3 = if p1.props.contentInset then p1.props.contentInset.top else 0
	
	if (if p2.contentInset then p2.contentInset.top else 0) ~= var3 then
		p1._scrollAnimatedValue:setOffset(if boolean.toJSBoolean(var3) then var3 else 0)
	end
	p1:_updateAnimatedNodeAttachment()
end

function scrollView.componentWillUnmount(p1)
	if p1._subscriptionKeyboardWillShow ~= nil then
		p1._subscriptionKeyboardWillShow:remove()
	end
	if p1._subscriptionKeyboardWillHide ~= nil then
		p1._subscriptionKeyboardWillHide:remove()
	end
	if p1._subscriptionKeyboardDidShow ~= nil then
		p1._subscriptionKeyboardDidShow:remove()
	end
	if p1._subscriptionKeyboardDidHide ~= nil then
		p1._subscriptionKeyboardDidHide:remove()
	end
	if p1._scrollAnimatedValueAttachment then
		p1._scrollAnimatedValueAttachment:detach()
	end
end

function scrollView._textInputFocusError()
	-- upvalues: console (ref)
	console.warn("Error measuring text field.")
end

function scrollView._getKeyForIndex(p1, p2)
	local var3 = p2[p1]
	
	return var3 and var3.key
end

function scrollView._updateAnimatedNodeAttachment(p1)
	-- upvalues: t (ref)
	if p1._scrollAnimatedValueAttachment then
		p1._scrollAnimatedValueAttachment:detach()
	end
	if p1.props.stickyHeaderIndices and #p1.props.stickyHeaderIndices > 0 then
		p1._scrollAnimatedValueAttachment = t:attachNativeEvent(p1._scrollViewRef, "onScroll", {
			{
				nativeEvent = { contentOffset = { y = p1._scrollAnimatedValue } }
			}
		})
	end
end

function scrollView._setStickyHeaderRef(value, p1, p2)
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(p2) then
		value._stickyHeaderRefs:set(p1, p2)
		
		return
	end
	value._stickyHeaderRefs:delete(p1)
end

function scrollView._onStickyHeaderLayout(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), array (ref), boolean (ref)
	local stickyHeaderIndices = p1.props.stickyHeaderIndices
	
	if not stickyHeaderIndices then return end
	local var3 = reactModule.Children.toArray(p1.props.children)
	
	if p4 ~= p1._getKeyForIndex(p2, var3) then return end
	local y = p3.nativeEvent.layout.y
	p1._headerLayoutYs:set(p4, y)
	local var4 = stickyHeaderIndices[array.indexOf(stickyHeaderIndices, p2) - 1]
	
	if var4 ~= nil then
		local var5 = p1._stickyHeaderRefs:get(p1._getKeyForIndex(var4, var3))
		
		if boolean.toJSBoolean(var5) and var5.setNextHeaderY then
			var5:setNextHeaderY(y)
		end
	end
end

function scrollView.render(p1)
	-- upvalues: nativeHorizontalScrollViewTuple (write), nativeVerticalScrollViewTuple (write), array (ref), invariantModule (ref), httpService (ref), reactModule (ref), boolean (ref), scrollViewStickyHeaderModule (ref), default (ref), HORIZONTAL (ref), VERTICAL (ref), object (ref), t_2 (write), var1 (write), styleSheetModule (ref), processDecelerationRateModule (ref)
	local unpacked, unpacked_1 = table.unpack(if p1.props.horizontal == true then nativeHorizontalScrollViewTuple else nativeVerticalScrollViewTuple, 1, 2)
	local contentContainerStyle = p1.props.contentContainerStyle
	
	if _G.__DEV__ and p1.props.style ~= nil then
		local style = p1.props.style
		local var3 = array.filter({ "alignItems", "justifyContent" }, function(p2)
			-- upvalues: style (ref)
			return type(style) == "table" and style[p2] ~= nil
		end)
		invariantModule(#var3 == 0, "ScrollView child layout (" .. httpService:JSONEncode(var3) .. ") must be applied through the contentContainerStyle prop.")
	end
	local var4 = if p1.props.onContentSizeChange == nil then nil else { onLayout = p1._handleContentOnLayout }
	local stickyHeaderIndices = p1.props.stickyHeaderIndices
	local children = p1.props.children
	
	if stickyHeaderIndices ~= nil and #stickyHeaderIndices > 0 then
		local var5 = reactModule.Children.toArray(p1.props.children)
		children = array.map(var5, function(p2, p3)
			-- upvalues: boolean (copy), array (copy), stickyHeaderIndices (ref), p1 (ref), scrollViewStickyHeaderModule (copy), reactModule (copy), var5 (ref)
			local var6 = if boolean.toJSBoolean(p2) then array.indexOf(stickyHeaderIndices, p3) else -1
			
			if var6 > -1 then
				local key = p2.key
				
				return reactModule.createElement(if p1.props.StickyHeaderComponent then p1.props.StickyHeaderComponent else scrollViewStickyHeaderModule, {
					Name = "StickyHeaderComponent",
					key = key,
					nativeID = "StickyHeader-" .. tostring(key),
					ref = function(p4)
						-- upvalues: p1 (copy), key (ref)
						return p1:_setStickyHeaderRef(key, p4)
					end,
					nextHeaderLayoutY = p1._headerLayoutYs:get(p1._getKeyForIndex(stickyHeaderIndices[var6 + 1], var5)),
					onLayout = function(p4)
						-- upvalues: p1 (copy), p3 (ref), key (ref)
						return p1:_onStickyHeaderLayout(p3, p4, key)
					end,
					scrollAnimatedValue = p1._scrollAnimatedValue,
					inverted = p1.props.invertStickyHeaders,
					hiddenOnScroll = p1.props.stickyHeaderHiddenOnScroll,
					scrollViewHeight = p1.state.layoutHeight
				}, p2)
			end
			return p2
		end)
	end
	local var6 = reactModule.createElement(default.Provider, {
		value = if p1.props.horizontal == true then HORIZONTAL else VERTICAL
	}, reactModule.createElement("UIListLayout", {
		key = "layout",
		ref = p1._listLayoutRef,
		Name = if p1.props.horizontal then "HorizontalLayout" else "VerticalLayout",
		FillDirection = if p1.props.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
		VerticalAlignment = if p1.props.horizontal then Enum.VerticalAlignment.Center elseif p1.props.layoutStyle then p1.props.layoutStyle.VerticalAlignment else Enum.VerticalAlignment.Top,
		HorizontalAlignment = if p1.props.horizontal then if p1.props.layoutStyle then p1.props.layoutStyle.HorizontalAlignment else Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	}), children)
	local var7 = array.isArray(stickyHeaderIndices) and #stickyHeaderIndices > 0
	local createElement = reactModule.createElement
	createElement = createElement(unpacked_1, object.assign({}, var4, { ref = p1._setInnerViewRef }, {
		collapsable = false,
		style = contentContainerStyle,
		Size = if p1.props.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p1.props.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
		removeClippedSubviews = if t_2.OS == "android" and var7 then false else p1.props.removeClippedSubviews
	}), var6)
	local var8 = if p1.props.alwaysBounceHorizontal ~= nil then p1.props.horizontal else p1.props.alwaysBounceHorizontal
	local var9 = if p1.props.alwaysBounceVertical ~= nil then not p1.props.horizontal else p1.props.alwaysBounceVertical
	local var10 = if p1.props.horizontal == true then var1.baseHorizontal else var1.baseVertical
	local assign = object.assign
	assign = assign(table.clone(p1.props), {
		alwaysBounceHorizontal = var8,
		alwaysBounceVertical = var9,
		style = styleSheetModule.compose(var10, p1.props.style),
		onContentSizeChange = object.None,
		onLayout = p1._handleLayout,
		onMomentumScrollBegin = p1._handleMomentumScrollBegin,
		onMomentumScrollEnd = p1._handleMomentumScrollEnd,
		onResponderGrant = p1._handleResponderGrant,
		onResponderReject = p1._handleResponderReject,
		onResponderRelease = p1._handleResponderRelease,
		onResponderTerminationRequest = p1._handleResponderTerminationRequest,
		onScrollBeginDrag = p1._handleScrollBeginDrag,
		onScrollEndDrag = p1._handleScrollEndDrag,
		onScrollShouldSetResponder = p1._handleScrollShouldSetResponder,
		onStartShouldSetResponder = p1._handleStartShouldSetResponder,
		onStartShouldSetResponderCapture = p1._handleStartShouldSetResponderCapture,
		onTouchEnd = p1._handleTouchEnd,
		onTouchMove = p1._handleTouchMove,
		onTouchStart = p1._handleTouchStart,
		onTouchCancel = p1._handleTouchCancel,
		onScroll = p1._handleScroll,
		scrollEventThrottle = if var7 then 1 else p1.props.scrollEventThrottle,
		sendMomentumEvents = if p1.props.onMomentumScrollBegin or p1.props.onMomentumScrollEnd then true else false,
		snapToStart = p1.props.snapToStart ~= false,
		snapToEnd = p1.props.snapToEnd ~= false,
		pagingEnabled = t_2.select({
			ios = p1.props.pagingEnabled == true and (p1.props.snapToInterval == nil and p1.props.snapToOffsets == nil),
			android = if p1.props.pagingEnabled ~= true then if p1.props.snapToInterval == nil then p1.props.snapToOffsets ~= nil else true else true
		}),
		AutomaticCanvasSize = if p1.props.overrideAutomaticCanvasSize then Enum.AutomaticSize.None else nil
	})
	local decelerationRate = p1.props.decelerationRate
	
	if decelerationRate ~= nil then
		assign.decelerationRate = processDecelerationRateModule(decelerationRate)
	end
	local refreshControl = p1.props.refreshControl
	
	if boolean.toJSBoolean(refreshControl) then
		if t_2.OS == "ios" or t_2.OS == "roblox" then
			return reactModule.createElement(unpacked, object.assign(table.clone(assign), { ref = p1._setNativeRef }), refreshControl, createElement)
		elseif t_2.OS == "android" then
			local _ = nil
			local _ = nil
			local style = assign.style
			local t = { outer = style, inner = style }
			
			return reactModule.cloneElement(refreshControl, object.assign({ style = styleSheetModule.compose(var10, t.outer) }), reactModule.createElement(unpacked, object.assign({}, assign, {
				style = styleSheetModule.compose(var10, t.inner),
				ref = p1._setNativeRef
			}), createElement))
		end
	end
	assign.ref = p1._setNativeRef
	
	return reactModule.createElement(unpacked, assign, createElement)
end

var1 = styleSheetModule.create({
	baseVertical = { ScrollingDirection = Enum.ScrollingDirection.Y },
	baseHorizontal = { ScrollingDirection = Enum.ScrollingDirection.X }
})
local var3 = reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), scrollView (ref), object (ref)
	return reactModule.createElement(scrollView, object.assign(table.clone(p1), { scrollViewRef = p2 }))
end)
var3.Context = default
var3.displayName = "ScrollView"

return var3