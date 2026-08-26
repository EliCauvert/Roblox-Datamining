local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local t = {
	new = function(...)
		return nil
	end
}
local t_1 = {
	new = function(...)
		return nil
	end
}
local reactModule = require(parent_1.React)
local styleSheetModule = require(parent.StyleSheet.StyleSheet)
local _ = { OS = "roblox" }
local var1 = nil
local scrollViewStickyHeader = reactModule.Component:extend("ScrollViewStickyHeader")

function scrollViewStickyHeader.init(p1, p2)
	-- upvalues: reactModule (ref)
	warn("ScrollViewStickyHeader not fully implemented")
	p1.props = p2
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
	
	function p0.setNextHeaderY(_, p3)
		-- upvalues: p1 (ref)
		p1._shouldRecreateTranslateY = true
		p1.setState({ nextHeaderLayoutY = p3 })
	end
	
	function p0._onLayout(_, p3)
		-- upvalues: p1 (ref), reactModule (copy)
		local y = p3.nativeEvent.layout.y
		local height = p3.nativeEvent.layout.height
		
		if y ~= p1.state.layoutY or height ~= p1.state.layoutHeight or p1.state.measured ~= true then
			p1._shouldRecreateTranslateY = true
		end
		p1:setState({ measured = true, layoutY = y, layoutHeight = height })
		p1.props:onLayout(p3)
		local var2 = reactModule.Children.only(p1.props.children)
		
		if var2.props.onLayout then
			var2.props:onLayout(p3)
		end
	end
	
	function p0._setComponentRef(_, p3)
		-- upvalues: p1 (ref)
		p1._ref = p3
	end
end

function scrollViewStickyHeader.componentWillUnmount(p1)
	-- upvalues: boolean (ref), clearTimeout (ref)
	if p1._translateY ~= nil and p1._animatedValueListenerId ~= nil then
		p1._translateY:removeListener(p1._animatedValueListenerId)
	end
	if boolean.toJSBoolean(p1._timer) then
		clearTimeout(p1._timer)
	end
end

function scrollViewStickyHeader.UNSAFE_componentWillReceiveProps(p1, p2)
	if p2.scrollViewHeight ~= p1.props.scrollViewHeight or p2.scrollAnimatedValue ~= p1.props.scrollAnimatedValue or p2.inverted ~= p1.props.inverted then
		p1._shouldRecreateTranslateY = true
	end
end

function scrollViewStickyHeader.updateTranslateListener(p1, p2, p3, p4)
	-- upvalues: boolean (ref), t (ref), clearTimeout (ref), setTimeout (ref)
	if p1._translateY ~= nil and p1._animatedValueListenerId ~= nil then
		p1._translateY:removeListener(p1._animatedValueListenerId)
	end
	p1.translateY = if boolean.toJSBoolean(p4) then t.new(p2, p4) else p2
	p1._shouldRecreateTranslateY = false
	
	if not p3 then return end
	if not p1._animatedValueListener then
		function p8._animatedValueListener(p5)
			-- upvalues: p1 (ref), boolean (copy), clearTimeout (copy), setTimeout (copy)
			local value = p5.value
			
			if value == 0 and not p1._haveReceivedInitialZeroTranslateY then
				p1._haveReceivedInitialZeroTranslateY = true
				
				return
			elseif boolean.toJSBoolean(p1._timer) then
				clearTimeout(p1._timer)
			end
			p1._timer = setTimeout(function()
				-- upvalues: value (ref), p1 (copy)
				if value ~= p1.state.translateY then
					p1:setState({ translateY = value })
				end
			end, p1._debounceTimeout)
		end
	end
	if p1.state.translateY ~= 0 and p1.state.translateY ~= nil then
		p1._haveReceivedInitialZeroTranslateY = false
	end
	p1._animatedValueListenerId = p2:addListener(p1._animatedValueListener)
end

function scrollViewStickyHeader.render(p1)
	-- upvalues: boolean (ref), t_1 (ref), reactModule (ref), var1 (write)
	local canonical = p1._ref and (p1._ref._internalInstanceHandle and (p1._ref._internalInstanceHandle.stateNode and boolean.toJSBoolean(p1._ref._internalInstanceHandle.stateNode.canonical)))
	
	if p1._shouldRecreateTranslateY then
		local inverted = p1.props.inverted
		local scrollViewHeight = p1.props.scrollViewHeight
		local measured = p1.state.measured
		local layoutHeight = p1.state.layoutHeight
		local layoutY = p1.state.layoutY
		local nextHeaderLayoutY = p1.state.nextHeaderLayoutY
		local list = { -1, 0 }
		local list_1 = { 0, 0 }
		
		if measured then
			if not inverted then
				table.insert(list, layoutY)
				table.insert(list_1, 0)
				local var2 = (nextHeaderLayoutY or 0) - layoutHeight
				
				if layoutY <= var2 then
					table.insert(list, var2)
					table.insert(list, var2 + 1)
					table.insert(list_1, var2 - layoutY)
					table.insert(list_1, var2 - layoutY)
				else
					table.insert(list, layoutY + 1)
					table.insert(list_1, 1)
				end
			elseif scrollViewHeight ~= nil then
				local var3 = layoutY + layoutHeight - scrollViewHeight
				
				if var3 > 0 then
					table.insert(list, var3)
					table.insert(list_1, 0)
					table.insert(list, var3 + 1)
					table.insert(list_1, 1)
					local var4 = (nextHeaderLayoutY or 0) - layoutHeight - scrollViewHeight
					
					if var3 < var4 then
						table.insert(list, var4)
						table.insert(list, var4 + 1)
						table.insert(list_1, var4 - var3)
						table.insert(list_1, var4 - var3)
					end
				end
			end
		end
		p1:updateTranslateListener(p1.props.scrollAnimatedValue:interpolate({ inputRange = list, outputRange = list_1 }), canonical, if p1.props.hiddenOnScroll then t_1.new(p1.props.scrollAnimatedValue:interpolate({
			extrapolateLeft = "clamp",
			inputRange = { layoutY, layoutY + 1 },
			outputRange = { 0, 1 }
		}):interpolate({ inputRange = { 0, 1 }, outputRange = { 0, -1 } }), -p1.state.layoutHeight, 0) else nil)
	end
	local var5 = reactModule.Children.only(p1.props.children)
	
	return reactModule.createElement("AnimatedView", {
		collapsable = false,
		nativeID = p1.props.nativeID,
		onLayout = p1._onLayout,
		ref = p1._setComponentRef,
		style = {
			var5.props.style,
			var1.header,
			{ transform = { { translateY = p1._translateY } } }
		},
		passthroughAnimatedPropExplicitValues = if canonical and p1.state.translateY ~= nil then {
			style = { transform = { { translateY = p1.state.translateY } } }
		} else nil
	}, reactModule.cloneElement(var5, { onLayout = nil, style = var1.fill }))
end

var1 = styleSheetModule.create({
	header = { zIndex = 10, position = "relative" },
	fill = { flex = 1 }
})

return scrollViewStickyHeader