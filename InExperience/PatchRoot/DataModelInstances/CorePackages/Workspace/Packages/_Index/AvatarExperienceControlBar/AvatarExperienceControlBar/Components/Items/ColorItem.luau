local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local colorGradientCircle = require(parent.AvatarExperienceCommon).Components.ColorGradientCircle
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local useHoverBindingModule = require(avatarExperienceControlBar.Hooks.useHoverBinding)
local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function getHoverTransparency(p1)
	return if p1 then 0 else 0.2
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), reactModule (ref), foundationModule (ref), t (ref), getHoverTransparency (ref), colorGradientCircle (ref)
	local var1 = useSemanticTokensModule()
	local var2, var3 = useHoverBindingModule()
	local var4 = if p1.size then p1.size else var1.defaultIconContainerSize
	local var5 = if p1.colorSize then p1.colorSize else var4
	
	return reactModule.createElement(foundationModule.View, {
		ref = p2,
		LayoutOrder = p1.LayoutOrder,
		stateLayer = t,
		onStateChanged = if p1.disabled then nil else var3,
		onActivated = p1.onActivated,
		AutomaticSize = Enum.AutomaticSize.XY,
		disabled = p1.disabled,
		selection = { Selectable = p1.Selectable or false }
	}, {
		HoverHandler = reactModule.createElement(foundationModule.View, {
			tag = "padding-small radius-circle clip auto-xy",
			Size = UDim2.fromOffset(var4, var4),
			GroupTransparency = var2:map(getHoverTransparency),
			backgroundStyle = var2:map(function(p3)
				-- upvalues: var1 (ref), p1 (ref)
				return if p3 then var1.hoverIconBackgroundStyle elseif p1.isActive then var1.activeIconBackgroundStyle else {
					Transparency = 1,
					Color3 = var1.hoverIconBackgroundStyle.Color3
				}
			end)
		}, {
			ColorGradientCircle = reactModule.createElement(colorGradientCircle, {
				Colors = p1.colors,
				Size = UDim2.fromOffset(var5, var5),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	})
end)