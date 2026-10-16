local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local config = {
	new = function(...) --[[ Line: 29 ]]
		return nil
	end
}
local config1 = {
	new = function(...) --[[ Line: 35 ]]
		return nil
	end
}
local ReactModule = require(Parent1.React)
local StyleSheetModule = require(Parent.StyleSheet.StyleSheet)
local CreateResult = nil
local ScrollViewStickyHeader = ReactModule.Component:extend("ScrollViewStickyHeader")

function ScrollViewStickyHeader.init(p1, Props) --[[ Line: 106 ]]
	-- upvalues: ReactModule (copy)
	warn("ScrollViewStickyHeader not fully implemented")
	p1.props = Props
	p1.state = {
		measured = false,
		layoutY = 0,
		layoutHeight = 0,
		translateY = nil,
		nextHeaderLayoutY = p1.props.nextHeaderLayoutY
	}
	p1._translateY = nil
	p1._shouldRecreateTranslateY = true
	p1._haveReceivedInitialZeroTranslateY = true
	p1._debounceTimeout = 64
	
	function p1:setNextHeaderY(NextHeaderLayoutY) --[[ Line: 128 ]]
		-- upvalues: p1 (copy)
		p1._shouldRecreateTranslateY = true
		p1.setState({ nextHeaderLayoutY = NextHeaderLayoutY })
	end
	
	function p1:_onLayout(p2) --[[ Line: 133 ]]
		-- upvalues: p1 (copy), ReactModule (upval)
		local Y = p2.nativeEvent.layout.y
		local Height = p2.nativeEvent.layout.height
		
		if Y ~= p1.state.layoutY or Height ~= p1.state.layoutHeight or p1.state.measured ~= true then
			p1._shouldRecreateTranslateY = true
		end
		p1:setState({ measured = true, layoutY = Y, layoutHeight = Height })
		p1.props:onLayout(p2)
		local OnlyResult = ReactModule.Children.only(p1.props.children)
		
		if OnlyResult.props.onLayout then
			OnlyResult.props:onLayout(p2)
		end
	end
	
	function p1:_setComponentRef(_ref) --[[ Line: 152 ]]
		-- upvalues: p1 (copy)
		p1._ref = _ref
	end
end

function ScrollViewStickyHeader.componentWillUnmount(p1) --[[ Line: 157 ]]
	-- upvalues: Boolean (copy), ClearTimeoutFunction (copy)
	if p1._translateY ~= nil and p1._animatedValueListenerId ~= nil then
		p1._translateY:removeListener(p1._animatedValueListenerId)
	end
	if Boolean.toJSBoolean(p1._timer) then
		ClearTimeoutFunction(p1._timer)
	end
end

function ScrollViewStickyHeader.UNSAFE_componentWillReceiveProps(p1, p2) --[[ Line: 166 ]]
	if p2.scrollViewHeight ~= p1.props.scrollViewHeight or p2.scrollAnimatedValue ~= p1.props.scrollAnimatedValue or p2.inverted ~= p1.props.inverted then
		p1._shouldRecreateTranslateY = true
	end
end

function ScrollViewStickyHeader.updateTranslateListener(p1, InterpolateResult, JSBoolean, NewResult) --[[ Line: 176 ]]
	-- upvalues: Boolean (copy), config (copy), ClearTimeoutFunction (copy), SetTimeoutFunction (copy)
	if p1._translateY ~= nil and p1._animatedValueListenerId ~= nil then
		p1._translateY:removeListener(p1._animatedValueListenerId)
	end
	p1.translateY = if Boolean.toJSBoolean(NewResult) then config.new(InterpolateResult, NewResult) else InterpolateResult
	p1._shouldRecreateTranslateY = false
	
	if not JSBoolean then return end
	if not p1._animatedValueListener then
		function p1._animatedValueListener(p2) --[[ Line: 207 ]]
			-- upvalues: p1 (copy), Boolean (upval), ClearTimeoutFunction (upval), SetTimeoutFunction (upval)
			local Value = p2.value
			
			if Value == 0 and not p1._haveReceivedInitialZeroTranslateY then
				p1._haveReceivedInitialZeroTranslateY = true
				
				return
			end
			if Boolean.toJSBoolean(p1._timer) then
				ClearTimeoutFunction(p1._timer)
			end
			p1._timer = SetTimeoutFunction(function() --[[ Line: 218 ]]
				-- upvalues: Value (copy), p1 (upval)
				if Value ~= p1.state.translateY then
					p1:setState({ translateY = Value })
				end
			end, p1._debounceTimeout)
		end
	end
	if p1.state.translateY ~= 0 and p1.state.translateY ~= nil then
		p1._haveReceivedInitialZeroTranslateY = false
	end
	p1._animatedValueListenerId = InterpolateResult:addListener(p1._animatedValueListener)
