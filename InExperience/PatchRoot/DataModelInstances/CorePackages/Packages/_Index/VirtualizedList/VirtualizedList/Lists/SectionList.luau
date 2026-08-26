local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local _ = { OS = "roblox" }
local reactModule = require(parent_1.React)
local virtualizedSectionListModule = require(script.Parent.VirtualizedSectionList)
local _ = require(parent.Components.ScrollView.ScrollView)
local sectionList = reactModule.PureComponent:extend("SectionList")

function sectionList.init(p1, p2)
	p1.props = p2
	
	function p0._captureRef(p3)
		-- upvalues: p1 (ref)
		p1._wrapperListRef = p3
	end
end

function sectionList.scrollToLocation(p1, p2)
	if p1._wrapperListRef ~= nil then
		p1._wrapperListRef:scrollToLocation(p2)
	end
end

function sectionList.recordInteraction(p1)
	local var1 = if p1._wrapperListRef then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	if var1 then
		var1:recordInteraction()
	end
end

function sectionList.flashScrollIndicators(p1)
	local var1 = if p1._wrapperListRef then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	if var1 then
		var1:flashScrollIndicators()
	end
end

function sectionList.getScrollResponder(p1)
	-- upvalues: boolean (ref)
	local var1 = if p1._wrapperListRef then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	return if boolean.toJSBoolean(var1) then var1:getScrollResponder() else nil
end

function sectionList.getScrollableNode(p1)
	-- upvalues: boolean (ref)
	local var1 = if p1._wrapperListRefthen then p1._wrapperListRef:getListRef() else p1._wrapperListRef
	
	return if boolean.toJSBoolean(var1) then var1:getScrollableNode() else nil
end

function sectionList.setNativeProps(value, p1)
	-- upvalues: boolean (ref)
	local var1 = if value._wrapperListRef then value._wrapperListRef:getListRef() else value._wrapperListRef
	
	if boolean.toJSBoolean(var1) then
		var1:setNativeProps(p1)
	end
end

function sectionList.render(p1)
	-- upvalues: object (ref), reactModule (ref), virtualizedSectionListModule (ref)
	local stickySectionHeadersEnabled = p1.props.stickySectionHeadersEnabled
	
	return reactModule.createElement(virtualizedSectionListModule, object.assign({}, object.assign({}, p1.props, { stickySectionHeadersEnabled = object.None }), {
		stickySectionHeadersEnabled = if stickySectionHeadersEnabled ~= nil then false else stickySectionHeadersEnabled,
		ref = p1._captureRef,
		getItemCount = function(p2)
			return #p2
		end,
		getItem = function(p2, p3)
			return p2[p3]
		end
	}))
end

t.default = sectionList

return t