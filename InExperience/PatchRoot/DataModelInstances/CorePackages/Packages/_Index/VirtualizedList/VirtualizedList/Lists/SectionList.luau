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

function sectionList.init(p0, p1)
	p0.props = p1
	
	function p0._captureRef(p2)
		-- upvalues: p0 (ref)
		p0._wrapperListRef = p2
	end
end

function sectionList.scrollToLocation(p3, p4)
	if p3._wrapperListRef ~= nil then
		p3._wrapperListRef:scrollToLocation(p4)
	end
end

function sectionList.recordInteraction(p5)
	local var5 = if p5._wrapperListRef then p5._wrapperListRef:getListRef() else p5._wrapperListRef
	
	if var5 then
		var5:recordInteraction()
	end
end

function sectionList.flashScrollIndicators(p6)
	local var6 = if p6._wrapperListRef then p6._wrapperListRef:getListRef() else p6._wrapperListRef
	
	if var6 then
		var6:flashScrollIndicators()
	end
end

function sectionList.getScrollResponder(p7)
	-- upvalues: boolean (ref)
	local var7 = if p7._wrapperListRef then p7._wrapperListRef:getListRef() else p7._wrapperListRef
	
	return if boolean.toJSBoolean(var7) then var7:getScrollResponder() else nil
end

function sectionList.getScrollableNode(p8)
	-- upvalues: boolean (ref)
	local var8 = if p8._wrapperListRefthen then p8._wrapperListRef:getListRef() else p8._wrapperListRef
	
	return if boolean.toJSBoolean(var8) then var8:getScrollableNode() else nil
end

function sectionList.setNativeProps(value, p9)
	-- upvalues: boolean (ref)
	local var9 = if value._wrapperListRef then value._wrapperListRef:getListRef() else value._wrapperListRef
	
	if boolean.toJSBoolean(var9) then
		var9:setNativeProps(p9)
	end
end

function sectionList.render(p10)
	-- upvalues: object (ref), reactModule (ref), virtualizedSectionListModule (ref)
	local stickySectionHeadersEnabled = p10.props.stickySectionHeadersEnabled
	
	return reactModule.createElement(virtualizedSectionListModule, object.assign({}, object.assign({}, p10.props, { stickySectionHeadersEnabled = object.None }), {
		stickySectionHeadersEnabled = if stickySectionHeadersEnabled ~= nil then false else stickySectionHeadersEnabled,
		ref = p10._captureRef,
		getItemCount = function(p11)
			return #p11
		end,
		getItem = function(p12, p13)
			return p12[p13]
		end
	}))
end

t.default = sectionList

return t