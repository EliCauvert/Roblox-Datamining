local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local ConstantsModule = require(script.Parent.Parent.Constants)
local Text = FoundationModule.Text
local FFlagAXMigrateBuilderIcons = require(Parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Icon (copy), FFlagAXMigrateBuilderIcons (copy), ConstantsModule (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Frame.Size or UDim2.fromOffset(UseTokensResult.Size.Size_2500, UseTokensResult.Size.Size_2500),
		LayoutOrder = Frame.LayoutOrder,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, -UseTokensResult.Padding.XSmall)
			}),
			Icon = ReactModule.createElement(Icon, {
				name = if FFlagAXMigrateBuilderIcons then ConstantsModule.Icons.Reset.name else ConstantsModule.Icons.Reset,
				variant = if FFlagAXMigrateBuilderIcons then ConstantsModule.Icons.Reset.variant else nil,
				size = IconSize.Medium,
				style = {
					Transparency = 0,
					Color3 = UseTokensResult.Color.Content.Muted.Color3
				}
			}),
			Text = if Frame.text then ReactModule.createElement(Text, {
				TextWrapped = true,
				Size = Frame.textStyles and Frame.textStyles.Size or UDim2.fromScale(1, 0),
				Text = Frame.text,
				AutomaticSize = Enum.AutomaticSize.Y,
				fontStyle = Frame.textStyles and Frame.textStyles.fontStyle or UseTokensResult.Typography.CaptionMedium,
				padding = UDim.new(0, UseTokensResult.Padding.Small)
			}) else nil
		})
	})
end