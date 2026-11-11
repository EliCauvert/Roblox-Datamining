local Parent = script:FindFirstAncestor("Components").Parent
local Parent1 = Parent.Parent
local DashModule = require(Parent1.Dash)
local ReactModule = require(Parent1.React)
local BaseTextElementModule = require(script:FindFirstAncestor("InlineLayoutElements").BaseTextElement)
local GetFontFaceModule = require(Parent.Utils.getFontFace)
local View = require(Parent1.Foundation).View

function mapProps(p1)
	-- upvalues: DashModule (copy)
	return DashModule.omit(p1, { "id", "EngineTags" })
end

local function TextElementWrapper(Frame)
	-- upvalues: GetFontFaceModule (copy), ReactModule (copy), View (copy), DashModule (copy)
	local TextStyle = if typeof(Frame.textStyle) == "table" then Frame.textStyle else {}
	
	return ReactModule.createElement(View, {
		tag = DashModule.join({ ["size-0-0 auto-xy"] = true }, typeof(Frame.viewTags) == "string" and { [Frame.viewTags] = true } or (Frame.viewTags or {})),
		LayoutOrder = Frame.LayoutOrder
	}, {
		SelectableText = ReactModule.createElement("TextBox", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextEditable = false,
			ZIndex = 0,
			TextWrapped = false,
			ClearTextOnFocus = false,
			RichText = false,
			Text = Frame.Text,
			FontFace = GetFontFaceModule(Frame.fontStyle),
			TextSize = Frame.fontStyle and Frame.fontStyle.FontSize,
			TextColor3 = TextStyle.Color3,
			TextTransparency = TextStyle.Transparency,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
end

return {
	new = function(TextElementWrapper1)
		-- upvalues: BaseTextElementModule (copy), TextElementWrapper (copy), DashModule (copy)
		return BaseTextElementModule.new(TextElementWrapper, DashModule.omit(TextElementWrapper1, { "EngineTags" }), mapProps)
	end
}