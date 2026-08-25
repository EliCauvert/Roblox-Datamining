local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useHoverBindingModule = require(avatarExperienceControlBar.Hooks.useHoverBinding)
local colorItemModule = require(avatarExperienceControlBar.Components.Items.ColorItem)

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), useLocalization (ref), reactModule (ref), foundationModule (ref), colorItemModule (ref)
	local var6 = useSemanticTokensModule()
	local var7, var8 = useHoverBindingModule()
	local var9 = useLocalization({ text = p0.localizedTextKey })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy size-full-0 clip row gap-xsmall items-center",
		onActivated = p0.onActivated,
		isDisabled = p0.disabled,
		ref = p1,
		onStateChanged = var8,
		backgroundStyle = var7:map(function(p2)
			-- upvalues: var6 (ref)
			return {
				Color3 = var6.hoverIconBackgroundStyle.Color3,
				Transparency = if p2 then var6.hoverIconBackgroundStyle.Transparency else 1
			}
		end),
		padding = {
			left = UDim.new(0, var6.textButtonPaddingLeft),
			right = UDim.new(0, var6.textButtonPaddingRight),
			top = UDim.new(0, var6.textButtonPaddingY),
			bottom = UDim.new(0, var6.textButtonPaddingY)
		},
		cornerRadius = UDim.new(0, if p0.radius then p0.radius else var6.defaultIconTextButtonRadius),
		Visible = p0.Visible,
		LayoutOrder = p0.LayoutOrder
	}, {
		Color = reactModule.createElement(colorItemModule, {
			disabled = true,
			Selectable = false,
			colors = p0.colors,
			size = p0.size,
			colorSize = p0.colorSize,
			onActivated = p0.onActivated
		}),
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-title-medium content-emphasis",
			Text = if var9.text then var9.text else p0.text
		})
	})
end)