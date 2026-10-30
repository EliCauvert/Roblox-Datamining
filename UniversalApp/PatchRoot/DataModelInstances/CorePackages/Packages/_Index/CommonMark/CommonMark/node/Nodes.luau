local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.node.CustomBlock)
local _ = require(CommonMark.node.CustomNode)
local _ = require(CommonMark.node.Delimited)
local _ = require(CommonMark.node.ListBlock)
local _ = require(CommonMark.node.Node)

return {
	BlockQuote = require(CommonMark.node.BlockQuote),
	BulletList = require(CommonMark.node.BulletList),
	Code = require(CommonMark.node.Code),
	Document = require(CommonMark.node.Document),
	Emphasis = require(CommonMark.node.Emphasis),
	FencedCodeBlock = require(CommonMark.node.FencedCodeBlock),
	HardLineBreak = require(CommonMark.node.HardLineBreak),
	Heading = require(CommonMark.node.Heading),
	HtmlBlock = require(CommonMark.node.HtmlBlock),
	HtmlInline = require(CommonMark.node.HtmlInline),
	Image = require(CommonMark.node.Image),
	IndentedCodeBlock = require(CommonMark.node.IndentedCodeBlock),
	Link = require(CommonMark.node.Link),
	LinkReferenceDefinition = require(CommonMark.node.LinkReferenceDefinition),
	ListItem = require(CommonMark.node.ListItem),
	OrderedList = require(CommonMark.node.OrderedList),
	Paragraph = require(CommonMark.node.Paragraph),
	SoftLineBreak = require(CommonMark.node.SoftLineBreak),
	StrongEmphasis = require(CommonMark.node.StrongEmphasis),
	Text = require(CommonMark.node.Text),
	ThematicBreak = require(CommonMark.node.ThematicBreak),
	between = function(p1, Next)
		local Next1 = p1:getNext()
		
		return function()
			-- upvalues: Next1 (ref), Next (copy)
			if Next1 == nil or Next1 == Next then
				return nil
			else
				local Next2 = Next1
				Next1 = Next2:getNext()
				
				return Next2
			end
		end
	end
}