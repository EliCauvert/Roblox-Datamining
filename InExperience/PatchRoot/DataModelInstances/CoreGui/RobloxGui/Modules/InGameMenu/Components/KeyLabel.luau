local textService = game:GetService("TextService")
local userInputService = game:GetService("UserInputService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local t_1 = {
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
	[Enum.KeyCode.Up] = { image = assetsModule.Images.UpArrow },
	[Enum.KeyCode.Down] = { image = assetsModule.Images.DownArrow },
	[Enum.KeyCode.Left] = { image = assetsModule.Images.LeftArrow },
	[Enum.KeyCode.Right] = { image = assetsModule.Images.RightArrow }
}
local var1 = t.strictInterface({
	input = t.enum(Enum.KeyCode),
	borderThemeKey = t.optional(t.string),
	textThemeKey = t.optional(t.string),
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	LayoutOrder = t.optional(t.integer),
	ZIndex = t.optional(t.integer)
})

local function getLabelWidthAndContent(p1, p2, p3)
	-- upvalues: t_1 (ref), roact (ref), imageSetLabel (ref), userInputService (ref), textService (ref), themedTextLabelModule (ref)
	local var2 = t_1[p1]
	
	if var2 and var2.image then
		return 36, roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = var2.image,
			ImageColor3 = p2.Theme.IconEmphasis.Color,
			ImageTransparency = p2.Theme.IconEmphasis.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, -1),
			Size = UDim2.new(0, 16, 0, 16)
		})
	end
	local var3
	local _ = nil
	local _ = nil
	local _ = nil
	local alignment = nil
	local var4 = userInputService:GetStringForKeyCode(p1)
	local var5 = if var2 and var2.text then var2.text elseif var4 and var4 ~= "" then var4 else p1.Name
	local var6 = var5:len() < 3
	local var7 = if var2 and var2.fontKey then var2.fontKey elseif var6 then "CaptionHeader" else "Footer"
	
	if var2 and var2.width then
		var3 = var2.width
	elseif var6 then
		var3 = 36
	else
		local var8 = p2.Font[var7]
		var3 = textService:GetTextSize(var5, var8.RelativeSize * p2.Font.BaseSize, var8.Font, Vector2.new(1e999, 36)).X + 28
	end
	if var2 and var2.alignment then
		alignment = var2.alignment
	end
	return var3, roact.createElement(themedTextLabelModule, {
		fontKey = var7,
		themeKey = p3 or "TextEmphasis",
		Text = var5,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, -1),
		TextXAlignment = alignment
	}), alignment
end

return function(p1)
	-- upvalues: globalConfigModule (ref), var1 (ref), withStyle (ref), getLabelWidthAndContent (ref), roact (ref), imageSetLabel (ref), assetsModule (ref)
	if globalConfigModule.propValidation then
		assert(var1(p1))
	end
	return withStyle(function(p2)
		-- upvalues: p1 (ref), getLabelWidthAndContent (copy), roact (copy), imageSetLabel (copy), assetsModule (copy)
		local var2 = p2.Theme[p1.borderThemeKey or "UIEmphasis"]
		local var3, var4, var5 = getLabelWidthAndContent(p1.input, p2, p1.textThemeKey)
		local var6 = if var5 then 9 else nil
		
		return roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ImageTransparency = var2.Transparency,
			ImageColor3 = var2.Color,
			Image = assetsModule.Images.KeyBorder,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(9, 7), Vector2.new(26, 26)),
			Size = UDim2.new(0, var3, 0, 36),
			Position = p1.Position,
			AnchorPoint = p1.AnchorPoint,
			LayoutOrder = p1.LayoutOrder,
			ZIndex = p1.ZIndex
		}, {
			Padding = var6 and roact.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var6),
				PaddingRight = UDim.new(0, var6)
			}),
			LabelContent = var4
		})
	end)
end