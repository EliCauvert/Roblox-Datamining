local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Console = LuauPolyfillModule.console
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local HttpService = game:GetService("HttpService")
local config = {
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
local config1 = {
	get = function(...)
		return { height = 100 }
	end
}
local v1 = nil
v1 = {
	OS = "roblox",
	select = function(p1)
		-- upvalues: v1 (ref)
		return p1[v1.OS]
	end
}
local ReactModule = require(Parent1.React)
local config2 = {
	findNodeHandle = function(...)
		return nil
	end
}
local ScrollViewStickyHeaderModule = require(script.Parent.ScrollViewStickyHeader)
local StyleSheetModule = require(Parent.StyleSheet.StyleSheet)
local ViewModule = require(script.Parent.Parent.View.View)
local config3 = { measureLayout = function(...) end }
local config4 = {
	addListener = function(...)
		return nil
	end
}
local config5 = {
	beginScroll = function(...)
		warn("FrameRateLogger.beginScroll not implemented")
	end,
	endScroll = function(...)
		warn("FrameRateLogger.endScroll not implemented")
	end
}
local config6 = {
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

local function _()
	warn("dismissKeyboard not implemented")
end

local _ = function(p1)
	return p1
end

local InvariantModule = require(Parent.jsUtils.invariant)
local ProcessDecelerationRateModule = require(script.Parent.processDecelerationRate)

local _ = function(Inner)
	return { outer = Inner, inner = Inner }
end

local SetAndForwardRefModule = require(script.Parent.Parent.Parent.Utilities.setAndForwardRef)
local ScrollViewContextModule = require(script.Parent.ScrollViewContext)
local Default = ScrollViewContextModule.default
local HORIZONTAL = ScrollViewContextModule.HORIZONTAL
local VERTICAL = ScrollViewContextModule.VERTICAL
local _ = require(script.Parent.ScrollViewStickyHeader)
local Default1 = require(script.Parent.ScrollViewCommands).default
local ScrollContentViewNativeComponentModule = require(script.Parent.ScrollContentViewNativeComponent)
local ScrollViewNativeComponentModule = require(script.Parent.ScrollViewNativeComponent)
local CreateResult = nil
local NativeHorizontalScrollViewTuple = nil
local NativeVerticalScrollViewTuple = nil
local Config = if v1.OS == "android" then {
	NativeHorizontalScrollViewTuple = { "Frame", "Frame" },
	NativeVerticalScrollViewTuple = { ScrollViewNativeComponentModule, ViewModule }
} else {
	NativeHorizontalScrollViewTuple = {
		ScrollViewNativeComponentModule,
		ScrollContentViewNativeComponentModule
	},
	NativeVerticalScrollViewTuple = {
		ScrollViewNativeComponentModule,
		ScrollContentViewNativeComponentModule
	}
}
NativeHorizontalScrollViewTuple = Config.NativeHorizontalScrollViewTuple
NativeVerticalScrollViewTuple = Config.NativeVerticalScrollViewTuple
local ScrollView = ReactModule.Component:extend("ScrollView")
ScrollView.Context = Default

function ScrollView.init(p1, Props)
	-- upvalues: Map (copy), ReactModule (copy), SetAndForwardRefModule (copy), config2 (copy), Default1 (copy), Boolean (copy), config3 (copy), InvariantModule (copy), v1 (ref), Array (copy), Object (copy), Console (copy), config1 (copy), SetTimeoutFunction (copy), config5 (copy), config6 (copy), config (copy)
	p1.props = Props
	p1._scrollAnimatedValueAttachment = nil
	p1._stickyHeaderRefs = Map.new()
	p1._headerLayoutYs = Map.new()
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
	p1._listLayoutRef = ReactModule.createRef()
	p1._setNativeRef = SetAndForwardRefModule({
		getForwardedRef = function()
			-- upvalues: p1 (copy)
			return p1.props.scrollViewRef
		end,
		setLocalRef = function(_scrollViewRef)
			-- upvalues: p1 (copy)
			p1._scrollViewRef = _scrollViewRef
			
			if _scrollViewRef ~= nil then
				_scrollViewRef.getScrollResponder = p1.getScrollResponder
				_scrollViewRef.getScrollableNode = p1.getScrollableNode
				_scrollViewRef.getInnerViewNode = p1.getInnerViewNode
				_scrollViewRef.getInnerViewRef = p1.getInnerViewRef
				_scrollViewRef.getNativeScrollRef = p1.getNativeScrollRef
				_scrollViewRef.scrollTo = p1.scrollTo
				_scrollViewRef.scrollToEnd = p1.scrollToEnd
				_scrollViewRef.flashScrollIndicators = p1.flashScrollIndicators
				_scrollViewRef.scrollResponderZoomTo = p1.scrollResponderZoomTo
				_scrollViewRef.scrollResponderScrollNativeHandleToKeyboard = p1.scrollResponderScrollNativeHandleToKeyboard
			end
			return nil
		end
	})
	
	function p1.getScrollResponder()
		-- upvalues: p1 (copy)
		return p1
	end
	
	function p1.getScrollableNode()
		-- upvalues: config2 (upval), p1 (copy)
		return config2:findNodeHandle(p1._scrollViewRef)
	end
	
	function p1.getInnerViewNode()
		-- upvalues: config2 (upval), p1 (copy)
		return config2:findNodeHandle(p1._innerViewRef)
	end
	
	function p1.getInnerViewRef()
		-- upvalues: p1 (copy)
		return p1._innerViewRef
	end
	
	function p1.getNativeScrollRef()
		-- upvalues: p1 (copy)
		return p1._scrollViewRef
	end
	
	function p1.scrollTo(ScrollViewRef)
		-- upvalues: p1 (copy), Default1 (upval), Boolean (upval)
		local X = nil
		local Y = nil
		local Animated = nil
		
		if ScrollViewRef ~= nil then
			Y = ScrollViewRef.y
			X = ScrollViewRef.x
			Animated = ScrollViewRef.animated
		end
		if p1._scrollViewRef ~= nil and p1._scrollViewRef._nativeRef.current ~= nil then
			Default1.scrollTo(p1._scrollViewRef, Boolean.toJSBoolean(X) and X or 0, Boolean.toJSBoolean(Y) and Y or 0, not not Animated)
			
			return
		end
	end
	
	function p1.scrollToEnd(ScrollViewRef)
		-- upvalues: p1 (copy), Default1 (upval)
		local v2 = (ScrollViewRef ~= nil and ScrollViewRef.animated) ~= false
		
		if p1._scrollViewRef ~= nil then
			Default1.scrollToEnd(p1._scrollViewRef, v2)
			
			return
		end
	end
	
	function p1.flashScrollIndicators()
		-- upvalues: p1 (copy), Default1 (upval)
		if p1._scrollViewRef ~= nil then
			Default1.flashScrollIndicators(p1._scrollViewRef)
			
			return
		end
	end
	
	function p1.scrollResponderScrollNativeHandleToKeyboard(p2, p3, p4)
		-- upvalues: p1 (copy), Boolean (upval), config3 (upval), config2 (upval)
		p1._additionalScrollOffset = Boolean.toJSBoolean(p3) and p3 or 0
		p1._preventNegativeScrollOffset = Boolean.toJSBoolean(p4)
		
		if p1._innerViewRef == nil then return end
		if typeof(p2) == "number" then
			config3:measureLayout(p2, config2:findNodeHandle(p1), p1._textInputFocusError, p1._inputMeasureAndScrollToKeyboard)
			
			return
		else
			p2:measureLayout(p1._innerViewRef, p1._inputMeasureAndScrollToKeyboard, p1._textInputFocusError)
		end
	end
	
	function p1.scrollResponderZoomTo(p2, Enabled)
		-- upvalues: InvariantModule (upval), v1 (upval), Array (upval), Object (upval), p1 (copy), Console (upval), Default1 (upval)
		InvariantModule(v1.OS == "ios", "zoomToRect is not implemented")
		
		if Array.indexOf(Object.keys(p2), "animated") == -1 then
			if typeof(Enabled) ~= "nil" then
				Console.warn("`scrollResponderZoomTo` `animated` argument is deprecated. Use `options.animated` instead")
			end
		else
			p1._animated = p2.animated
			p2.animated = nil
		end
		if p1._scrollViewRef ~= nil then
			Default1.zoomToRect(p1._scrollViewRef, p2, Enabled ~= false)
			
			return
		end
	end
	
	function p1:_inputMeasureAndScrollToKeyboard(p2, _, p3)
		-- upvalues: config1 (upval), p1 (copy), SetTimeoutFunction (upval)
		local Height = config1:get("window").height
		
		local function scrollTextInputIntoVisibleRect()
			-- upvalues: p1 (upval), Height (ref), p2 (copy), p3 (copy)
			if p1._keyboardWillOpenTo ~= nil then
				Height = p1._keyboardWillOpenTo.endCoordinates.screenY
			end
			local NewHeight = p2 - Height + p3 + p1._additionalScrollOffset
			
			if p1._preventNegativeScrollOffset == true then
				NewHeight = math.max(0, NewHeight)
			end
			p1.scrollTo({ x = 0, animated = true, y = NewHeight })
			p1._additionalScrollOffset = 0
			p1._preventNegativeScrollOffset = false
		end
		
		if p1._keyboardWillOpenTo == nil then
			SetTimeoutFunction(function()
				-- upvalues: scrollTextInputIntoVisibleRect (copy)
				scrollTextInputIntoVisibleRect()
			end, 0)
		else
			scrollTextInputIntoVisibleRect()
		end
	end
	
	function p1._handleScroll(p2)
		-- upvalues: p1 (copy), v1 (upval), Console (upval)
		if _G.__DEV__ and p1.props.onScroll and p1.props.scrollEventThrottle == nil and v1.OS == "ios" then
			Console.log("You specified `onScroll` on a <ScrollView> but not `scrollEventThrottle`. You will only receive one event. Using `16` you get all the events but be aware that it may cause frame drops, use a bigger number if you don't need as much precision.")
		end
		p1._observedScrollSinceBecomingResponder = true
		
		if p1.props.onScroll then
			p1.props.onScroll(p2)
		end
	end
	
	function p1._handleLayout(p2)
		-- upvalues: p1 (copy)
		if p1.props.invertStickyHeaders == true then
			p1:setState({ layoutHeight = p2.AbsoluteWindowSize.Y })
		end
		if p1.props.onLayout then
			p1.props.onLayout(p2)
		end
	end
	
	function p1._overrideAutomaticCanvasSize(XOffset, YOffset)
		-- upvalues: p1 (copy)
		if p1._scrollViewRef == nil then return end
		local Current = p1._scrollViewRef._nativeRef.current
		
		if Current == nil then return end
		if p1.props.AutomaticCanvasSize == Enum.AutomaticSize.XY or p1.props.AutomaticCanvasSize == nil then
			Current.CanvasSize = UDim2.new(0, XOffset, 0, YOffset)
			
			return
		end
		if p1.props.AutomaticCanvasSize == Enum.AutomaticSize.X then
			Current.CanvasSize = UDim2.new(0, XOffset, 0, Current.AbsoluteCanvasSize.Y)
			
			return
		end
		if p1.props.AutomaticCanvasSize == Enum.AutomaticSize.Y then
			Current.CanvasSize = UDim2.new(0, Current.AbsoluteCanvasSize.X, 0, YOffset)
		end
	end
	
	function p1._handleContentOnLayout(Frame: Frame)
		-- upvalues: p1 (copy)
		local X = Frame.AbsoluteSize.X
		local Y = Frame.AbsoluteSize.Y
		
		if p1.props.overrideAutomaticCanvasSize then
			p1._overrideAutomaticCanvasSize(X, Y)
		end
		if p1.props.onContentSizeChange then
			p1.props.onContentSizeChange(X, Y)
		end
	end
	
	p1._scrollViewRef = nil
	p1._innerViewRef = nil
	p1._setInnerViewRef = SetAndForwardRefModule({
		getForwardedRef = function()
			-- upvalues: p1 (copy)
			return p1.props.innerViewRef
		end,
		setLocalRef = function(_innerViewRef)
			-- upvalues: p1 (copy)
			p1._innerViewRef = _innerViewRef
			
			return nil
		end
	})
	
	function p1.scrollResponderKeyboardWillShow(_keyboardWillOpenTo)
		-- upvalues: p1 (copy)
		p1._keyboardWillOpenTo = _keyboardWillOpenTo
		
		if p1.props.onKeyboardWillShow then
			p1.props.onKeyboardWillShow(_keyboardWillOpenTo)
		end
	end
	
	function p1.scrollResponderKeyboardWillHide(p2)
		-- upvalues: p1 (copy)
		p1._keyboardWillOpenTo = nil
		
		if p1.props.onKeyboardWillHide then
			p1.props.onKeyboardWillHide(p2)
		end
	end
	
	function p1.scrollResponderKeyboardDidShow(_keyboardWillOpenTo)
		-- upvalues: Boolean (upval), p1 (copy)
		if Boolean.toJSBoolean(_keyboardWillOpenTo) then
			p1._keyboardWillOpenTo = _keyboardWillOpenTo
		end
		if p1.props.onKeyboardDidShow then
			p1.props.onKeyboardDidShow(_keyboardWillOpenTo)
		end
	end
	
	function p1.scrollResponderKeyboardDidHide(p2)
		-- upvalues: p1 (copy)
		p1._keyboardWillOpenTo = nil
		
		if p1.props.onKeyboardDidHide then
			p1.props.onKeyboardDidHide(p2)
		end
	end
	
	function p1._handleMomentumScrollBegin(p2)
		-- upvalues: p1 (copy)
		p1._lastMomentumScrollBeginTime = os.clock() * 1000
		
		if p1.props.onMomentumScrollBegin then
			p1.props.onMomentumScrollBegin(p2)
		end
	end
	
	function p1._handleMomentumScrollEnd(p2)
		-- upvalues: config5 (upval), p1 (copy)
		config5:endScroll()
		p1._lastMomentumScrollEndTime = os.clock() * 1000
		
		if p1.props.onMomentumScrollEnd then
			p1.props.onMomentumScrollEnd(p2)
		end
	end
	
	function p1._handleScrollBeginDrag(p2)
		-- upvalues: config5 (upval), v1 (upval), p1 (copy)
		config5:beginScroll()
		
		if v1.OS == "android" and p1.props.keyboardDismissMode == "on-drag" then
			warn("dismissKeyboard not implemented")
		end
		if p1.props.onScrollBeginDrag then
			p1.props.onScrollBeginDrag(p2)
		end
	end
	
	function p1._handleScrollEndDrag(p2, p3)
		-- upvalues: p1 (copy), Boolean (upval), config5 (upval)
		if not p1:_isAnimating() and (not Boolean.toJSBoolean(nil) or (nil).x == 0 and (nil).y == 0) then
			config5:endScroll()
		end
		if p1.props.onScrollEndDrag then
			p1.props.onScrollEndDrag(p2, p3)
		end
	end
	
	function p1._isAnimating(): boolean
		-- upvalues: p1 (copy)
		return os.clock() * 1000 - p1._lastMomentumScrollEndTime < 16
	end
	
	function p1._handleResponderGrant(p2)
		-- upvalues: p1 (copy)
		p1._observedScrollSinceBecomingResponder = false
		
		if p1.props.onResponderGrant then
			p1.props.onResponderGrant(p2)
		end
		p1._becameResponderWhileAnimating = p1:_isAnimating()
	end
	
	function p1._handleResponderReject() end
	
	function p1._handleResponderRelease(p2)
		-- upvalues: p1 (copy), Console (upval), config6 (upval)
		p1._isTouching = #p2.nativeEvent.touches ~= 0
		
		if p1.props.onResponderRelease then
			p1.props.onResponderRelease(p2)
		end
		if typeof(p2.target) ~= "number" then
			local CurrentlyFocusedInputResult = config6:currentlyFocusedInput()
			
			if p1.props.keyboardShouldPersistTaps ~= true and p1.props.keyboardShouldPersistTaps ~= "always" and p1:_keyboardIsDismissible() and p2.target ~= CurrentlyFocusedInputResult and not p1._observedScrollSinceBecomingResponder and not p1._becameResponderWhileAnimating then
				config6:blurTextInput(CurrentlyFocusedInputResult)
			end
			return
		elseif _G.__DEV__ then
			Console.error("Did not expect event target to be a number. Should have been a native component")
		end
	end
	
	function p1._handleResponderTerminationRequest(): boolean
		-- upvalues: p1 (copy)
		return not p1._observedScrollSinceBecomingResponder
	end
	
	function p1._handleScrollShouldSetResponder()
		-- upvalues: p1 (copy)
		return p1.props.disableScrollViewPanResponder ~= true and p1._isTouching
	end
	
	function p1._handleStartShouldSetResponder(p2): boolean
		-- upvalues: p1 (copy), config6 (upval)
		if p1.props.disableScrollViewPanResponder == true then
			return false
		else
			local CurrentlyFocusedInputResult = config6:currentlyFocusedInput()
			
			return p1.props.keyboardShouldPersistTaps == "handled" and p1:_keyboardIsDismissible() and p2.target ~= CurrentlyFocusedInputResult or false
		end
	end
	
	function p1._handleStartShouldSetResponderCapture(p2): boolean
		-- upvalues: p1 (copy), Boolean (upval), Console (upval), config6 (upval)
		if p1:_isAnimating() then
			return true
		end
		if p1.props.disableScrollViewPanResponder == true then
			return false
		end
		local KeyboardShouldPersistTaps = p1.props.keyboardShouldPersistTaps
		local Inverted: boolean = not Boolean.toJSBoolean(KeyboardShouldPersistTaps) or KeyboardShouldPersistTaps == "never"
		
		if typeof(p2.target) ~= "number" then
			return Inverted and p1:_keyboardIsDismissible() and p2.target ~= nil and not Boolean.toJSBoolean(config6:isTextInput(p2.target)) or false
		end
		if _G.__DEV__ then
			Console.error("Did not expect event target to be a number. Should have been a native component")
		end
		return false
	end
	
	function p1._keyboardIsDismissible(): boolean
		-- upvalues: config6 (upval), p1 (copy), v1 (upval)
		local CurrentlyFocusedInputResult = config6:currentlyFocusedInput()
		local HasKeyboardWillOpenTo: boolean = p1._keyboardWillOpenTo ~= nil or v1.OS == "android"
		
		return CurrentlyFocusedInputResult ~= nil and config6:isTextInput(CurrentlyFocusedInputResult) and HasKeyboardWillOpenTo
	end
	
	function p1._handleTouchEnd(p2, p3)
		-- upvalues: p1 (copy)
		p1._isTouching = false
		
		if p1.props.onTouchEnd then
			p1.props.onTouchEnd(p2, p3)
		end
	end
	
	function p1._handleTouchCancel(p2, p3)
		-- upvalues: p1 (copy)
		p1._isTouching = false
		
		if p1.props.onTouchCancel then
			p1.props.onTouchCancel(p2, p3)
		end
	end
	
	function p1._handleTouchStart(p2, p3)
		-- upvalues: p1 (copy)
		p1._isTouching = true
		
		if p1.props.onTouchStart then
			p1.props.onTouchStart(p2, p3)
		end
	end
	
	function p1._handleTouchMove(p2, p3)
		-- upvalues: p1 (copy)
		if p1.props.onTouchMove then
			p1.props.onTouchMove(p2, p3)
		end
	end
	
	p1._scrollAnimatedValue = config.Value.new(if p1.props.contentOffset and Boolean.toJSBoolean(p1.props.contentOffset.y) then p1.props.contentOffset.y else 0)
	p1._scrollAnimatedValue:setOffset(if p1.props.contentInset and Boolean.toJSBoolean(p1.props.contentInset.top) then p1.props.contentInset.top else 0)
end

function ScrollView.componentDidMount(p1)
	-- upvalues: Console (copy), Boolean (copy), config4 (copy)
	if typeof(p1.props.keyboardShouldPersistTaps) == "boolean" then
		Console.warn(("'keyboardShouldPersistTaps={%s}' is deprecated. "):format(if p1.props.keyboardShouldPersistTaps == true then "true" else "false") .. ("Use 'keyboardShouldPersistTaps=\"%s\"' instead"):format(if Boolean.toJSBoolean(p1.props.keyboardShouldPersistTaps) then "always" else "never"))
	end
	p1._keyboardWillOpenTo = nil
	p1._additionalScrollOffset = 0
	p1._subscriptionKeyboardWillShow = config4:addListener("keyboardWillShow", p1.scrollResponderKeyboardWillShow)
	p1._subscriptionKeyboardWillHide = config4:addListener("keyboardWillHide", p1.scrollResponderKeyboardWillHide)
	p1._subscriptionKeyboardDidShow = config4:addListener("keyboardDidShow", p1.scrollResponderKeyboardDidShow)
	p1._subscriptionKeyboardDidHide = config4:addListener("keyboardDidHide", p1.scrollResponderKeyboardDidHide)
	p1:_updateAnimatedNodeAttachment()
end

function ScrollView.componentDidUpdate(p1, p2)
	-- upvalues: Boolean (copy)
	local Top = if p1.props.contentInset then p1.props.contentInset.top else 0
	
	if (if p2.contentInset then p2.contentInset.top else 0) ~= Top then
		p1._scrollAnimatedValue:setOffset(Boolean.toJSBoolean(Top) and Top or 0)
	end
	p1:_updateAnimatedNodeAttachment()
end

function ScrollView.componentWillUnmount(p1)
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

function ScrollView._textInputFocusError()
	-- upvalues: Console (copy)
	Console.warn("Error measuring text field.")
end

function ScrollView._getKeyForIndex(p1, Array)
	local ArrayEntry = Array[p1]
	
	return if ArrayEntry then ArrayEntry.key else ArrayEntry
end

function ScrollView._updateAnimatedNodeAttachment(p1)
	-- upvalues: config (copy)
	if p1._scrollAnimatedValueAttachment then
		p1._scrollAnimatedValueAttachment:detach()
	end
	if p1.props.stickyHeaderIndices and #p1.props.stickyHeaderIndices > 0 then
		p1._scrollAnimatedValueAttachment = config:attachNativeEvent(p1._scrollViewRef, "onScroll", {
			{
				nativeEvent = { contentOffset = { y = p1._scrollAnimatedValue } }
			}
		})
	end
end

function ScrollView._setStickyHeaderRef(p1, Key, p2)
	-- upvalues: Boolean (copy)
	if Boolean.toJSBoolean(p2) then
		p1._stickyHeaderRefs:set(Key, p2)
		
		return
	else
		p1._stickyHeaderRefs:delete(Key)
	end
end

function ScrollView._onStickyHeaderLayout(p1, p2, p3, Key)
	-- upvalues: ReactModule (copy), Array (copy), Boolean (copy)
	local StickyHeaderIndices = p1.props.stickyHeaderIndices
	
	if not StickyHeaderIndices then return end
	local Array1 = ReactModule.Children.toArray(p1.props.children)
	
	if Key ~= p1._getKeyForIndex(p2, Array1) then return end
	local Y = p3.nativeEvent.layout.y
	p1._headerLayoutYs:set(Key, Y)
	local StickyHeaderIndice = StickyHeaderIndices[Array.indexOf(StickyHeaderIndices, p2) - 1]
	
	if StickyHeaderIndice ~= nil then
		local GetResult = p1._stickyHeaderRefs:get(p1._getKeyForIndex(StickyHeaderIndice, Array1))
		
		if Boolean.toJSBoolean(GetResult) and GetResult.setNextHeaderY then
			GetResult:setNextHeaderY(Y)
		end
	end
end

function ScrollView.render(p1)
	-- upvalues: NativeHorizontalScrollViewTuple (ref), NativeVerticalScrollViewTuple (ref), Array (copy), InvariantModule (copy), HttpService (copy), ReactModule (copy), Boolean (copy), ScrollViewStickyHeaderModule (copy), Default (copy), HORIZONTAL (copy), VERTICAL (copy), Object (copy), v1 (ref), CreateResult (ref), StyleSheetModule (copy), ProcessDecelerationRateModule (copy)
	local Unpacked, Unpacked2 = table.unpack(if p1.props.horizontal == true then NativeHorizontalScrollViewTuple else NativeVerticalScrollViewTuple, 1, 2)
	local ContentContainerStyle = p1.props.contentContainerStyle
	
	if _G.__DEV__ and p1.props.style ~= nil then
		local Style = p1.props.style
		local FilterResult = Array.filter({ "alignItems", "justifyContent" }, function(p2): boolean
			-- upvalues: Style (copy)
			return type(Style) == "table" and Style[p2] ~= nil
		end)
		InvariantModule(#FilterResult == 0, "ScrollView child layout (" .. HttpService:JSONEncode(FilterResult) .. ") must be applied through the contentContainerStyle prop.")
	end
	local Config = if p1.props.onContentSizeChange == nil then nil else { onLayout = p1._handleContentOnLayout }
	local StickyHeaderIndices = p1.props.stickyHeaderIndices
	local Children = p1.props.children
	
	if StickyHeaderIndices ~= nil and #StickyHeaderIndices > 0 then
		local Array1 = ReactModule.Children.toArray(p1.props.children)
		Children = Array.map(Array1, function(p2, p3)
			-- upvalues: Boolean (upval), Array (upval), StickyHeaderIndices (copy), p1 (copy), ScrollViewStickyHeaderModule (upval), ReactModule (upval), Array1 (copy)
			local IndexOfResult = if Boolean.toJSBoolean(p2) then Array.indexOf(StickyHeaderIndices, p3) else -1
			
			if IndexOfResult > -1 then
				local Key = p2.key
				
				return (ReactModule.createElement(if p1.props.StickyHeaderComponent then p1.props.StickyHeaderComponent else ScrollViewStickyHeaderModule, {
					Name = "StickyHeaderComponent",
					key = Key,
					nativeID = "StickyHeader-" .. tostring(Key),
					ref = function(p4)
						-- upvalues: p1 (upval), Key (copy)
						return p1:_setStickyHeaderRef(Key, p4)
					end,
					nextHeaderLayoutY = p1._headerLayoutYs:get(p1._getKeyForIndex(StickyHeaderIndices[IndexOfResult + 1], Array1)),
					onLayout = function(p4)
						-- upvalues: p1 (upval), p3 (copy), Key (copy)
						return p1:_onStickyHeaderLayout(p3, p4, Key)
					end,
					scrollAnimatedValue = p1._scrollAnimatedValue,
					inverted = p1.props.invertStickyHeaders,
					hiddenOnScroll = p1.props.stickyHeaderHiddenOnScroll,
					scrollViewHeight = p1.state.layoutHeight
				}, p2))
			else
				return p2
			end
		end)
	end
	local v2: boolean = Array.isArray(StickyHeaderIndices) and #StickyHeaderIndices > 0
	local Element = ReactModule.createElement(Unpacked2, Object.assign({}, Config, { ref = p1._setInnerViewRef }, {
		collapsable = false,
		style = ContentContainerStyle,
		Size = if p1.props.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p1.props.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
		removeClippedSubviews = (v1.OS ~= "android" or not v2) and p1.props.removeClippedSubviews
	}), (ReactModule.createElement(Default.Provider, {
		value = if p1.props.horizontal == true then HORIZONTAL else VERTICAL
	}, ReactModule.createElement("UIListLayout", {
		key = "layout",
		ref = p1._listLayoutRef,
		Name = if p1.props.horizontal then "HorizontalLayout" else "VerticalLayout",
		FillDirection = if p1.props.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
		VerticalAlignment = if p1.props.horizontal then Enum.VerticalAlignment.Center elseif p1.props.layoutStyle then p1.props.layoutStyle.VerticalAlignment else Enum.VerticalAlignment.Top,
		HorizontalAlignment = if p1.props.horizontal then if p1.props.layoutStyle then p1.props.layoutStyle.HorizontalAlignment else Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	}), Children)))
	local BaseHorizontal = if p1.props.horizontal == true then CreateResult.baseHorizontal else CreateResult.baseVertical
	local AssignResult = Object.assign(table.clone(p1.props), {
		alwaysBounceHorizontal = if p1.props.alwaysBounceHorizontal == nil then p1.props.horizontal else p1.props.alwaysBounceHorizontal,
		alwaysBounceVertical = if p1.props.alwaysBounceVertical == nil then not p1.props.horizontal else p1.props.alwaysBounceVertical,
		style = StyleSheetModule.compose(BaseHorizontal, p1.props.style),
		onContentSizeChange = Object.None,
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
		scrollEventThrottle = if v2 then 1 else p1.props.scrollEventThrottle,
		sendMomentumEvents = if p1.props.onMomentumScrollBegin or p1.props.onMomentumScrollEnd then true else false,
		snapToStart = p1.props.snapToStart ~= false,
		snapToEnd = p1.props.snapToEnd ~= false,
		pagingEnabled = v1.select({
			ios = p1.props.pagingEnabled == true and p1.props.snapToInterval == nil and p1.props.snapToOffsets == nil,
			android = p1.props.pagingEnabled == true or (p1.props.snapToInterval ~= nil or p1.props.snapToOffsets ~= nil)
		}),
		AutomaticCanvasSize = if p1.props.overrideAutomaticCanvasSize then Enum.AutomaticSize.None else nil
	})
	local DecelerationRate = p1.props.decelerationRate
	
	if DecelerationRate ~= nil then
		AssignResult.decelerationRate = ProcessDecelerationRateModule(DecelerationRate)
	end
	local RefreshControl = p1.props.refreshControl
	
	if Boolean.toJSBoolean(RefreshControl) then
		if v1.OS == "ios" or v1.OS == "roblox" then
			return ReactModule.createElement(Unpacked, Object.assign(table.clone(AssignResult), { ref = p1._setNativeRef }), RefreshControl, Element)
		elseif v1.OS == "android" then
			local Style1 = AssignResult.style
			local config = { outer = Style1, inner = Style1 }
			
			return ReactModule.cloneElement(RefreshControl, Object.assign({
				style = StyleSheetModule.compose(BaseHorizontal, config.outer)
			}), ReactModule.createElement(Unpacked, Object.assign({}, AssignResult, {
				style = StyleSheetModule.compose(BaseHorizontal, config.inner),
				ref = p1._setNativeRef
			}), Element))
		end
	end
	AssignResult.ref = p1._setNativeRef
	
	return ReactModule.createElement(Unpacked, AssignResult, Element)
end

CreateResult = StyleSheetModule.create({
	baseVertical = { ScrollingDirection = Enum.ScrollingDirection.Y },
	baseHorizontal = { ScrollingDirection = Enum.ScrollingDirection.X }
})
local ForwardRefResult = ReactModule.forwardRef(function(Tbl, ScrollViewRef)
	-- upvalues: ReactModule (copy), ScrollView (copy), Object (copy)
	return ReactModule.createElement(ScrollView, Object.assign(table.clone(Tbl), { scrollViewRef = ScrollViewRef }))
end)
ForwardRefResult.Context = Default
ForwardRefResult.displayName = "ScrollView"

return ForwardRefResult