local LinkedHashMap = require(script:FindFirstAncestor("Markdown").Parent.CommonMark).Renderer.Html.LinkedHashMap
local UnderlineHtmlNodeRendererModule = {}
UnderlineHtmlNodeRendererModule.__index = UnderlineHtmlNodeRendererModule

function UnderlineHtmlNodeRendererModule.new(_context)
	-- upvalues: UnderlineHtmlNodeRendererModule (copy)
	return (setmetatable({ _context = _context, _html = _context:getWriter() }, UnderlineHtmlNodeRendererModule))
end

function UnderlineHtmlNodeRendererModule:getNodeTypes()
	return { "Underline" }
end

function UnderlineHtmlNodeRendererModule:render(p1)
	-- upvalues: LinkedHashMap (copy)
	self._html:tag("u", (self._context:extendAttributes(p1, "u", LinkedHashMap.of())))
	self:renderChildren(p1)
	self._html:tag("/u")
end

function UnderlineHtmlNodeRendererModule:renderChildren(p1)
	local FirstChild = p1:getFirstChild()
	while FirstChild ~= nil do
		local Next = FirstChild:getNext()
		self._context:render(FirstChild)
		FirstChild = Next
	end
end

return UnderlineHtmlNodeRendererModule