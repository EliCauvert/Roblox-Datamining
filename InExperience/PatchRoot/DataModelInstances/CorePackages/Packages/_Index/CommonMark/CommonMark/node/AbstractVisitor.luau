local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.node.BlockQuote)
local _ = require(CommonMark.node.BulletList)
local _ = require(CommonMark.node.Code)
local _ = require(CommonMark.node.CustomBlock)
local _ = require(CommonMark.node.CustomNode)
local _ = require(CommonMark.node.Document)
local _ = require(CommonMark.node.Emphasis)
local _ = require(CommonMark.node.FencedCodeBlock)
local _ = require(CommonMark.node.HardLineBreak)
local _ = require(CommonMark.node.Heading)
local _ = require(CommonMark.node.HtmlBlock)
local _ = require(CommonMark.node.HtmlInline)
local _ = require(CommonMark.node.Image)
local _ = require(CommonMark.node.IndentedCodeBlock)
local _ = require(CommonMark.node.Link)
local _ = require(CommonMark.node.LinkReferenceDefinition)
local _ = require(CommonMark.node.ListItem)
local _ = require(CommonMark.node.Node)
local _ = require(CommonMark.node.OrderedList)
local _ = require(CommonMark.node.Paragraph)
local _ = require(CommonMark.node.SoftLineBreak)
local _ = require(CommonMark.node.StrongEmphasis)
local _ = require(CommonMark.node.Text)
local _ = require(CommonMark.node.ThematicBreak)
local AbstractVisitorModule = {}
AbstractVisitorModule.__index = AbstractVisitorModule

function AbstractVisitorModule.visitBlockQuote(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitBulletList(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitCode(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitDocument(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitEmphasis(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitFencedCodeBlock(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitHardLineBreak(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitHeading(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitThematicBreak(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitHtmlInline(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitHtmlBlock(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitImage(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitIndentedCodeBlock(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitLink(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitListItem(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitOrderedList(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitParagraph(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitSoftLineBreak(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitStrongEmphasis(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitText(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitLinkReferenceDefinition(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitCustomBlock(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitCustomNode(p1, p2)
	p1:visitChildren(p2)
end

function AbstractVisitorModule.visitChildren(p1, p2)
	local FirstChild = p2:getFirstChild()
	while FirstChild ~= nil do
		local Next = FirstChild:getNext()
		FirstChild:accept(p1)
		FirstChild = Next
	end
end

return AbstractVisitorModule