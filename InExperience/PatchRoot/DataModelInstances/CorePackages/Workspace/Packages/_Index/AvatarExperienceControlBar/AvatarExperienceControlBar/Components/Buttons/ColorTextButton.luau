local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useHoverBindingModule = require(avatarExperienceControlBar.Hooks.useHoverBinding)
local colorItemModule = require(avatarExperienceControlBar.Components.Items.ColorItem)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), useLocalization (ref), reactModule (ref), foundationModule (ref), colorItemModule (ref)
	local var1 = useSemanticTokensModule()
	local var2, var3 = useHoverBindingModule()
	local var4 = useLocalization({ text = p1.localizedTextKey })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy size-full-0 clip row gap-xsmall items-center",
		onActivated = p1.onActivated,
		isDisabled = p1.disabled,
		ref = p2,
		onStateChanged = var3,
		backgroundStyle = var2:map(function(p3)
			-- upvalues: var1 (ref)
			return {
				Color3 = var1.hoverIconBackgroundStyle.Color3,
				Transparency = if p3 then var1.hoverIconBackgroundStyle.Transparency else 1
			}
		end),
		padding = {
			left = UDim.new(0, var1.textButtonPaddingLeft),
			right = UDim.new(0, var1.textButtonPaddingRight),
			top = UDim.new(0, var1.textButtonPaddingY),
			bottom = UDim.new(0, var1.textButtonPaddingY)
		},
		cornerRadius = UDim.new(0, if p1.radius then p1.radius else var1.defaultIconTextButtonRadius),
		Visible = p1.Visible,
		LayoutOrder = p1.LayoutOrder
	}, {
		Color = reactModule.createElement(colorItemModule, {
			disabled = true,
			Selectable = false,
			colors = p1.colors,
			size = p1.size,
			colorSize = p1.colorSize,
			onActivated = p1.onActivated
		}),
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-title-medium content-emphasis",
			Text = if var4.text then var4.text else p1.text
		})
	})
end)