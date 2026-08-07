local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local constantsModule = require(script.Parent.Parent.Constants)
local text = foundationModule.Text
local fFlagAXMigrateBuilderIcons = require(parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons

return function(p0) --[[ line: 33 | named "ClearCategoryButton" ]]
	-- upvalues: useTokens (ref), reactModule (ref), icon (ref), fFlagAXMigrateBuilderIcons (ref), constantsModule (ref), iconSize (ref), text (ref)
	local var3 = useTokens()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p0.Size or UDim2.fromOffset(var3.Size.Size_2500, var3.Size.Size_2500),
		LayoutOrder = p0.LayoutOrder,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, -var3.Padding.XSmall)
			}),
			Icon = reactModule.createElement(icon, {
				name = if fFlagAXMigrateBuilderIcons then constantsModule.Icons.Reset.name else constantsModule.Icons.Reset,
				variant = if fFlagAXMigrateBuilderIcons then constantsModule.Icons.Reset.variant else nil,
				size = iconSize.Medium,
				style = {
					Transparency = 0,
					Color3 = var3.Color.Content.Muted.Color3
				}
			}),
			Text = if p0.text then reactModule.createElement(text, {
				TextWrapped = true,
				Size = if p0.textStyles then p0.textStyles.Size else UDim2.fromScale(1, 0),
				Text = p0.text,
				AutomaticSize = Enum.AutomaticSize.Y,
				fontStyle = if p0.textStyles then p0.textStyles.fontStyle else var3.Typography.CaptionMedium,
				padding = UDim.new(0, var3.Padding.Small)
			}) else nil
		})
	})
end