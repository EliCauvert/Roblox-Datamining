local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

local function _(Text: string): string
	return (Text:gsub("[&<>]", { ["&"] = "&amp;", ["<"] = "&lt;", [">"] = "&gt;" }))
end

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.List.Item, {
		title = Frame.title,
		description = if Frame.description then Frame.description:gsub("[&<>]", { ["&"] = "&amp;", ["<"] = "&lt;", [">"] = "&gt;" }) else nil,
		trailing = Frame.trailing,
		onActivated = Frame.onClick,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end