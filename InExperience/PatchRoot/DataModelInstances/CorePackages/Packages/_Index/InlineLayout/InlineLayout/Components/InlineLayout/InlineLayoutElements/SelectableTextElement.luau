local parent = script:FindFirstAncestor("Components").Parent
local parent_1 = parent.Parent
local inlineLayoutElements = script:FindFirstAncestor("InlineLayoutElements")
local dashModule = require(parent_1.Dash)
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local baseTextElementModule = require(inlineLayoutElements.BaseTextElement)
local getFontFaceModule = require(parent.Utils.getFontFace)
local view = foundationModule.View
local t = {}

function mapProps(p1)
	-- upvalues: dashModule (ref)
	return dashModule.omit(p1, { "id", "EngineTags" })
end

local function TextElementWrapper(p1)
	-- upvalues: getFontFaceModule (ref), reactModule (ref), view (ref), dashModule (ref)
	local var1 = if typeof(p1.textStyle) == "table" then p1.textStyle else {}
	
	return reactModule.createElement(view, {
		tag = dashModule.join({ ["size-0-0 auto-xy"] = true }, if typeof(p1.viewTags) == "string" then { [p1.viewTags] = true } else p1.viewTags or {}),
		LayoutOrder = p1.LayoutOrder
	}, {
		SelectableText = reactModule.createElement("TextBox", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextEditable = false,
			ZIndex = 0,
			TextWrapped = false,
			ClearTextOnFocus = false,
			RichText = false,
			Text = p1.Text,
			FontFace = getFontFaceModule(p1.fontStyle),
			TextSize = p1.fontStyle and p1.fontStyle.FontSize,
			TextColor3 = var1.Color3,
			TextTransparency = var1.Transparency,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
end

function t.new(p1)
	-- upvalues: baseTextElementModule (ref), TextElementWrapper (ref), dashModule (ref)
	return baseTextElementModule.new(TextElementWrapper, dashModule.omit(p1, { "EngineTags" }), mapProps)
end

return t