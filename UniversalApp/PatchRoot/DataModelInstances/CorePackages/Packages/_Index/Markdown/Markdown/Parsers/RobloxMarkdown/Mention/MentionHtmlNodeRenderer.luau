local _ = require(script.Parent.Mention)
local LinkedHashMap = require(script:FindFirstAncestor("Markdown").Parent.CommonMark).Renderer.Html.LinkedHashMap
local MentionHtmlNodeRendererModule = {}
MentionHtmlNodeRendererModule.__index = MentionHtmlNodeRendererModule

function MentionHtmlNodeRendererModule.new(_context)
	-- upvalues: MentionHtmlNodeRendererModule (copy)
	return (setmetatable({ _context = _context, _html = _context:getWriter() }, MentionHtmlNodeRendererModule))
end

function MentionHtmlNodeRendererModule:getNodeTypes()
	return { "Mention" }
end

function MentionHtmlNodeRendererModule:render(p1)
	-- upvalues: LinkedHashMap (copy)
	local NewLinkedHashMap = LinkedHashMap.new()
	NewLinkedHashMap:put("id", p1.id)
	
	if p1.name ~= nil then
		NewLinkedHashMap:put("name", p1.name)
	end
	self._html:tag("mention", self._context:extendAttributes(p1, "mention", NewLinkedHashMap))
	self._html:tag("/mention")
end

return MentionHtmlNodeRendererModule