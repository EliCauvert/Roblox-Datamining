local TextService = game:GetService("TextService")
local UserInputService = game:GetService("UserInputService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local WithStyleFunction = UIBlox.Core.Style.withStyle
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local GlobalConfigModule = require(Parent.GlobalConfig)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local config = {
	[Enum.KeyCode.Escape] = { text = "ESC", fontKey = "Footer", width = 36 },
	[Enum.KeyCode.Space] = { text = "Space", width = 92 },
	[Enum.KeyCode.LeftShift] = {
		text = "Shift",
		width = 66,
		alignment = Enum.TextXAlignment.Left
	},
	[Enum.KeyCode.LeftControl] = {
		text = "Ctrl",
		width = 66,
		alignment = Enum.TextXAlignment.Left
	},
	[Enum.KeyCode.LeftSuper] = { text = "Command" },
	[Enum.KeyCode.LeftMeta] = { text = "fn" },
	[Enum.KeyCode.LeftAlt] = { text = "Opt" },
	[Enum.KeyCode.Tilde] = { text = "~", fontKey = "CaptionHeader" },
	[Enum.KeyCode.F10] = { fontKey = "CaptionHeader", width = 36 },
	[Enum.KeyCode.F11] = { fontKey = "CaptionHeader", width = 36 },
	[Enum.KeyCode.Up] = { image = AssetsModule.Images.UpArrow },
	[Enum.KeyCode.Down] = { image = AssetsModule.Images.DownArrow },
	[Enum.KeyCode.Left] = { image = AssetsModule.Images.LeftArrow },
	[Enum.KeyCode.Right] = { image = AssetsModule.Images.RightArrow }
}
local StrictInterfaceResult = T.strictInterface({
	input = T.enum(Enum.KeyCode),
	borderThemeKey = T.optional(T.string),
	textThemeKey = T.optional(T.string),
	AnchorPoint = T.optional(T.Vector2),
	Position = T.optional(T.UDim2),
	LayoutOrder = T.optional(T.integer),
	ZIndex = T.optional(T.integer)
})

local function getLabelWidthAndContent(Input, p1, TextThemeKey) --[[ Line: 71 ]]
	-- upvalues: config (copy), Roact (copy), ImageSetLabel (copy), UserInputService (copy), TextService (copy), ThemedTextLabelModule (copy)
	local Entry = config[Input]
	
	if Entry and Entry.image then
		return 36, (Roact.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = Entry.image,
			ImageColor3 = p1.Theme.IconEmphasis.Color,
			ImageTransparency = p1.Theme.IconEmphasis.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, -1),
			Size = UDim2.new(0, 16, 0, 16)
		}))
	end
	local Alignment = nil
	local StringForKeyCode = UserInputService:GetStringForKeyCode(Input)
	local Text = if Entry and Entry.text then Entry.text elseif StringForKeyCode and StringForKeyCode ~= "" then StringForKeyCode else Input.Name
	local IsLengthBelow = Text:len() < 3
	local FontKey = if Entry and Entry.fontKey then Entry.fontKey elseif IsLengthBelow then "CaptionHeader" else "Footer"
	local Width = nil
	
	if Entry and Entry.width then
		Width = Entry.width
	elseif IsLengthBelow then
		Width = 36
	else
		local v1 = p1.Font[FontKey]
		Width = TextService:GetTextSize(Text, v1.RelativeSize * p1.Font.BaseSize, v1.Font, Vector2.new(1e999, 36)).X + 28
	end
	if Entry and Entry.alignment then
		Alignment = Entry.alignment
	end
	return Width, Roact.createElement(ThemedTextLabelModule, {
		fontKey = FontKey,
		themeKey = TextThemeKey or "TextEmphasis",
		Text = Text,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, -1),
		TextXAlignment = Alignment
	}), Alignment
end

return function(Frame: Frame) --[[ Line: 142 | Named "KeyLabel" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithStyleFunction (copy), getLabelWidthAndContent (copy), Roact (copy), ImageSetLabel (copy), AssetsModule (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return WithStyleFunction(function(p1) --[[ Line: 147 ]]
		-- upvalues: Frame (copy), getLabelWidthAndContent (upval), Roact (upval), ImageSetLabel (upval), AssetsModule (upval)
		local ThemeEntry = p1.Theme[Frame.borderThemeKey or "UIEmphasis"]
		local LabelWidthAndContent, LabelWidthAndContent2, LabelWidthAndContent3 = getLabelWidthAndContent(Frame.input, p1, Frame.textThemeKey)
		local Offset = if LabelWidthAndContent3 then 9 else nil
		
		return Roact.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			ImageTransparency = ThemeEntry.Transparency,
			ImageColor3 = ThemeEntry.Color,
			Image = AssetsModule.Images.KeyBorder,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(9, 7), Vector2.new(26, 26)),
			Size = UDim2.new(0, LabelWidthAndContent, 0, 36),
			Position = Frame.Position,
			AnchorPoint = Frame.AnchorPoint,
			LayoutOrder = Frame.LayoutOrder,
			ZIndex = Frame.ZIndex
		}, {
			Padding = Offset and Roact.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset)
			}),
			LabelContent = LabelWidthAndContent2
		})
	end)
end