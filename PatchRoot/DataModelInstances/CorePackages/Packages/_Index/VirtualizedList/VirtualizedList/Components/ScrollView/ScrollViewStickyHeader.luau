-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local t = {
	new = function(...) --[[ line: 29 ]]
		return nil
	end
}
local t_1 = {
	new = function(...) --[[ line: 35 ]]
		return nil
	end
}
local reactModule = require(parent_1.React)
local styleSheetModule = require(parent.StyleSheet.StyleSheet)
local _ = { OS = "roblox" }
local var5 = nil
local scrollViewStickyHeader = reactModule.Component:extend("ScrollViewStickyHeader")

function scrollViewStickyHeader.init(p0, p1) --[[ line: 108 ]]
	-- upvalues: reactModule (ref)
	warn("ScrollViewStickyHeader not fully implemented")
	p0.props = p1
	p0.state = {
		measured = false,
		layoutY = 0,
		layoutHeight = 0,
		translateY = nil,
		nextHeaderLayoutY = p0.props.nextHeaderLayoutY
	}
	p0._translateY = nil
	p0._shouldRecreateTranslateY = true
	p0._haveReceivedInitialZeroTranslateY = true
	p0._debounceTimeout = 64
	
	function p0.setNextHeaderY(_, p2) --[[ line: 130 ]]
		-- upvalues: p0 (ref)
		p0._shouldRecreateTranslateY = true
		p0.setState({ nextHeaderLayoutY = p2 })
	end
	
	function p0._onLayout(_, p3) --[[ line: 135 ]]
		-- upvalues: p0 (ref), reactModule (copy)
		local y = p3.nativeEvent.layout.y
		local height = p3.nativeEvent.layout.height
		
		if y ~= p0.state.layoutY or height ~= p0.state.layoutHeight or p0.state.measured ~= true then
			p0._shouldRecreateTranslateY = true
		end
		p0:setState({ measured = true, layoutY = y, layoutHeight = height })
		p0.props:onLayout(p3)
		local var7 = reactModule.Children.only(p0.props.children)
		
		if var7.props.onLayout then
			var7.props:onLayout(p3)
		end
	end
	
	function p0._setComponentRef(_, p4) --[[ line: 154 ]]
		-- upvalues: p0 (ref)
		p0._ref = p4
	end
end

function scrollViewStickyHeader.componentWillUnmount(p5) --[[ line: 159 ]]
	-- upvalues: boolean (ref), clearTimeout (ref)
	if p5._translateY ~= nil and p5._animatedValueListenerId ~= nil then
		p5._translateY:removeListener(p5._animatedValueListenerId)
	end
	if boolean.toJSBoolean(p5._timer) then
		clearTimeout(p5._timer)
	end
end

function scrollViewStickyHeader.UNSAFE_componentWillReceiveProps(p6, p7) --[[ line: 168 ]]
	if p7.scrollViewHeight ~= p6.props.scrollViewHeight or p7.scrollAnimatedValue ~= p6.props.scrollAnimatedValue or p7.inverted ~= p6.props.inverted then
		p6._shouldRecreateTranslateY = true
	end
end

function scrollViewStickyHeader.updateTranslateListener(p8, p9, p10, p11) --[[ line: 178 ]]
	-- upvalues: boolean (ref), t (ref), clearTimeout (ref), setTimeout (ref)
	if p8._translateY ~= nil and p8._animatedValueListenerId ~= nil then
		p8._translateY:removeListener(p8._animatedValueListenerId)
	end
	p8.translateY = if boolean.toJSBoolean(p11) then t.new(p9, p11) else p9
	p8._shouldRecreateTranslateY = false
	
	if not p10 then return end
	if not p8._animatedValueListener then
		function p8._animatedValueListener(p12) --[[ line: 209 ]]
			-- upvalues: p8 (ref), boolean (copy), clearTimeout (copy), setTimeout (copy)
			local value = p12.value
			
			if value == 0 and not p8._haveReceivedInitialZeroTranslateY then
				p8._haveReceivedInitialZeroTranslateY = true
				
				return
			elseif boolean.toJSBoolean(p8._timer) then
				clearTimeout(p8._timer)
			end
			p8._timer = setTimeout(function() --[[ line: 220 ]]
				-- upvalues: value (ref), p8 (copy)
				if value ~= p8.state.translateY then
					p8:setState({ translateY = value })
				end
			end, p8._debounceTimeout)
		end
	end
	if p8.state.translateY ~= 0 and p8.state.translateY ~= nil then
		p8._haveReceivedInitialZeroTranslateY = false
	end
	p8._animatedValueListenerId = p9:addListener(p8._animatedValueListener)
