local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.renderer.html.HtmlNodeRendererContext)
local _ = require(CommonMark.renderer.html.HtmlWriter)
local LinkedHashMapModule = require(CommonMark.internal.port.LinkedHashMap)
local _ = require(CommonMark.node.Node)
local self = setmetatable({}, {
	__index = require(CommonMark.ext.gfm.strikethrough.internal.StrikethroughNodeRenderer)
})
self.__index = self

function self.new(_context)
	-- upvalues: self (copy)
	return (setmetatable({ _context = _context, _html = _context:getWriter() }, self))
end

function self:render(p1)
	-- upvalues: LinkedHashMapModule (copy)
	self._html:tag("del", (self._context:extendAttributes(p1, "del", LinkedHashMapModule.of())))
	self:renderChildren(p1)
	self._html:tag("/del")
end

function self:renderChildren(p1)
	local FirstChild = p1:getFirstChild()
	while FirstChild ~= nil do
		local Next = FirstChild:getNext()
		self._context:render(FirstChild)
		FirstChild = Next
	end
end

return self