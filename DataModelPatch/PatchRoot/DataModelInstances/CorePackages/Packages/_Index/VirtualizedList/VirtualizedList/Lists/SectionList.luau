local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local ReactModule = require(Parent1.React)
local VirtualizedSectionListModule = require(script.Parent.VirtualizedSectionList)
local _ = require(Parent.Components.ScrollView.ScrollView)
local SectionList = ReactModule.PureComponent:extend("SectionList")

function SectionList.init(p1, Props)
	p1.props = Props
	
	function p1._captureRef(_wrapperListRef)
		-- upvalues: p1 (copy)
		p1._wrapperListRef = _wrapperListRef
	end
end

function SectionList.scrollToLocation(p1, p2)
	if p1._wrapperListRef ~= nil then
		p1._wrapperListRef:scrollToLocation(p2)
	end
end

function SectionList.recordInteraction(p1)
	local ListRef = if p1._wrapperListRef then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	if ListRef then
		ListRef:recordInteraction()
	end
end

function SectionList.flashScrollIndicators(p1)
	local ListRef = if p1._wrapperListRef then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	if ListRef then
		ListRef:flashScrollIndicators()
	end
end

function SectionList.getScrollResponder(p1)
	-- upvalues: Boolean (copy)
	local ListRef = if p1._wrapperListRef then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	return if Boolean.toJSBoolean(ListRef) then ListRef:getScrollResponder() else nil
end

function SectionList.getScrollableNode(p1)
	-- upvalues: Boolean (copy)
	local ListRef = if p1._wrapperListRefthen then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	return if Boolean.toJSBoolean(ListRef) then ListRef:getScrollableNode() else nil
end

function SectionList.setNativeProps(p1, p2)
	-- upvalues: Boolean (copy)
	local ListRef = if p1._wrapperListRef then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	if Boolean.toJSBoolean(ListRef) then
		ListRef:setNativeProps(p2)
	end
end

function SectionList.render(p1)
	-- upvalues: Object (copy), ReactModule (copy), VirtualizedSectionListModule (copy)
	local StickySectionHeadersEnabled = p1.props.stickySectionHeadersEnabled
	
	return ReactModule.createElement(VirtualizedSectionListModule, Object.assign({}, Object.assign({}, p1.props, { stickySectionHeadersEnabled = Object.None }), {
		stickySectionHeadersEnabled = StickySectionHeadersEnabled ~= nil and StickySectionHeadersEnabled,
		ref = p1._captureRef,
		getItemCount = function(p2): number
			return #p2
		end,
		getItem = function(p2, p3)
			return p2[p3]
		end
	}))
end

return { default = SectionList }