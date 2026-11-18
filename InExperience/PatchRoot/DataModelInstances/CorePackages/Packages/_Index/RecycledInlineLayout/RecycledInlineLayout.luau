local _ = require(script.Types)
local ImageModule = require(script.Leaves.Image)
local LinkModule = require(script.Spans.Link)
local _ = require(script.Utils.RichText)
local SelectableTextModule = require(script.Leaves.SelectableText)
local _ = require(script.Utils.SplitText)
local TextModule = require(script.Leaves.Text)
local ToolkitModule = require(script.Toolkit)
local _ = require(script.Definitions.defineDecoration)
local _ = require(script.Definitions.defineLeaf)
local _ = require(script.Definitions.defineSpan)

return {
	isSupported = require(script.Parent.ViewRecyclerReact).useRectPlacement ~= nil,
	InlineLayout = require(script.Components.InlineLayout),
	RecyclingScope = require(script.Components.RecyclingScope).RecyclingScope,
	Text = TextModule.Text,
	SelectableText = SelectableTextModule.SelectableText,
	Image = ImageModule.Image,
	Link = LinkModule.Link,
	HardBreak = require(script.Definitions.HardBreak),
	isElement = require(script.Definitions.isElement),
	measureNaturalWidth = require(script.Layout.measureNaturalWidth),
	definitions = {
		Text = TextModule.definition,
		SelectableText = SelectableTextModule.definition,
		Image = ImageModule.definition,
		Link = LinkModule.definition,
		LinkDecoration = LinkModule.LinkDecoration
	},
	defineLeaf = ToolkitModule.defineLeaf,
	defineSpan = ToolkitModule.defineSpan,
	defineDecoration = ToolkitModule.defineDecoration,
	useReportedSize = ToolkitModule.useReportedSize,
	useReportedFrameSize = ToolkitModule.useReportedFrameSize,
	TextLeaf = ToolkitModule.TextLeaf,
	RichText = ToolkitModule.RichText,
	SplitText = ToolkitModule.SplitText,
	Utils = ToolkitModule.Utils
}