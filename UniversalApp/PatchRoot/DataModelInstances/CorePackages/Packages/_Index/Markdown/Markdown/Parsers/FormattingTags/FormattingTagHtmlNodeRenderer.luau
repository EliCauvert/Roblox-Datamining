local _ = require(script.Parent.FormattingTag)
local LinkedHashMap = require(script:FindFirstAncestor("Markdown").Parent.CommonMark).Renderer.Html.LinkedHashMap
local Frozen = table.freeze({ b = "strong", i = "em", u = "u", s = "del" })
local FormattingTagHtmlNodeRendererModule = {}
FormattingTagHtmlNodeRendererModule.__index = FormattingTagHtmlNodeRendererModule

function FormattingTagHtmlNodeRendererModule.new(_context)
	-- upvalues: FormattingTagHtmlNodeRendererModule (copy)
	return (setmetatable({ _context = _context, _html = _context:getWriter() }, FormattingTagHtmlNodeRendererModule))
end

function FormattingTagHtmlNodeRendererModule:getNodeTypes()
	return { "FormattingTag", "FormattingTagText" }
end

function FormattingTagHtmlNodeRendererModule:render(p1)
	-- upvalues: Frozen (copy), LinkedHashMap (copy)
	if p1.kind == "FormattingTagText" then
		self._html:text(p1.literal)
		
		return
	else
		local FrozenEntry = Frozen[p1.tagName]
		self._html:tag(FrozenEntry, (self._context:extendAttributes(p1, FrozenEntry, LinkedHashMap.of())))
		self:renderChildren(p1)
		self._html:tag("/" .. FrozenEntry)
	end
end

function FormattingTagHtmlNodeRendererModule:renderChildren(p1)
	local FirstChild = p1:getFirstChild()
	while FirstChild ~= nil do
		local Next = FirstChild:getNext()
		self._context:render(FirstChild)
		FirstChild = Next
	end
end

return FormattingTagHtmlNodeRendererModule