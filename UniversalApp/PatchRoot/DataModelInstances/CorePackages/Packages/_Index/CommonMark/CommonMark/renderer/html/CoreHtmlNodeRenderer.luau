local CommonMark = script:FindFirstAncestor("CommonMark")
local AbstractVisitorModule = require(CommonMark.node.AbstractVisitor)
local _ = require(CommonMark.renderer.html.HtmlNodeRendererContext)
local _ = require(CommonMark.renderer.html.HtmlWriter)
local LinkedHashMapModule = require(CommonMark.internal.port.LinkedHashMap)
local _ = require(CommonMark.node.Nodes)
local FindFunction = string.find
local SubFunction = string.sub
local self = setmetatable({}, { __index = AbstractVisitorModule })
self.__index = self

function self.new()
	-- upvalues: self (copy)
	return (setmetatable({ _n = 0, _sb = {} }, self))
end

function self:getAltText(): string
	return table.concat(self._sb)
end

local function _(p1)
	return if p1 == nil then "null" else p1
end

function self:visitText(p1)
	self._n += 1
	local Literal = p1.literal
	self._sb[self._n] = if Literal == nil then "null" else Literal
end

function self:visitCode(p1)
	self._n += 1
	local Literal = p1.literal
	self._sb[self._n] = if Literal == nil then "null" else Literal
end

function self:visitSoftLineBreak(_)
	self._n += 1
	self._sb[self._n] = "\n"
end

function self:visitHardLineBreak(_)
	self._n += 1
	self._sb[self._n] = "\n"
end

local self1 = setmetatable({}, { __index = AbstractVisitorModule })
self1.__index = self1

function self1.new(Context)
	-- upvalues: self1 (copy)
	return (setmetatable({ context = Context, _html = Context:getWriter() }, self1))
end

local Frozen = table.freeze({
	"Document", "Heading", "Paragraph", "BlockQuote", "BulletList",
	"FencedCodeBlock", "HtmlBlock", "ThematicBreak", "IndentedCodeBlock", "Link",
	"ListItem", "OrderedList", "Image", "Emphasis", "StrongEmphasis", "Text",
	"Code", "HtmlInline", "SoftLineBreak", "HardLineBreak"
})

function self1:getNodeTypes()
	-- upvalues: Frozen (copy)
	return Frozen
end

function self1.render(p1, p2)
	p2:accept(p1)
end

function self1:visitDocument(p1)
	self:visitChildren(p1)
end

function self1:visitHeading(p1)
	local Text: string = `h{p1.level}`
	self._html:line()
	self._html:tag(Text, self:getAttrs(p1, Text))
	self:visitChildren(p1)
	self._html:tag("/" .. Text)
	self._html:line()
end

function self1:visitParagraph(p1)
	local Parent = p1:getParent()
	local IsInTightList = self:isInTightList(p1) or self.context:shouldOmitSingleParagraphP() and (Parent ~= nil and (Parent.kind == "Document" and (p1:getPrevious() == nil and p1:getNext() == nil)))
	
	if not IsInTightList then
		self._html:line()
		self._html:tag("p", self:getAttrs(p1, "p"))
	end
	self:visitChildren(p1)
	
	if not IsInTightList then
		self._html:tag("/p")
		self._html:line()
	end
end

function self1:visitBlockQuote(p1)
	self._html:line()
	self._html:tag("blockquote", self:getAttrs(p1, "blockquote"))
	self._html:line()
	self:visitChildren(p1)
	self._html:line()
	self._html:tag("/blockquote")
	self._html:line()
end

function self1:visitBulletList(p1)
	self:renderListBlock(p1, "ul", self:getAttrs(p1, "ul"))
end

function self1:visitFencedCodeBlock(p1)
	-- upvalues: LinkedHashMapModule (copy), FindFunction (copy), SubFunction (copy)
	local Literal = p1.literal
	local NewLinkedHashMap = LinkedHashMapModule.new()
	local Info = p1.info
	
	if Info ~= nil and Info ~= "" then
		local v1 = (FindFunction(Info, " ", 1, true) or 0) - 1
		NewLinkedHashMap:put("class", "language-" .. (if v1 == -1 then Info else SubFunction(Info, 1, v1)))
	end
	self:renderCodeBlock(Literal, p1, NewLinkedHashMap)
end

function self1:visitHtmlBlock(p1)
	self._html:line()
	
	if self.context:shouldEscapeHtml() then
		self._html:tag("p", self:getAttrs(p1, "p"))
		self._html:text(p1.literal)
		self._html:tag("/p")
	else
		self._html:raw(p1.literal)
	end
	self._html:line()
end

function self1:visitThematicBreak(p1)
	self._html:line()
	self._html:tag("hr", self:getAttrs(p1, "hr"), true)
	self._html:line()
end

