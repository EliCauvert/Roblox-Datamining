local markdown = script:FindFirstAncestor("Markdown")
local parent = markdown.Parent
local _ = require(markdown.Types)
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local inlineLayoutModule = require(parent.InlineLayout)
local inlineLayout = inlineLayoutModule.Components.InlineLayout
local mergeContextsModule = require(markdown.Utils.mergeContexts)
local isInlineElement = inlineLayoutModule.Utils.isInlineElement

return function(p0, p1)
	-- upvalues: reactModule (ref), inlineLayout (ref), dashModule (ref), mergeContextsModule (ref), isInlineElement (ref)
	return reactModule.createElement(inlineLayout, {
		VerticalPadding = UDim.new(0, 0),
		Elements = dashModule.filter(p1.processChildren(p0, mergeContextsModule(p1, { isInline = true })), isInlineElement)
	})
end