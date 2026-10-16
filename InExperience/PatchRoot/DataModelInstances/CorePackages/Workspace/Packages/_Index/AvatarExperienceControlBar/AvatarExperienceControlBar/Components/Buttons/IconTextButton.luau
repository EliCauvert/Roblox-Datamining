local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseHoverBindingModule = require(AvatarExperienceControlBar.Hooks.useHoverBinding)
local IsBuilderIconFunction = FoundationModule.Utility.isBuilderIcon
local FFlagAXMigrateBuilderIcons = require(Parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons
local FFlagAXResetAvatarButton = require(Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return (ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 29 ]]
	-- upvalues: UseSemanticTokensModule (copy), UseHoverBindingModule (copy), UseLocalizationFunction (copy), FFlagAXMigrateBuilderIcons (copy), IsBuilderIconFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagAXResetAvatarButton (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseHoverBindingModuleResult, UseHoverBindingModuleResult2 = UseHoverBindingModule()
	local UseLocalizationResult = UseLocalizationFunction({ text = Frame.localizedTextKey })
	local IconSize = if Frame.iconSize then Frame.iconSize else UseSemanticTokensModuleResult.defaultIconSize
	local IsBuilderIcon = FFlagAXMigrateBuilderIcons and IsBuilderIconFunction(Frame.icon)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy size-full-0 clip row gap-xsmall items-center",
		onActivated = Frame.onActivated,
		isDisabled = Frame.disabled,
		ref = Ref,
		onStateChanged = UseHoverBindingModuleResult2,
		GroupTransparency = if FFlagAXResetAvatarButton then if Frame.disabled then UseSemanticTokensModuleResult.contentDisabledTransparency else UseSemanticTokensModuleResult.contentForegroundStyle.Transparency else nil,
		backgroundStyle = UseHoverBindingModuleResult:map(function(p1) --[[ Line: 55 ]]
			-- upvalues: UseSemanticTokensModuleResult (copy)
			return {
				Color3 = UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Color3,
				Transparency = if p1 then UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Transparency else 1
			}
		end),
		cornerRadius = UDim.new(0, if Frame.radius then Frame.radius else UseSemanticTokensModuleResult.defaultIconTextButtonRadius),
		padding = {
			left = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingLeft),
			right = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingRight),
			top = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingY),
			bottom = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingY)
		},
		Visible = Frame.Visible,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(FoundationModule.View, {
			Size = UDim2.new(0, UseSemanticTokensModuleResult.iconTextButtonIconContainerSize, 0, UseSemanticTokensModuleResult.iconTextButtonIconContainerSize),
			tag = if FFlagAXMigrateBuilderIcons then {
				["radius-circle"] = true,
				["row align-x-center align-y-center"] = IsBuilderIcon
			} else "radius-circle"
		}, {
			IconImage = if IsBuilderIcon then ReactModule.createElement(FoundationModule.Icon, {
				tag = "position-center-center anchor-center-center",
				name = Frame.icon,
				size = IconSize,
				style = UseSemanticTokensModuleResult.contentForegroundStyle
			}) else ReactModule.createElement(FoundationModule.Image, {
				tag = "position-center-center anchor-center-center",
				Image = Frame.icon,
				Size = UDim2.new(0, IconSize, 0, IconSize),
				imageStyle = UseSemanticTokensModuleResult.contentForegroundStyle
			})
		}),
		Text = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-title-medium content-emphasis",
			Text = if UseLocalizationResult.text then UseLocalizationResult.text else Frame.text
		})
	})
end))