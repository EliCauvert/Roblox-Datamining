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
local var7 = t.strictInterface({
	input = t.enum(Enum.KeyCode),
	borderThemeKey = t.optional(t.string),
	textThemeKey = t.optional(t.string),
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	LayoutOrder = t.optional(t.integer),
	ZIndex = t.optional(t.integer)
})

local function getLabelWidthAndContent(p0, p1, p2)
	-- upvalues: t_1 (ref), roact (ref), imageSetLabel (ref), userInputService (ref), textService (ref), themedTextLabelModule (ref)
	local var9 = t_1[p0]
	
	if var9 and var9.image then
		return 36, roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = var9.image,
			ImageColor3 = p1.Theme.IconEmphasis.Color,
			ImageTransparency = p1.Theme.IconEmphasis.Transparency,
			Position = UDim2.new(0.5, 0, 0.5, -1),
			Size = UDim2.new(0, 16, 0, 16)
		})
	end
	local var14
	local _ = nil
	local _ = nil
	local _ = nil
	local alignment = nil
	local var10 = userInputService:GetStringForKeyCode(p0)
	local var11 = if var9 and var9.text then var9.text elseif var10 and var10 ~= "" then var10 else p0.Name
	local var12 = var11:len() < 3
	local var13 = if var9 and var9.fontKey then var9.fontKey elseif var12 then "CaptionHeader" else "Footer"
	
	if var9 and var9.width then
		var14 = var9.width
	elseif var12 then
		var14 = 36
	else
		local var15 = p1.Font[var13]
		var14 = textService:GetTextSize(var11, var15.RelativeSize * p1.Font.BaseSize, var15.Font, Vector2.new(1e999, 36)).X + 28
	end
	if var9 and var9.alignment then
		alignment = var9.alignment
	end
	return var14, roact.createElement(themedTextLabelModule, {
		fontKey = var13,
		themeKey = p2 or "TextEmphasis",
		Text = var11,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, -1),
		TextXAlignment = alignment
	}), alignment
end

return function(p3)
	-- upvalues: globalConfigModule (ref), var7 (ref), withStyle (ref), getLabelWidthAndContent (ref), roact (ref), imageSetLabel (ref), assetsModule (ref)
	if globalConfigModule.propValidation then
		assert(var7(p3))
	end
	return withStyle(function(p4)
		-- upvalues: p3 (ref), getLabelWidthAndContent (copy), roact (copy), imageSetLabel (copy), assetsModule (copy)
		local var16 = p4.Theme[p3.borderThemeKey or "UIEmphasis"]
		local var17, var18, var19 = getLabelWidthAndContent(p3.input, p4, p3.textThemeKey)
		local var20 = if var19 then 9 else nil
		
		return roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ImageTransparency = var16.Transparency,
			ImageColor3 = var16.Color,
			Image = assetsModule.Images.KeyBorder,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(Vector2.new(9, 7), Vector2.new(26, 26)),
			Size = UDim2.new(0, var17, 0, 36),
			Position = p3.Position,
			AnchorPoint = p3.AnchorPoint,
			LayoutOrder = p3.LayoutOrder,
			ZIndex = p3.ZIndex
		}, {
			Padding = var20 and roact.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var20),
				PaddingRight = UDim.new(0, var20)
			}),
			LabelContent = var18
		})
	end)
end