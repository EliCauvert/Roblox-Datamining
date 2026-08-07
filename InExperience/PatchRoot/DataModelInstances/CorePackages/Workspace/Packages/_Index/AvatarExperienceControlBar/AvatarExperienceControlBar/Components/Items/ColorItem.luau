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

local function getHoverTransparency(p0) --[[ line: 17 ]]
	return if p0 then 0 else 0.2
end

return reactModule.forwardRef(function(p1, p2) --[[ line: 32 | named "ColorItem" ]]
	-- upvalues: useSemanticTokensModule (ref), useHoverBindingModule (ref), reactModule (ref), foundationModule (ref), t (ref), getHoverTransparency (ref), colorGradientCircle (ref)
	local var7 = useSemanticTokensModule()
	local var8, var9 = useHoverBindingModule()
	local var10 = if p1.size then p1.size else var7.defaultIconContainerSize
	local var11 = if p1.colorSize then p1.colorSize else var10
	
	return reactModule.createElement(foundationModule.View, {
		ref = p2,
		LayoutOrder = p1.LayoutOrder,
		stateLayer = t,
		onStateChanged = if p1.disabled then nil else var9,
		onActivated = p1.onActivated,
		AutomaticSize = Enum.AutomaticSize.XY,
		disabled = p1.disabled,
		selection = { Selectable = p1.Selectable or false }
	}, {
		HoverHandler = reactModule.createElement(foundationModule.View, {
			tag = "padding-small radius-circle clip auto-xy",
			Size = UDim2.fromOffset(var10, var10),
			GroupTransparency = var8:map(getHoverTransparency),
			backgroundStyle = var8:map(function(p3) --[[ line: 51 ]]
				-- upvalues: var7 (ref), p1 (ref)
				return if p3 then var7.hoverIconBackgroundStyle elseif p1.isActive then var7.activeIconBackgroundStyle else {
					Transparency = 1,
					Color3 = var7.hoverIconBackgroundStyle.Color3
				}
			end)
		}, {
			ColorGradientCircle = reactModule.createElement(colorGradientCircle, {
				Colors = p1.colors,
				Size = UDim2.fromOffset(var11, var11),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	})
end)