end

function ScrollViewStickyHeader.render(p1) --[[ Line: 231 ]]
	-- upvalues: Boolean (copy), config1 (copy), ReactModule (copy), CreateResult (ref)
	local JSBoolean = p1._ref and (p1._ref._internalInstanceHandle and (p1._ref._internalInstanceHandle.stateNode and Boolean.toJSBoolean(p1._ref._internalInstanceHandle.stateNode.canonical)))
	
	if p1._shouldRecreateTranslateY then
		local Inverted = p1.props.inverted
		local ScrollViewHeight = p1.props.scrollViewHeight
		local LayoutHeight: number = p1.state.layoutHeight
		local LayoutY: number = p1.state.layoutY
		local NextHeaderLayoutY = p1.state.nextHeaderLayoutY
		local List = { -1, 0 }
		local List1 = { 0, 0 }
		
		if p1.state.measured then
			if Inverted then
				if ScrollViewHeight ~= nil then
					local LayoutYDelta = LayoutY + LayoutHeight - ScrollViewHeight
					
					if LayoutYDelta > 0 then
						table.insert(List, LayoutYDelta)
						table.insert(List1, 0)
						table.insert(List, LayoutYDelta + 1)
						table.insert(List1, 1)
						local LayoutHeightDelta = (NextHeaderLayoutY or 0) - LayoutHeight - ScrollViewHeight
						
						if LayoutYDelta < LayoutHeightDelta then
							table.insert(List, LayoutHeightDelta)
							table.insert(List, LayoutHeightDelta + 1)
							table.insert(List1, LayoutHeightDelta - LayoutYDelta)
							table.insert(List1, LayoutHeightDelta - LayoutYDelta)
						end
					end
				end
			else
				table.insert(List, LayoutY)
				table.insert(List1, 0)
				local v1 = (NextHeaderLayoutY or 0) - LayoutHeight
				
				if LayoutY <= v1 then
					table.insert(List, v1)
					table.insert(List, v1 + 1)
					table.insert(List1, v1 - LayoutY)
					table.insert(List1, v1 - LayoutY)
				else
					table.insert(List, LayoutY + 1)
					table.insert(List1, 1)
				end
			end
		end
		p1:updateTranslateListener(p1.props.scrollAnimatedValue:interpolate({ inputRange = List, outputRange = List1 }), JSBoolean, if p1.props.hiddenOnScroll then config1.new(p1.props.scrollAnimatedValue:interpolate({
			extrapolateLeft = "clamp",
			inputRange = { LayoutY, LayoutY + 1 },
			outputRange = { 0, 1 }
		}):interpolate({ inputRange = { 0, 1 }, outputRange = { 0, -1 } }), -p1.state.layoutHeight, 0) else nil)
	end
	local OnlyResult = ReactModule.Children.only(p1.props.children)
	
	return ReactModule.createElement("AnimatedView", {
		collapsable = false,
		nativeID = p1.props.nativeID,
		onLayout = p1._onLayout,
		ref = p1._setComponentRef,
		style = {
			OnlyResult.props.style,
			CreateResult.header,
			{ transform = { { translateY = p1._translateY } } }
		},
		passthroughAnimatedPropExplicitValues = if JSBoolean and p1.state.translateY ~= nil then {
			style = { transform = { { translateY = p1.state.translateY } } }
		} else nil
	}, ReactModule.cloneElement(OnlyResult, { onLayout = nil, style = CreateResult.fill }))
end

CreateResult = StyleSheetModule.create({
	header = { zIndex = 10, position = "relative" },
	fill = { flex = 1 }
})

return ScrollViewStickyHeader