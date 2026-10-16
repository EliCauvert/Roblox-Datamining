local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseHoverBindingModule = require(AvatarExperienceControlBar.Hooks.useHoverBinding)
local ColorItemModule = require(AvatarExperienceControlBar.Components.Items.ColorItem)

return (ReactModule.forwardRef(function(Frame, Ref) --[[ Line: 27 ]]
	-- upvalues: UseSemanticTokensModule (copy), UseHoverBindingModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), ColorItemModule (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseHoverBindingModuleResult, UseHoverBindingModuleResult2 = UseHoverBindingModule()
	local UseLocalizationResult = UseLocalizationFunction({ text = Frame.localizedTextKey })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy size-full-0 clip row gap-xsmall items-center",
		onActivated = Frame.onActivated,
		isDisabled = Frame.disabled,
		ref = Ref,
		onStateChanged = UseHoverBindingModuleResult2,
		backgroundStyle = UseHoverBindingModuleResult:map(function(p1) --[[ Line: 44 ]]
			-- upvalues: UseSemanticTokensModuleResult (copy)
			return {
				Color3 = UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Color3,
				Transparency = if p1 then UseSemanticTokensModuleResult.hoverIconBackgroundStyle.Transparency else 1
			}
		end),
		padding = {
			left = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingLeft),
			right = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingRight),
			top = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingY),
			bottom = UDim.new(0, UseSemanticTokensModuleResult.textButtonPaddingY)
		},
		cornerRadius = UDim.new(0, if Frame.radius then Frame.radius else UseSemanticTokensModuleResult.defaultIconTextButtonRadius),
		Visible = Frame.Visible,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Color = ReactModule.createElement(ColorItemModule, {
			disabled = true,
			Selectable = false,
			colors = Frame.colors,
			size = Frame.size,
			colorSize = Frame.colorSize,
			onActivated = Frame.onActivated
		}),
		Text = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-title-medium content-emphasis",
			Text = if UseLocalizationResult.text then UseLocalizationResult.text else Frame.text
		})
	})
end))