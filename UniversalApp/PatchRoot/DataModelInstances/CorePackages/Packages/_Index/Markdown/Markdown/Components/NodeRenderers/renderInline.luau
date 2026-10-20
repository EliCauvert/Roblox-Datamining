local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local _ = require(Markdown.Types)
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local InlineLayoutModule = require(Parent.InlineLayout)
local InlineLayout = InlineLayoutModule.Components.InlineLayout
local MergeContextsModule = require(Markdown.Utils.mergeContexts)
local IsInlineElement = InlineLayoutModule.Utils.isInlineElement

return function(p1, p2)
	-- upvalues: ReactModule (copy), InlineLayout (copy), DashModule (copy), MergeContextsModule (copy), IsInlineElement (copy)
	return ReactModule.createElement(InlineLayout, {
		VerticalPadding = UDim.new(0, 0),
		Elements = DashModule.filter(p2.processChildren(p1, MergeContextsModule(p2, { isInline = true })), IsInlineElement)
	})
end