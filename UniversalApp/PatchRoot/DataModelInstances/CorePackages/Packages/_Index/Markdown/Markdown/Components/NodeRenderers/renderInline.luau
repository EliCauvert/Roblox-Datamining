local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local _ = require(Markdown.Types)
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local InlineLayoutModule = require(Parent.InlineLayout)
local Flags = require(Parent.MarkdownCore).Flags
local InlineLayout = InlineLayoutModule.Components.InlineLayout
local MergeContextsModule = require(Markdown.Utils.mergeContexts)
local IsInlineElement = InlineLayoutModule.Utils.isInlineElement

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), InlineLayout (copy), Flags (copy), DashModule (copy), MergeContextsModule (copy), IsInlineElement (copy)
	return ReactModule.createElement(InlineLayout, {
		HorizontalAlignment = if Flags.FFlagMarkdownTables then p3 else nil,
		VerticalPadding = UDim.new(0, 0),
		Elements = DashModule.filter(p2.processChildren(p1, MergeContextsModule(p2, { isInline = true })), IsInlineElement)
	})
end