function self1:visitIndentedCodeBlock(p1)
	-- upvalues: LinkedHashMapModule (copy)
	self:renderCodeBlock(p1.literal, p1, LinkedHashMapModule.of())
end

function self1:visitLink(p1)
	-- upvalues: LinkedHashMapModule (copy)
	local NewLinkedHashMap = LinkedHashMapModule.new()
	local Destination = p1.destination
	
	if self.context:shouldSanitizeUrls() then
		Destination = self.context:urlSanitizer():sanitizeLinkUrl(Destination)
		NewLinkedHashMap:put("rel", "nofollow")
	end
	NewLinkedHashMap:put("href", (self.context:encodeUrl(Destination)))
	
	if p1.title ~= nil then
		NewLinkedHashMap:put("title", p1.title)
	end
	self._html:tag("a", self:getAttrs(p1, "a", NewLinkedHashMap))
	self:visitChildren(p1)
	self._html:tag("/a")
end

function self1:visitListItem(p1)
	self._html:tag("li", self:getAttrs(p1, "li"))
	self:visitChildren(p1)
	self._html:tag("/li")
	self._html:line()
end

function self1:visitOrderedList(p1)
	-- upvalues: LinkedHashMapModule (copy)
	local MarkerStartNumber = if p1.markerStartNumber == nil then 1 else p1.markerStartNumber
	local NewLinkedHashMap = LinkedHashMapModule.new()
	
	if MarkerStartNumber ~= 1 then
		NewLinkedHashMap:put("start", (tostring(MarkerStartNumber)))
	end
	self:renderListBlock(p1, "ol", self:getAttrs(p1, "ol", NewLinkedHashMap))
end

function self1:visitImage(p1)
	-- upvalues: self (copy), LinkedHashMapModule (copy)
	local Destination = p1.destination
	local NewResult = self.new()
	p1:accept(NewResult)
	local AltText = NewResult:getAltText()
	local NewLinkedHashMap = LinkedHashMapModule.new()
	
	if self.context:shouldSanitizeUrls() then
		Destination = self.context:urlSanitizer():sanitizeImageUrl(Destination)
	end
	NewLinkedHashMap:put("src", self.context:encodeUrl(Destination))
	NewLinkedHashMap:put("alt", AltText)
	
	if p1.title ~= nil then
		NewLinkedHashMap:put("title", p1.title)
	end
	self._html:tag("img", self:getAttrs(p1, "img", NewLinkedHashMap), true)
end

function self1:visitEmphasis(p1)
	self._html:tag("em", self:getAttrs(p1, "em"))
	self:visitChildren(p1)
	self._html:tag("/em")
end

function self1:visitStrongEmphasis(p1)
	self._html:tag("strong", self:getAttrs(p1, "strong"))
	self:visitChildren(p1)
	self._html:tag("/strong")
end

function self1:visitText(p1)
	self._html:text(p1.literal)
end

function self1:visitCode(p1)
	self._html:tag("code", self:getAttrs(p1, "code"))
	self._html:text(p1.literal)
	self._html:tag("/code")
end

function self1:visitHtmlInline(p1)
	if self.context:shouldEscapeHtml() then
		self._html:text(p1.literal)
		
		return
	else
		self._html:raw(p1.literal)
	end
end

function self1:visitSoftLineBreak(_)
	self._html:raw(self.context:getSoftbreak())
end

function self1:visitHardLineBreak(p1)
	self._html:tag("br", self:getAttrs(p1, "br"), true)
	self._html:line()
end

function self1:visitChildren(p1)
	local FirstChild = p1:getFirstChild()
	while FirstChild ~= nil do
		local Next = FirstChild:getNext()
		self.context:render(FirstChild)
		FirstChild = Next
	end
end

function self1:renderCodeBlock(Literal, p2, NewResult)
	self._html:line()
	self._html:tag("pre", self:getAttrs(p2, "pre"))
	self._html:tag("code", self:getAttrs(p2, "code", NewResult))
	self._html:text(Literal)
	self._html:tag("/code")
	self._html:tag("/pre")
	self._html:line()
end

function self1:renderListBlock(p2, Text, OlAttrs)
	self._html:line()
	self._html:tag(Text, OlAttrs)
	self._html:line()
	self:visitChildren(p2)
	self._html:line()
	self._html:tag("/" .. Text)
	self._html:line()
end

function self1:isInTightList(p2)
	local Parent = p2:getParent()
	
	if Parent ~= nil then
		local Parent1 = Parent:getParent()
		
		if Parent1 ~= nil and (Parent1.kind == "BulletList" or Parent1.kind == "OrderedList") then
			return Parent1.tight
		end
	end
	return false
end

function self1:getAttrs(p2, p3, NewResult)
	-- upvalues: LinkedHashMapModule (copy)
	return self.context:extendAttributes(p2, p3, if NewResult == nil then LinkedHashMapModule.of() else NewResult)
end

return self1