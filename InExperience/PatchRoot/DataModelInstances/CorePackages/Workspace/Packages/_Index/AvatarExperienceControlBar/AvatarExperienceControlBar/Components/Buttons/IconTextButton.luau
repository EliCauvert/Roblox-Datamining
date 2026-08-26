local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useHoverBindingModule = require(avatarExperienceControlBar.Hooks.useHoverBinding)
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local fFlagAXMigrateBuilderIcons = require(parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons
local fFlagAXResetAvatarButton = require(parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), useLocalization (ref), fFlagAXMigrateBuilderIcons (ref), isBuilderIcon (ref), reactModule (ref), foundationModule (ref), fFlagAXResetAvatarButton (ref)
	local var1 = useSemanticTokensModule()
	local var2, var3 = useHoverBindingModule()
	local var4 = if p1.radius then p1.radius else var1.defaultIconTextButtonRadius
	local var5 = useLocalization({ text = p1.localizedTextKey })
	local var6 = if var5.text then var5.text else p1.text
	local var7 = if p1.iconSize then p1.iconSize else var1.defaultIconSize
	local icon = fFlagAXMigrateBuilderIcons and isBuilderIcon(p1.icon)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy size-full-0 clip row gap-xsmall items-center",
		onActivated = p1.onActivated,
		isDisabled = p1.disabled,
		ref = p2,
		onStateChanged = var3,
		GroupTransparency = if fFlagAXResetAvatarButton then if p1.disabled then var1.contentDisabledTransparency else var1.contentForegroundStyle.Transparency else nil,
		backgroundStyle = var2:map(function(p3)
			-- upvalues: var1 (ref)
			return {
				Color3 = var1.hoverIconBackgroundStyle.Color3,
				Transparency = if p3 then var1.hoverIconBackgroundStyle.Transparency else 1
			}
		end),
		cornerRadius = UDim.new(0, var4),
		padding = {
			left = UDim.new(0, var1.textButtonPaddingLeft),
			right = UDim.new(0, var1.textButtonPaddingRight),
			top = UDim.new(0, var1.textButtonPaddingY),
			bottom = UDim.new(0, var1.textButtonPaddingY)
		},
		Visible = p1.Visible,
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(foundationModule.View, {
			Size = UDim2.new(0, var1.iconTextButtonIconContainerSize, 0, var1.iconTextButtonIconContainerSize),
			tag = if fFlagAXMigrateBuilderIcons then {
				["radius-circle"] = true,
				["row align-x-center align-y-center"] = icon
			} else "radius-circle"
		}, {
			IconImage = if icon then reactModule.createElement(foundationModule.Icon, {
				tag = "position-center-center anchor-center-center",
				name = p1.icon,
				size = var7,
				style = var1.contentForegroundStyle
			}) else reactModule.createElement(foundationModule.Image, {
				tag = "position-center-center anchor-center-center",
				Image = p1.icon,
				Size = UDim2.new(0, var7, 0, var7),
				imageStyle = var1.contentForegroundStyle
			})
		}),
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-title-medium content-emphasis",
			Text = var6
		})
	})
end)