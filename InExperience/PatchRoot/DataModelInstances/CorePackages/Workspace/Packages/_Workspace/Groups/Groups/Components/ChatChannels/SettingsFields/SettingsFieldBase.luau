local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local EscapeRichTextModule = require(script.Parent.Parent.escapeRichText)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), EscapeRichTextModule (copy)
	return ReactModule.createElement(FoundationModule.List.Item, {
		title = Frame.title,
		description = if Frame.description then EscapeRichTextModule(Frame.description) else nil,
		trailing = Frame.trailing,
		onActivated = Frame.onClick,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end