end

function scrollViewStickyHeader.render(p13) --[[ line: 233 ]]
	-- upvalues: boolean (ref), t_1 (ref), reactModule (ref), var5 (write)
	local canonical = p13._ref and (p13._ref._internalInstanceHandle and (p13._ref._internalInstanceHandle.stateNode and boolean.toJSBoolean(p13._ref._internalInstanceHandle.stateNode.canonical)))
	
	if p13._shouldRecreateTranslateY then
		local inverted = p13.props.inverted
		local scrollViewHeight = p13.props.scrollViewHeight
		local measured = p13.state.measured
		local layoutHeight = p13.state.layoutHeight
		local layoutY = p13.state.layoutY
		local nextHeaderLayoutY = p13.state.nextHeaderLayoutY
		local list = { -1, 0 }
		local list_1 = { 0, 0 }
		
		if measured then
			if not inverted then
				table.insert(list, layoutY)
				table.insert(list_1, 0)
				local var13 = (nextHeaderLayoutY or 0) - layoutHeight
				
				if layoutY <= var13 then
					table.insert(list, var13)
					table.insert(list, var13 + 1)
					table.insert(list_1, var13 - layoutY)
					table.insert(list_1, var13 - layoutY)
				else
					table.insert(list, layoutY + 1)
					table.insert(list_1, 1)
				end
			elseif scrollViewHeight ~= nil then
				local var11 = layoutY + layoutHeight - scrollViewHeight
				
				if var11 > 0 then
					table.insert(list, var11)
					table.insert(list_1, 0)
					table.insert(list, var11 + 1)
					table.insert(list_1, 1)
					local var12 = (nextHeaderLayoutY or 0) - layoutHeight - scrollViewHeight
					
					if var11 < var12 then
						table.insert(list, var12)
						table.insert(list, var12 + 1)
						table.insert(list_1, var12 - var11)
						table.insert(list_1, var12 - var11)
					end
				end
			end
		end
		p13:updateTranslateListener(p13.props.scrollAnimatedValue:interpolate({ inputRange = list, outputRange = list_1 }), canonical, if p13.props.hiddenOnScroll then t_1.new(p13.props.scrollAnimatedValue:interpolate({
			extrapolateLeft = "clamp",
			inputRange = { layoutY, layoutY + 1 },
			outputRange = { 0, 1 }
		}):interpolate({ inputRange = { 0, 1 }, outputRange = { 0, -1 } }), -p13.state.layoutHeight, 0) else nil)
	end
	local var14 = reactModule.Children.only(p13.props.children)
	
	return reactModule.createElement("AnimatedView", {
		collapsable = false,
		nativeID = p13.props.nativeID,
		onLayout = p13._onLayout,
		ref = p13._setComponentRef,
		style = {
			var14.props.style,
			var5.header,
			{ transform = { { translateY = p13._translateY } } }
		},
		passthroughAnimatedPropExplicitValues = if canonical and p13.state.translateY ~= nil then {
			style = { transform = { { translateY = p13.state.translateY } } }
		} else nil
	}, reactModule.cloneElement(var14, { onLayout = nil, style = var5.fill }))
end

var5 = styleSheetModule.create({
	header = { zIndex = 10, position = "relative" },
	fill = { flex = 1 }
})

return scrollViewStickyHeader