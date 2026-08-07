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

return reactModule.forwardRef(function(p0, p1) --[[ line: 29 ]]
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), useLocalization (ref), fFlagAXMigrateBuilderIcons (ref), isBuilderIcon (ref), reactModule (ref), foundationModule (ref), fFlagAXResetAvatarButton (ref)
	local var5 = useSemanticTokensModule()
	local var6, var7 = useHoverBindingModule()
	local var8 = if p0.radius then p0.radius else var5.defaultIconTextButtonRadius
	local var9 = useLocalization({ text = p0.localizedTextKey })
	local var10 = if var9.text then var9.text else p0.text
	local var11 = if p0.iconSize then p0.iconSize else var5.defaultIconSize
	local icon = fFlagAXMigrateBuilderIcons and isBuilderIcon(p0.icon)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy size-full-0 clip row gap-xsmall items-center",
		onActivated = p0.onActivated,
		isDisabled = p0.disabled,
		ref = p1,
		onStateChanged = var7,
		GroupTransparency = if fFlagAXResetAvatarButton then if p0.disabled then var5.contentDisabledTransparency else var5.contentForegroundStyle.Transparency else nil,
		backgroundStyle = var6:map(function(p2) --[[ line: 55 ]]
			-- upvalues: var5 (ref)
			return {
				Color3 = var5.hoverIconBackgroundStyle.Color3,
				Transparency = if p2 then var5.hoverIconBackgroundStyle.Transparency else 1
			}
		end),
		cornerRadius = UDim.new(0, var8),
		padding = {
			left = UDim.new(0, var5.textButtonPaddingLeft),
			right = UDim.new(0, var5.textButtonPaddingRight),
			top = UDim.new(0, var5.textButtonPaddingY),
			bottom = UDim.new(0, var5.textButtonPaddingY)
		},
		Visible = p0.Visible,
		LayoutOrder = p0.LayoutOrder
	}, {
		Icon = reactModule.createElement(foundationModule.View, {
			Size = UDim2.new(0, var5.iconTextButtonIconContainerSize, 0, var5.iconTextButtonIconContainerSize),
			tag = if fFlagAXMigrateBuilderIcons then {
				["radius-circle"] = true,
				["row align-x-center align-y-center"] = icon
			} else "radius-circle"
		}, {
			IconImage = if icon then reactModule.createElement(foundationModule.Icon, {
				tag = "position-center-center anchor-center-center",
				name = p0.icon,
				size = var11,
				style = var5.contentForegroundStyle
			}) else reactModule.createElement(foundationModule.Image, {
				tag = "position-center-center anchor-center-center",
				Image = p0.icon,
				Size = UDim2.new(0, var11, 0, var11),
				imageStyle = var5.contentForegroundStyle
			})
		}),
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-title-medium content-emphasis",
			Text = var10
		})
	})
end)